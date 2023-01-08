package main.ict.notice.controller;

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

import main.ict.common.ChabunUtils;
import main.ict.common.ConstPack;
import main.ict.common.FileUpload;
import main.ict.common.O_Session;
import main.ict.common.chabun.service.ChabunService;
import main.ict.hit.service.HitService;
import main.ict.hit.vo.HitVO;
import main.ict.like.service.LikeService;
import main.ict.like.vo.LikeVO;
import main.ict.notice.service.NoticeService;
import main.ict.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	Logger logger = LogManager.getLogger(NoticeController.class);
	
	@Autowired(required=false)
	private NoticeService noticeService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	@Autowired(required=false)
	private LikeService likeService;
	
	@Autowired(required=false)
	private HitService hitService;
	
	//글쓰기 폼 이동
	@GetMapping(value="noticeInsertForm")
	public String noticeInsertForm() {
		logger.info("noticeInsertForm() 함수 진입 : ");
		return "notice/noticeInsertForm";
	}//end of noticeInsertForm() method
	
	//INSERT
	@PostMapping(value="noticeInsert")
	public String noticeInsert(HttpServletRequest req) {
		logger.info("noticeInsert() 함수 진입 : ");
		
		//파일 업로드
		FileUpload fu = new FileUpload( ConstPack.NOTICE_IMG_PATH,
										ConstPack.NOTICE_IMG_SIZE,
										ConstPack.NOTICE_ENC_TYPE);
		
		boolean bool = fu.imgFileUpload(req);
		logger.info("noticeInsert() -> bool : " + bool);
		
		NoticeVO nvo = null;
		nvo = new NoticeVO();
		
		//채번 매기기
		String nnum = ChabunUtils.getNoticeChabun("d", chabunService.getNoticeChabun().getNnum());
		
		//VO에 값 넣기
		
		nvo.setNnum(nnum);
		nvo.setNsubject(fu.getParameter("nsubject"));
		nvo.setNcontent(fu.getParameter("ncontent"));
		nvo.setNphoto(fu.getFileName("nphoto"));
		
		if(nvo.getNphoto() == null)
			nvo.setNphoto("noimg.png");
		
		
		//서비스 호출
		int insertCnt = noticeService.noticeInsert(nvo);
		
		if(insertCnt == 1) {
			logger.info("insertCnt : " + insertCnt);
			return "notice/noticeInsert";
		}//end of if
		
		return "notice/noticeInsertForm";
	}//end of noticeInsert() method
	
	//SELECT ALL
	@GetMapping(value="noticeSelectAll")
	public String noticeSelectAll(NoticeVO nvo, Model model) {
		logger.info("noticeSelectAll() 함수 진입 : ");
		
		//페이징 프로퍼티 값 넣기
		nvo.setPageSize(String.valueOf(ConstPack.NOTICE_PAGE_SIZE));
		nvo.setGroupSize(String.valueOf(ConstPack.NOTICE_GROUP_SIZE));
		if(nvo.getCurPage() == null) {
			nvo.setCurPage(String.valueOf(ConstPack.NOTICE_CUR_PAGE));
		}//end of if
		
		//searching 프로퍼티 null값 방지
		if(nvo.getKeyword() == null || nvo.getKeyword() == "null") {
			nvo.setKeyword("");
		}//end of if
		if(nvo.getStartDate() == null || nvo.getStartDate() == "null") {
			nvo.setStartDate("");
		}//end of if
		if(nvo.getEndDate() == null || nvo.getEndDate() == "null") {
			nvo.setEndDate("");
		}//end of if
		
		//서비스 호출
		List<NoticeVO> sallList = noticeService.noticeSelectAll(nvo);
		
		if(sallList.size() > 0) {
			logger.info("sallList.size() : " + sallList.size());
			//조회 결과 Attribute
			model.addAttribute("sallList", sallList);
			//페이징 관련 Attribute
			model.addAttribute("pagingVO", nvo);
			return "notice/noticeSelectAll";
		}//end of if
		
		return "notice/noticeSelectAll";
	}//end of noticeSelectAll() method
	
	//SELECT CONTENT
	@GetMapping(value="noticeSelectContent")
	public String noticeSelectContent(HttpServletRequest req, HttpServletResponse res, NoticeVO nvo, Model model) {
		logger.info("noticeSelectContent() 함수 진입 : ");
		logger.info("nvo.getNnum() : " + nvo.getNnum());
		
		//조회 수 올리기============================================
		String boardNum = nvo.getNnum();
		logger.info("boardNum : " + boardNum);
		String boardFlag = boardNum.substring(0, 1);
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
		lvo.setLikethis(nvo.getNnum());
		List<LikeVO> likeList = likeService.likeCheck(lvo);
		if(likeList.size() == 1) {
			model.addAttribute("likeList", likeList);
		}//end of if
		
		//서비스 호출
		List<NoticeVO> scontList = noticeService.noticeSelectContent(nvo);
		
		if(scontList.size() > 0) {
			logger.info("scontList.size() : " + scontList.size());
			model.addAttribute("scontList", scontList);
			return "notice/noticeSelectContent";
		}//end of if
		
		return "notice/noticeSelectAll";
	}//end of noticeSelectContent() method
	
	//글 수정 폼 이동
	@GetMapping(value="noticeUpdateForm")
	public String noticeUpdateForm(NoticeVO nvo, Model model) {
		logger.info("noticeUpdateForm() 함수 진입 : ");
		logger.info("nvo.getNnum() : " + nvo.getNnum());
		
		//서비스 호출
		List<NoticeVO> updateList = noticeService.noticeSelectContent(nvo);
		
		if(updateList.size() > 0) {
			logger.info("scontList.size() : " + updateList.size());
			model.addAttribute("updateList", updateList);
			return "notice/noticeUpdateForm";
		}//end of if
		
		return "notice/noticeSelectContent";
	}//end of noticeUpdateForm() method
	
	//UPDATE
	@PostMapping(value="noticeUpdate")
	public String noticeUpdate(HttpServletRequest req, Model model) {
		logger.info("noticeUpdate() 함수 진입 : ");
		
		//파일 업로드
		FileUpload fu = new FileUpload( ConstPack.NOTICE_IMG_PATH,
										ConstPack.NOTICE_IMG_SIZE,
										ConstPack.NOTICE_ENC_TYPE);
		
		boolean bool = fu.imgFileUpload(req);
		logger.info("noticeInsert() -> bool : " + bool);
		
		NoticeVO nvo = null;
		nvo = new NoticeVO();
		
		//VO에 값 넣기
		nvo.setNnum(fu.getParameter("nnum"));
		nvo.setNsubject(fu.getParameter("nsubject"));
		nvo.setNcontent(fu.getParameter("ncontent"));
		
//		if(nvo.getNphoto() == null)
//			nvo.setNphoto("noimg.png");
		
		if(fu.getFileName("nphoto") != null && fu.getFileName("nphoto").length() > 0) {
			nvo.setNphoto(fu.getFileName("nphoto"));
		}else {
			nvo.setNphoto(fu.getParameter("nphoto1"));
		}//end of if-else
		
		//서비스 호출
		int updateCnt = noticeService.noticeUpdate(nvo);
		if(updateCnt == 1) {
			logger.info("updateCnt : " + updateCnt);
			model.addAttribute("nvo", nvo);
			return "notice/noticeUpdate";
		}//end of if
		
		return "notice/noticeUpdateForm";
	}//end of noticeUpdate() method
	
	//DELETE
	@GetMapping(value="noticeDelete")
	public String noticeDelete(NoticeVO nvo) {
		logger.info("noticeDelete() 함수 진입 : ");
		
		//서비스 호출
		int deleteCnt = noticeService.noticeDelete(nvo);
		if(deleteCnt == 1) {
			logger.info("deleteCnt : " + deleteCnt);
			return "notice/noticeDelete";
		}//end of if
		
		return "notice/noticeSelectContent";
	}//end of noticeDelete() method
	
	//RSS 테스트
	@GetMapping(value="rssTest")
	public String rssTest() {
		return "rss/rss";
	}//end of rssTest() method
	
}//end of NoticeController class
