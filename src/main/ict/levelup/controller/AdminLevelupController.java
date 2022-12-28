package main.ict.levelup.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.levelup.service.AdminLevelupService;
import main.ict.levelup.vo.LevelupVO;

@Controller
public class AdminLevelupController {
	Logger logger = LogManager.getLogger(AdminLevelupController.class);
	
	@Autowired(required=false)
	private AdminLevelupService adminLevelupService; 
	
	
	@GetMapping(value="adminLevelupSelectAll")
	public String levelupSelectAll(Model m) {
	
		List<LevelupVO> list = adminLevelupService.levelupSelectAll();
		
		if(list.size() > 0) {
			
			m.addAttribute("list", list);
			return "levelup/adminLevelupSelectAll";
			
		}
		return "";
		
	}
	
	
}
