package main.ict.tip.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.tip.service.TipService;
import main.ict.tip.vo.TipVO;

@Controller
public class TipController {
	private Logger logger = LogManager.getLogger(TipController.class);
	
	@Autowired(required=false)
	private TipService tipService;
	
	@GetMapping(value="tipInsertForm")
	public String tipInsertForm() {
		logger.info("tipInsertForm() 함수 진입");
		return "tip/tipInsertForm";
	}
	
	@GetMapping(value="tipInsert")
	public String tipInsert(TipVO tvo, Model m) {
		logger.info("tipInsert() 함수 진입");
		
		// 채번 로직 추가하기
		
		// 파일 업로드 추가하기
		
		logger.info("tvo 프로퍼티 : \n" + tvo.toString());
		int insertResult = tipService.tipInsert(tvo);

		if(insertResult == 0) {
			logger.info("인서트가 " + insertResult + "건 되었습니다.");
			m.addAttribute(tvo);
			return "tip/tipSelectContent";
		}
		
		return "tip/tipInsertForm";
	}
	
	@GetMapping(value="tipSelectAll")
	public String tipSelectAll(Model m) {
		logger.info("tipSelectAll() 함수 진입");
		
		List<TipVO> list = tipService.tipSelectAll();
		TipVO tvo = null;
		
		if(list !=null && list.size() > 0) {
			for(int i=0; i < list.size(); i++) {
				tvo = list.get(i);
				logger.info("VO : \n" + tvo.toString());
			}
			m.addAttribute("list", list);
			return "tip/tipSelectAll";
		}
		return "tip/tipInsertForm";
	}
	
	@GetMapping(value="tipSelectContent")
	public String tipSelectAllForm(TipVO tvo, Model m) {
		logger.info("tipSelectContent");
		
		logger.info(tvo.getTnum());
		
		return "tip/tipSelectContent";
	}

}
