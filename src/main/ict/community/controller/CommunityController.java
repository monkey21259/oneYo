package main.ict.community.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {

		Logger logger = LogManager.getLogger(CommunityController.class);

//커뮤니티 게시글 등록(communityInsertForm)
	@GetMapping("communityInsertForm")
	public String communityInsertForm() {
		
		logger.info("communityInsertForm 함수 진입 >>> : ");
		
		return "community/communityInsertForm";
	}
	
	
//커뮤니티 게시글 등록(communitySelectAll)
	@GetMapping("communitySelectAll")
	public String communitySelectAll() {
		
		logger.info("communitySelectAll 함수 진입 >>> : ");
		
		return "community/communitySelectAll";
	}
	
}
