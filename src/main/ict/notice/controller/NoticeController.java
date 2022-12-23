package main.ict.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	
	@GetMapping(value="noticeInsertForm")
	public String noticeInsertForm() {
		logger.info("noticeInsertForm() 함수 진입 : ");
		return "notice/noticeInsertForm";
	}//end of noticeInsertForm() method
	
	@GetMapping(value="noticeInsert")
	public String noticeInsert(HttpServletRequest req) {
		logger.info("noticeInsert() 함수 진입 : ");
		
		FileUpload fu = new FileUpload( ConstPack.NOTICE_IMG_PATH,
										ConstPack.NOTICE_IMG_SIZE,
										ConstPack.NOTICE_ENC_TYPE);
		
		boolean bool = fu.imgFileUpload(req);
		
		NoticeVO nvo = null;
		nvo = new NoticeVO();
		
		//채번 매기기
		String nnum = ChabunUtils.getNoticeChabun("d", chabunService.getNoticeChabun().getNnum());
		
		//서비스 호출
		
		
		return "";
	}//end of noticeInsert() method
	
}//end of NoticeController class
