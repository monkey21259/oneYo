package main.ict.test.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.test.service.TestService;
import main.ict.test.vo.TestVO;

@Controller
public class TestController {
	Logger logger = LogManager.getLogger(TestController.class);
	
	@Autowired(required=false)
	private TestService testService;
	
	@GetMapping(value="testSelectAll")
	public String testSelectAll(Model model) {
		logger.info("testSelectAll() 함수 진입");
		
		List<TestVO> list = testService.testSelectAll();
		if(list.size() > 0) {
			for(int i=0; i<list.size(); i++) {
				TestVO tvo = list.get(i);
				logger.info("empno : " + tvo.getEmpno());
				logger.info("ename : " + tvo.getEname());
			}
			model.addAttribute("list", list);
			return "test/testSelectAll";
		}
		
		return "";
	}
}
