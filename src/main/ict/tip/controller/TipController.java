package main.ict.tip.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import main.ict.common.ChabunUtils;
import main.ict.common.ConstPack;
import main.ict.common.FileUpload;
import main.ict.common.O_Session;
import main.ict.common.chabun.service.ChabunService;
import main.ict.hit.service.HitService;
import main.ict.hit.vo.HitVO;
import main.ict.like.service.LikeService;
import main.ict.like.vo.LikeVO;
import main.ict.mem.vo.MemVO;
import main.ict.tip.service.TipService;
import main.ict.tip.vo.TipVO;
import main.ict.warning.vo.WarningVO;

@Controller
public class TipController {
	private Logger logger = LogManager.getLogger(TipController.class);
	
	@Autowired(required=false)
	private TipService tipService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	@Autowired(required=false)
	private LikeService likeService;
	
	@Autowired(required=false)
	private HitService hitService;
	
	@GetMapping(value="tipInsertForm")
	public String tipInsertForm() {
		logger.info("tipInsertForm() 함수 진입");
		return "tip/tipInsertForm";
	}
	
	@PostMapping(value="tipInsert")
	public String tipInsert(HttpServletRequest req, Model m) {
		logger.info("tipInsert() 함수 진입");
		
		// 채번 로직 추가하기
		String tnum = ChabunUtils.getTipChabun("D", chabunService.getTipChabun().getTnum());
		logger.info("채번 결과 tnum : " + tnum);
		
		// 파일 업로드 추가하기
		FileUpload fu = new FileUpload( ConstPack.TIP_IMG_PATH
					,ConstPack.TIP_IMG_SIZE
					,ConstPack.TIP_ENC_TYPE);
		
		boolean bool = fu.imgFileUpload(req);
		logger.info("tipInsert() bool : " + bool);
		
		TipVO tvo = null;
		tvo = new TipVO();
		
		tvo.setTnum(tnum);
		tvo.setTsubject(fu.getParameter("tsubject"));
		tvo.setTcontent(fu.getParameter("tcontent"));
		tvo.setTcategory(fu.getParameter("tcategory"));
		tvo.setTphoto(fu.getFileName("tphoto"));
		
		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(req);
		logger.info("mnum >>>> : " + mnum);
		
		tvo.setMnum(mnum);
		
		// 파일 업로드 체크
		if(tvo.getTphoto() == null)
			tvo.setTphoto("no_img.jpg");
		
		logger.info("tvo 프로퍼티 : \n" + tvo.toString());
		int insertResult = tipService.tipInsert(tvo);

		if(insertResult == 1) {
			logger.info("인서트가 " + insertResult + "건 되었습니다.");
			m.addAttribute("tnum", tvo.getTnum());
			return "tip/tipInsert";
		}
		
		return "tip/tipInsertForm";
	}
	
	@GetMapping(value="tipSelectAll")
	public String tipSelectAll(TipVO _tvo, Model m) {
		logger.info("tipSelectAll() 함수 진입");
		
		_tvo.setPageSize(String.valueOf(ConstPack.TIP_PAGE_SIZE));
		_tvo.setGroupSize(String.valueOf(ConstPack.TIP_GROUP_SIZE));
		if(_tvo.getCurPage() == null) {
			_tvo.setCurPage(String.valueOf(ConstPack.TIP_CUR_PAGE));
		}//end of if
		
		//searching 프로퍼티 null값 방지
		if(_tvo.getSearchCategory() == null || _tvo.getSearchCategory() == "null") {
			_tvo.setSearchCategory("");
		}//end of if
		if(_tvo.getKeyword() == null || _tvo.getKeyword() == "null") {
			_tvo.setKeyword("");
		}//end of if
		if(_tvo.getStartDate() == null || _tvo.getStartDate() == "null") {
			_tvo.setStartDate("");
		}//end of if
		if(_tvo.getEndDate() == null || _tvo.getEndDate() == "null") {
			_tvo.setEndDate("");
		}//end of if
		
		logger.info("searchCategory : " + _tvo.getSearchCategory());
		logger.info("keyword : " + _tvo.getKeyword());
		logger.info("startDate : " + _tvo.getStartDate());
		logger.info("endDate : " + _tvo.getEndDate());
		
		List<TipVO> list = tipService.tipSelectAll(_tvo);
		TipVO tvo = null;
		
		if(list !=null && list.size() > 0) {
			for(int i=0; i < list.size(); i++) {
				tvo = list.get(i);
				logger.info("VO : \n" + tvo.toString());
			}

			//return "tip/tipSelectAll";
		}

		m.addAttribute("pagingVO", _tvo);
		m.addAttribute("list", list);
		
		return "tip/tipSelectAll";
	}
	
