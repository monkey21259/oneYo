package main.ict.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public String noticeSelectContent(HttpServletRequest req, NoticeVO nvo, Model model) {
		logger.info("noticeSelectContent() 함수 진입 : ");
		logger.info("nvo.getNnum() : " + nvo.getNnum());
		
		//좋아요 체크
		LikeVO lvo = null;
		lvo = new LikeVO();
		lvo.setMnum("M202212260012"); //이후 세션에 담긴 MNUM 값으로 변경할 것
		/*
		O_Session os = O_Session.getInstance();
		lvo.setMnum(os.getSession(req));
		*/
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
