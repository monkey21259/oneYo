package main.ict.entertainment.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EntertainmentController {
	Logger logger = LogManager.getLogger(EntertainmentController.class);
	
	@GetMapping(value="entertainment")
	public String entertainment() {
		logger.info("cont 진입");
		
		return "entertainment/entertainment";
	}
	
	
}