	@GetMapping(value="tipSelectContent")
	public String tipSelectAllForm(HttpServletRequest req, HttpServletResponse res, TipVO tvo, Model m) {
		logger.info("tipSelectContent");
		logger.info(tvo.getTnum());
		
		//조회 수 올리기============================================
		String boardNum = tvo.getTnum();
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
		lvo.setLikethis(tvo.getTnum());
		List<LikeVO> likeList = likeService.likeCheck(lvo);
		if(likeList.size() == 1) {
			m.addAttribute("likeList", likeList);
		}//end of if
		
		List<TipVO> list = tipService.tipSelectContent(tvo);
		
			logger.info(list.get(0).getMnum());

		if(list !=null && list.size() == 1) {
			m.addAttribute("list", list);
			return "tip/tipSelectContent";
		}
		
		return "tip/tipSelectAll";
	}
	
	@GetMapping(value="tipUpdateForm")
	public String tipUpdateForm(TipVO tvo, Model m) {
		logger.info("tipUpdateForm() 함수 진입");
		
		logger.info("수정할 글번호 PK : " + tvo.getTnum());
		List<TipVO> list = tipService.tipUpdateForm(tvo);
		
		if(list !=null && list.size() == 1) {
			logger.info(list.get(0).toString());
			m.addAttribute("list", list);
			return "tip/tipUpdateForm";
		}
		
		return "tip/SelectAll";
	}
	
	@PostMapping(value="tipUpdate")
	public String tipUpdate(HttpServletRequest req, Model m) {
		logger.info("tipUpdate() 함수 진입");
		
		// 파일 업로드 추가하기
		FileUpload fu = new FileUpload( ConstPack.TIP_IMG_PATH
					,ConstPack.TIP_IMG_SIZE
					,ConstPack.TIP_ENC_TYPE);
		
		boolean bool = fu.imgFileUpload(req);
		logger.info("tipInsert() bool : " + bool);
		
		TipVO tvo = null;
		tvo = new TipVO();
		
		tvo.setTnum(fu.getParameter("tnum"));
		tvo.setTsubject(fu.getParameter("tsubject"));
		tvo.setTcontent(fu.getParameter("tcontent"));
		tvo.setTcategory(fu.getParameter("tcategory"));
		tvo.setTphoto(fu.getFileName("tphoto"));
		
		logger.info("tvo : " + tvo.toString());
		
		if(tvo.getTphoto() == null)
			tvo.setTphoto("no_img.jpg");
		
		int updateCnt = tipService.tipUpdate(tvo);
		if(updateCnt == 1) {
			logger.info("업데이트가 " + updateCnt + "건 되었습니다");
			m.addAttribute("tnum", tvo.getTnum());
			return "tip/tipUpdate";
		}else {
			logger.info("업데이트 실패");
			List<TipVO> list = tipService.tipSelectContent(tvo);
			m.addAttribute("list", list);
			return "tip/tipSelectContent";
		}
	}
	
	@GetMapping(value="tipDelete")
	public String tipDelete(TipVO tvo, Model m) {
		logger.info("tipDelete() 함수 진입");
		
		int deleteCnt = tipService.tipDelete(tvo);
		if(deleteCnt == 1) {
			logger.info("삭제가 " + deleteCnt + "건 되었습니다.");
			return "tip/tipDelete";
		}else {
			logger.info("삭제 실패");
			List<TipVO> list = tipService.tipSelectContent(tvo);
			m.addAttribute("list", list);
			return "tip/tipSelectContent";
		}
	}

	@GetMapping(value="tipWarningForm")
	public String tipWarningForm(HttpServletRequest req, TipVO tvo, Model m) {
		
		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(req);
		tvo.setMnum(mnum);
		m.addAttribute("tvo", tvo);
		
		return "tip/tipWarningForm";
	}
	
	@GetMapping(value="tipWarningInsert")
	public String warningInsert(WarningVO wvo, Model m) {
		
		System.out.println("wvo.getWtnum : " + wvo.getWtnum());
		System.out.println("wvo.getWcategory : " + wvo.getWcategory());
		System.out.println("wvo.getWcontent : " + wvo.getWcontent());
		
		
		String wnum = ChabunUtils.getWarningChabun("D", chabunService.getWarningChabun().getWnum());
		System.out.println("wnum : " + wnum);
		wvo.setWnum(wnum);
	
		int nCnt = tipService.tipWarningInsert(wvo);
		
		if(nCnt > 0) {
			
			return "tip/tipWarningInsert";
		}
		
		return "";
	}
	
	//세션
	@GetMapping("tipsession")
	@ResponseBody
	public Object tipsession(HttpServletRequest req, MemVO mvo) {
		
		String mnum = req.getParameter("mnum");
		logger.info("mnum  >>>>>> : " + mnum);
		mvo.setMnum(mnum);
		logger.info("mnum  >>>>>> : " + mvo.getMnum());
		
		List<MemVO> list = tipService.tipSession(mvo);
		
		String mgrade = list.get(0).getMgrade();
		logger.info("mgrade >>> : " + mgrade);	
		
		return mgrade;				
		
	}
}
