package main.ict.recipe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.ict.recipe.service.RecipeService;
import main.ict.recipe.vo.RecipeVO;
import main.ict.warning.vo.WarningVO;
import main.ict.common.ChabunUtils;
import main.ict.common.CommonUtils;
import main.ict.common.ConstPack;
import main.ict.common.FileUpload;
import main.ict.common.O_Session;
import main.ict.common.chabun.service.ChabunService;
import main.ict.hit.service.HitService;
import main.ict.hit.vo.HitVO;
import main.ict.like.service.LikeService;
import main.ict.like.vo.LikeVO;

@Controller
public class RecipeController {

	Logger logger = LogManager.getLogger(RecipeController.class);
	
	@Autowired(required=false)
	public RecipeService recipeService;
	
	@Autowired(required=false)
	public ChabunService chabunService;
	
	@Autowired(required=false)
	private LikeService likeService;
	
	@Autowired(required=false)
	private HitService hitService;
	
// I Form
	@GetMapping(value="recipeInsertForm")
	public String recipeInsertForm() {  // 세션 처리 필요
		
		logger.info("recipeInsertForm() 함수 진입");
		
		return "./recipe/recipeInsertForm";
	}
	
// I
	@PostMapping(value="recipeInsert")
	public String recipeInsert(HttpServletRequest req, Model model) {
		
		logger.info("recipeInsert() 함수 진입");
		
		FileUpload rfu = new FileUpload(ConstPack.RECIPE_IMG_PATH,
										ConstPack.RECIPE_IMG_SIZE,
										ConstPack.RECIPE_ENC_TYPE);

		boolean bool = rfu.imgFileUpload(req);
		String rphoto = "";
		if (!bool) {
			logger.info("[FAIL] POST Request.");
			return "#";
		}
		
		// VO setting
		RecipeVO recipevo = new RecipeVO();
		
		String rnum = ChabunUtils.getRecipeChabun("D", chabunService.getRecipeChabun().getRnum());
		recipevo.setRnum(rnum);
		
		recipevo.setRsubject(rfu.getParameter("rsubject"));
		recipevo.setRcategory(rfu.getParameter("rcategory"));
		recipevo.setRjeryo(rfu.getParameter("rjeryo"));
		
		String rhour = rfu.getParameter("rhour");
		String rminute = rfu.getParameter("rminute");
		StringBuffer sb = new StringBuffer();
		String rtime = CommonUtils.hourToMinutes(rhour, rminute);
		recipevo.setRtime(rtime);
		
		recipevo.setRperson(rfu.getParameter("rperson"));
		recipevo.setRdiff(rfu.getParameter("rdiff"));
		recipevo.setRcontent(rfu.getParameter("rcontent"));
		recipevo.setRphoto(rfu.getFileName("rphoto"));
		recipevo.setRhit(rfu.getParameter("rhit"));
		
		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(req);
		
		recipevo.setMnum(mnum);  // TODO TEMP -----------------------------
		logger.info("rmnum : " + recipevo.getRnum());
		logger.info("mnum >>>>>>>>>>>>>>>: " + mnum);
		
		recipevo.setWarning("0");
		
		logger.info(recipevo.toString());

		// INSERT
		int nCnt = recipeService.recipeInsert(recipevo);
		logger.info("nCnt: " + nCnt);
		if (nCnt < 1) {
			logger.info("[FAIL] Recipe INSERT");
			return "#";
		}
		
		List<RecipeVO> recipeList = new ArrayList<RecipeVO>();
		recipeList.add(recipevo);
		model.addAttribute("rnum", rnum);
		model.addAttribute("recipeList", recipeList);
		// TODO 추후 좋아요, 싫어요, 신고, 댓글 추가 필요
		return "./recipe/recipeInsert";
	}
	
// S_ALL
	@GetMapping(value="recipeSelectAll")
	public String recipeSelectAll(RecipeVO recipevo, Model model) {
		
		logger.info("recipeSelectAll() 함수 진입.");
		
		recipevo.setPageSize(String.valueOf(ConstPack.RECIPE_PAGE_SIZE));
		recipevo.setGroupSize(String.valueOf(ConstPack.RECIPE_GROUP_SIZE));
		if(recipevo.getCurPage() == null) {
			recipevo.setCurPage(String.valueOf(ConstPack.RECIPE_CUR_PAGE));
		}//end of if
		
		// 1. 값 불러와서 model
		List<RecipeVO> recipeList = recipeService.recipeSelectAll(recipevo);
		if (recipeList == null || recipeList.size() < 1) {
			logger.info("[FAIL] Recipe SelectAll");
			return "#";
		}
//		logger.info(recipeList.toString());
		
		model.addAttribute("pagingVO", recipevo);
		model.addAttribute("recipeList", recipeList);
		// TODO 페이징, 조건 검색(?)
		return "./recipe/recipeSelectAll";
	}

// S
	@GetMapping(value="recipeSelectContent")
	public String recipeSelectContent(HttpServletRequest req, HttpServletResponse res, RecipeVO recipevo, Model model) {
		
		logger.info("recipeSelectContent() 함수 진입");
//		logger.info(recipevo.toString());  // RecipeVO [rnum=R202212210004, ..., mnum=M202212200005]
		
		//조회 수 올리기============================================
		String boardNum = recipevo.getRnum();
		String boardFlag = boardNum.substring(0, 1);
		logger.info("boardNum : " + boardNum);
		logger.info("boardFlag : " + boardFlag);
		
		HitVO hvo = null;
		hvo = new HitVO();
		hvo.setBoardNum(boardNum);
		hvo.setBoardFlag(boardFlag);
		
		//조회 이력들이 담기는 쿠키 객체 배열
		Cookie[] cookies = req.getCookies();
		
		//생성된 쿠키가 두개(JSESSIONID, visit)라면
		if(cookies.length == 2) {
			System.out.println("cookies.length == 2");
			//파이썬에서 for i in list: 와 비슷
			for(Cookie cookie : cookies) {
				//가져온 cookie라는 쿠키의 이름이 JSESSIONID 아니라면
				if(!cookie.getName().equals("JSESSIONID")) {
					System.out.println("!cookie.getName().equals(\"JSESSIONID\")");
					//회원이 현재 보려는 게시글을 조회한 이력이 없다면
					if(!cookie.getValue().contains(hvo.getBoardNum())) {
						System.out.println("!cookie.getValue().contains(hvo.getBoardNum())");
						//쿠키의 Value에 _을 구분자로 조회한 게시글 번호를 문자열로써 붙임
						cookie.setValue(cookie.getValue() + "_" + hvo.getBoardNum());
						cookie.setMaxAge(60*60*24); //쿠키 지속 시간: 24시간
						//쿠키를 response에 추가
						res.addCookie(cookie);
						//조회 수 올리기 서비스 호출
						hitService.hitUp(hvo);
					}//end of inner if
				}//end of out if
			}//end of for
		//생성된 쿠키가 한개(JESSIONID) 밖에 없다면
		}else {
			System.out.println("cookies.length != 2");
			//새로운 쿠키 생성 : 쿠키 이름은 visit / 쿠키에 담기는 값은 해당 글 번호
			Cookie newCookie = new Cookie("visit", hvo.getBoardNum());
			newCookie.setMaxAge(60*60*24); //쿠키 지속 시간: 24시간
			//쿠키를 response에 추가
			res.addCookie(newCookie);
			//조회 수 올리기 서비스 호출
			hitService.hitUp(hvo);
		}//end of outer if-else
		//조회 수 올리기============================================
		
		//좋아요 체크
		LikeVO lvo = null;
		lvo = new LikeVO();
		O_Session os = O_Session.getInstance();
		
		lvo.setMnum(os.getSession(req));
		lvo.setLikethis(req.getParameter("rnum"));
		List<LikeVO> likeList = likeService.likeCheck(lvo);
		if(likeList.size() == 1) {
			model.addAttribute("likeList", likeList);
		}//end of if
		
		List<RecipeVO> recipeList = recipeService.recipeSelectContent(recipevo);
		if (recipeList == null || recipeList.size() != 1) {
			logger.info("recipeList is invalid.");
			return "#";
		}
		
		logger.info("[SUCCESS] Recipe");
		model.addAttribute("recipeList", recipeList);
		return "./recipe/recipeSelectContent";
	}
	
// U Form
	@PostMapping(value="recipeUpdateForm")
	public String recipeUpdateForm(RecipeVO recipevo, Model model) {
		
		logger.info("recipeUpdateForm() 함수 진입");
		
		// (O) rnum, rhit, mnum, updatedate, (X) warning, deleteyn, insertdate 
		// (221224) rnum, rhit, mnum, updatedate
		logger.info(recipevo.toString());
		model.addAttribute("recipevo", recipevo);
		return "./recipe/recipeUpdateForm";
	}
	
// U
	@PostMapping(value="recipeUpdate")
	public String recipeUpdate(HttpServletRequest req, RecipeVO recipevo, Model model) {
		
		logger.info("recipeUpdate() 함수 진입");
		logger.info(recipevo.toString());
		
		String rhour = req.getParameter("rhour");
		String rminute = req.getParameter("rminute");
		String rtime = CommonUtils.hourToMinutes(rhour, rminute);
		recipevo.setRtime(rtime);
		int nCnt = recipeService.recipeUpdate(recipevo);
		logger.info("[Recipe Update] Count: " + nCnt);
		if (nCnt < 1) {  // FAIL
			return "#";
		}
		
		List<RecipeVO> recipeList = new ArrayList<RecipeVO>();
		recipeList.add(recipevo);
		
		model.addAttribute("recipeList", recipeList);
		return "./recipe/recipeSelectContent";
	}
	
// D
	@PostMapping(value="recipeDelete")
	public String recipeDelete(RecipeVO recipevo, Model model) {
		
		logger.info("recipeDelete() 함수 진입");
		
		recipevo.setPageSize(String.valueOf(ConstPack.RECIPE_PAGE_SIZE));
		recipevo.setGroupSize(String.valueOf(ConstPack.RECIPE_GROUP_SIZE));
		if(recipevo.getCurPage() == null) {
			recipevo.setCurPage(String.valueOf(ConstPack.RECIPE_CUR_PAGE));
		}//end of if
		
		int nCnt = recipeService.recipeDelete(recipevo);
		logger.info("[Recipe Delete] Count: " + nCnt);
		if (nCnt < 1) {  // FAIL
			return "#";
		}
		
		List<RecipeVO> recipeList = recipeService.recipeSelectAll(recipevo);
		model.addAttribute("pagingVO", recipevo);
		model.addAttribute("recipeList", recipeList);
		return "./recipe/recipeSelectAll";
	}
	
// S (재료 검색) by 이성일
	@GetMapping(value="recipeSearch")
	public String recipeSearch(HttpServletRequest req, Model m) {
		
		logger.info("recipeSearch() 함수 진입");
		List<String> rList = null;
		RecipeVO rvo = null;
		String[] rjeryo = null;
		
		if(req.getParameterValues("rjeryo") !=null)
			rjeryo = req.getParameterValues("rjeryo");
		
		if(rjeryo !=null && rjeryo.length > 0) {
			rList = new ArrayList<String>();
			for(int i=0; i < rjeryo.length; i++) {
				rList.add(rjeryo[i]);
			}
		}
		
		if(rList !=null && rList.size() > 0) {
			for(int i=0; i < rList.size(); i++) {
				logger.info("rList[" + i + "] : " + rList.get(i));
			}
		}
		
		List<RecipeVO> list = recipeService.recipeSearch(rList);
		
		if(list !=null && list.size() > 0) {
			for(int i=0; i < list.size(); i++) {
				rvo = list.get(i);
				logger.info("rvo " + i + "번 : " + rvo.toString());
			}
			
			m.addAttribute("list", list);
		}
		
		return "./recipe/recipeSearch";
	}
	
	@GetMapping(value="recipeWarningForm")
	public String recipeWarningForm(HttpServletRequest req, RecipeVO recipevo, Model m) {
		
		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(req);
		recipevo.setMnum(mnum);
		m.addAttribute("rvo", recipevo);
		
		return "recipe/recipeWarningForm";
	}

	@GetMapping(value="recipeWarningInsert")
	public String recipeWarningInsert(WarningVO wvo) {
		
		System.out.println("wvo.getWtnum : " + wvo.getWtnum());
		System.out.println("wvo.getWcategory : " + wvo.getWcategory());
		System.out.println("wvo.getWcontent : " + wvo.getWcontent());
		
		String wnum = ChabunUtils.getWarningChabun("D", chabunService.getWarningChabun().getWnum());
		System.out.println("wnum : " + wnum);
		wvo.setWnum(wnum);
		
		int nCnt = recipeService.recipeWarningInsert(wvo);
		
		if(nCnt > 0) {
			
			return "recipe/recipeWarningInsert";
		}
		
		
		return "";
	}


}