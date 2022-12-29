package main.ict.warning.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.warning.service.AdminWarningService;
import main.ict.warning.vo.WarningVO;

@Controller
public class AdminWarningController {
	Logger logger = LogManager.getLogger(AdminWarningController.class);
	
	@Autowired(required = false)
	private AdminWarningService adminWarningService; 

//전체조회	
	@GetMapping("adminWarningSelectAll")
	public String adminWarningSelectAll(WarningVO wvo, Model model) {
		logger.info("AdminWarningController 함수진입 >>> ");
		
		List<WarningVO> listAll = adminWarningService.adminWarningSelectAll(wvo);
		
		logger.info("adminWarningSelectAll 갯수 >>> : " + listAll.size());
		
		if(listAll.size() > 0) {
			
			model.addAttribute("listAll", listAll);
		}
		
		return "warning/adminWarningSelectAll";
	}

//게시글조회
	@GetMapping("adminWarningSelectContent")
	
	public String adminWarningSelectContent(WarningVO wvo , HttpServletRequest req, Model model) {
		logger.info("adminWarningSelectContent 함수진입 >>> ");
		
		String wtnum = req.getParameter("wtnum");
		String wcategory = req.getParameter("wcategory");
		String wcontent = req.getParameter("wcontent");
		String mnick = req.getParameter("mnick");
		String insertdate = req.getParameter("insertdate");
		
		System.out.println("wtnum : " + wtnum);
		System.out.println("wcategory : " + wcategory);
		System.out.println("wcontent : " + wcontent);
		System.out.println("mnick : " + mnick);
		System.out.println("insertddate : " + insertdate);
		
		
		String wnum = req.getParameter("wnum");
		wvo.setWnum(wnum);
		logger.info("wnum >>> : " + wvo.getWnum());
		logger.info("wnum.substring(0,1) >>> : " + wnum.substring(0,1));
		logger.info("wnum.substring(0,1).toUpperCase() >>> : " + wnum.substring(0,1).toUpperCase());
		
		//신고당한 사람
		if(wnum.substring(0,1).equals("R")) {
			
			List<WarningVO> list = adminWarningService.adminWarningSelectRecipe(wvo);
			
			logger.info("신고분야가 레시피(R) 인 글 갯수 >>> : " + list.size());
			
			if(list.size() > 0) {
				
				model.addAttribute("list", list);
			} //if
		
		} //if
		
		return "warning/adminWarningSelectContent";
		
//		//신고글
//		List<WarningVO> list = adminWarningService.adminWarningSelectContent(wvo);
//		logger.info("wvo.getWnum() >>> : " + wvo.getWnum());
//		
//		logger.info("adminWarningSelectContent 갯수 >>> : " + list.size());
//		
//		if(list.size() == 1) {
//			model.addAttribute("list", list);
//		}

//		

	} //adminWarningSelectContent
	
} //class
