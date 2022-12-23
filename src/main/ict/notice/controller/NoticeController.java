package main.ict.notice.controller;

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
import main.ict.common.chabun.service.ChabunService;
import main.ict.notice.service.NoticeService;
import main.ict.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	Logger logger = LogManager.getLogger(NoticeController.class);
	
	@Autowired(required=false)
	private NoticeService noticeService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
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
	public String noticeSelectAll() {
		logger.info("noticeSelectAll() 함수 진입 : ");
		
		return "notice/noticeSelectAll";
	}//end of noticeSelectAll() method
	
}//end of NoticeController class
