package main.ict.admin.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.community.controller.CommunityController;

@Controller
public class AdminController {

	Logger logger = LogManager.getLogger(CommunityController.class);

	@GetMapping("adminHome")
	public String adminHome() {
		logger.info("adminHome 함수 진입 >>> ");
		
		
		return "admin/adminHome";
	}
}
