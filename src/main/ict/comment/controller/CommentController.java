package main.ict.comment.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.ict.comment.service.CommentService;
import main.ict.comment.vo.CommentVO;
import main.ict.common.chabun.service.ChabunService;

@Controller
public class CommentController {
	Logger logger = LogManager.getLogger(CommentController.class);
	
	@Autowired(required=false)
	private CommentService commentService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	//댓글 폼 이동 : 테스트용
	@GetMapping(value="commentForm")
	public String commentForm() {
		logger.info("commentForm() 함수 진입 : ");
		return "comment/commentForm";
	}//end of commentForm() method
	
	//댓글 insert
	@PostMapping(value="commentInsert")
	@ResponseBody
	public String commentInsert(CommentVO covo) {
		logger.info("commentInsert() 함수 진입 : ");
		
		//채번 서비스 호출 -> 채번  매기기
		//String conum = 
		
		return "";
	}//end of commentInsert() method
}//end of CommentController class
