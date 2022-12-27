package main.ict.levelup.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.levelup.service.LevelupService;
import main.ict.mem.vo.MemVO;
import main.ict.levelup.vo.LevelupVO;

@Controller
public class LevelupController {
	private Logger logger = LogManager.getLogger(LevelupController.class);
	
	@Autowired(required=false)
	private LevelupService levelupService;
	
	@GetMapping(value="levelupSelectAll")
	public String levelupSelectAll(MemVO mvo, Model m) {
		logger.info("levelupSelectAll() 함수 진입");
		
		List<LevelupVO> list = levelupService.levelupSelectAll(mvo);
		LevelupVO lvo = null;
		
		if(list !=null && list.size() > 0) {
			for(int i=0; i < list.size(); i++) {
				lvo = list.get(i);
				logger.info(lvo.getLvnum());
				logger.info(lvo.getLvsubject());
				logger.info(lvo.getLvcontent());
				logger.info(lvo.getLvphoto());
				logger.info(lvo.getMnum());
			}
			m.addAttribute("list", list);
		}
		
		return "mypage/levelupSelectAll";
	}
	
}
