package main.ict.like.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import main.ict.common.chabun.service.ChabunService;
import main.ict.like.service.LikeService;

@Controller
public class LikeController {
	Logger logger = LogManager.getLogger(LikeController.class);
	
	@Autowired(required=false)
	private LikeService likeSerivce;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	
}//end of LikeController class
