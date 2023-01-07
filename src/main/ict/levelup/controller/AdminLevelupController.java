package main.ict.levelup.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	@GetMapping(value="adminLevelupSelectContent")
	public String adminLevelupSelectContent(Model m, HttpServletRequest req, LevelupVO lvo) {
		
		String mnick = req.getParameter("mnick");
		String mnum = req.getParameter("mnum");
		lvo.setMnum(mnum);
		
		List<LevelupVO> list = adminLevelupService.levelupSelectContent(lvo);
		
		if(list.size() > 0) {
			m.addAttribute("list", list);
			m.addAttribute("mnick", mnick);
			return "levelup/adminLevelupSelectContent";
		}
		logger.info("List<LevelupVO> list의 사이즈가 적절하지 않습니다.");
		return "#";
	}
	
	@GetMapping(value="levelupNope")
	public String levelupNope(Model m, LevelupVO lvo) {
		
		System.out.println("lvo.getLvnum : " + lvo.getLvnum());
		
		int nCnt = adminLevelupService.adminLevelupNope(lvo);
		
		if(nCnt > 0) {
			
			return "levelup/levelupNope";
		}
		
		return "";
	}

	@GetMapping(value="levelupOkey")
	public String levelupOkey(Model m, LevelupVO lvo) {
		
		System.out.println("lvo.getLvnum : " + lvo.getLvnum());
		System.out.println("lvo.getMnum : " + lvo.getMnum());
		
		int levelupCnt = adminLevelupService.levelupOkey(lvo);
		int memberCnt = adminLevelupService.mgradeUpdate(lvo);
		
		if(levelupCnt > 0 && memberCnt > 0) {
			
			return "levelup/levelOkey";
			
			
		}
		
		
		return "";
	}
	
}
