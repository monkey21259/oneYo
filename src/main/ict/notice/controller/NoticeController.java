package main.ict.notice.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.common.ChabunUtils;
import main.ict.common.chabun.service.ChabunService;
import main.ict.notice.service.NoticeService;

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
		logger.info("Chabun :\n" + ChabunUtils.getNoticeChabun("d", chabunService.getNoticeChabun().getNnum()));
		return "notice/noticeInsertForm";
	}//end of noticeInsertForm() method
	
}//end of NoticeController class
