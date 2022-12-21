package main.ict.mem.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.mem.service.MemService;

@Controller
public class MemController {
	
	//	log4j 세팅
	private Logger logger = LogManager.getLogger(MemController.class);
	
	//	Service 호출
	@Autowired(required=false)
	private MemService memService;
	
	//	회원가입 form 1(전문가/일반 선택) 호출
	@GetMapping("memGrade")
	public String memGrade() {
		
		logger.info("memGrade() >>> : memGrade.jsp");
		
		return "mem/memGrade";
	}
}
