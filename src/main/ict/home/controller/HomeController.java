package main.ict.home.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	//	log4j 세팅
	private Logger logger = LogManager.getLogger(HomeController.class);
	
	//	home 이동
	@GetMapping("home")
	public String home() {
		
		logger.info("home() >>> : home.jsp");
		
		return "home/home";
	}
	
}
