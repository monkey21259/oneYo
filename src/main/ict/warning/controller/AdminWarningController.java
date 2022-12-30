package main.ict.warning.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.ict.mem.vo.MemVO;
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
		
	
		System.out.println("wtnum : " + wvo.getWtnum());
		System.out.println("wcategory : " + wvo.getWcategory());
		System.out.println("wcontent : " + wvo.getWcontent());
		System.out.println("mnick : " + wvo.getMnick());
		System.out.println("insertddate : " + wvo.getInsertdate());
		
		String wcategory = wvo.getWcategory();
		String mnick = wvo.getMnick();
		String wtnum = wvo.getWtnum();
		String wcontent = wvo.getWcontent();
		String insertdate = wvo.getInsertdate();
		
//신고글 카테고리가 레시피인 경우(R)				
		if(wvo.getWtnum().substring(0,1).equals("R")) {
			
			List<WarningVO> list = adminWarningService.adminWarningSelectRecipe(wvo);
			
			logger.info("신고분야가 레시피(R) 인 글 갯수 >>> : " + list.size());
			
			if(list.size() > 0) {
				 
				model.addAttribute("list", list);
				model.addAttribute("wcategory", wcategory);
				model.addAttribute("wtnum", wtnum);
				model.addAttribute("mnick", mnick);
				model.addAttribute("wcontent", wcontent);
				model.addAttribute("insertdate", insertdate);
				return "warning/adminWarningSelectContent";
			} //if
		
		} //if
		
//신고글 카테고리가 레시피인 경우(T)				
		if(wvo.getWtnum().substring(0,1).equals("T")) {
			
			List<WarningVO> list = adminWarningService.adminWarningSelectTip(wvo);
			
			logger.info("신고분야가 레시피(T) 인 글 갯수 >>> : " + list.size());
			
			if(list.size() > 0) {
				 
				model.addAttribute("list", list);
				model.addAttribute("wcategory", wcategory);
				model.addAttribute("wtnum", wtnum);
				model.addAttribute("mnick", mnick);
				model.addAttribute("wcontent", wcontent);
				model.addAttribute("insertdate", insertdate);
				return "warning/adminWarningSelectContent";
			} //if
		
		} //if
		
//신고글 카테고리가 레시피인 경우(C)				
		if(wvo.getWtnum().substring(0,1).equals("C")) {
			
			List<WarningVO> list = adminWarningService.adminWarningSelectCommunity(wvo);
			
			logger.info("신고분야가 레시피(C) 인 글 갯수 >>> : " + list.size());
			
			if(list.size() > 0) {
				 
				model.addAttribute("list", list);
				model.addAttribute("wcategory", wcategory);
				model.addAttribute("wtnum", wtnum);
				model.addAttribute("mnick", mnick);
				model.addAttribute("wcontent", wcontent);
				model.addAttribute("insertdate", insertdate);
				return "warning/adminWarningSelectContent";
			} //if
		
		} //if
		return "warning/adminWarningSelectContent";

	} //adminWarningSelectContent
	
//회원 경고
	@GetMapping("adminCaution")
	@ResponseBody
	public Object adminCaution(MemVO mvo) {
		logger.info("adminCaution() 함수진입 >>> : ");
		logger.info("");
		logger.info("mvo.getMnum : " + mvo.getMnum());
		
		String s = null;
		
		int nCnt = adminWarningService.adminMemberCaution(mvo);
		logger.info("nCnt >>> : " + nCnt);
		if(nCnt > 0) {
			s = "updateOK";
		}
		logger.info("s >>> : " + s);
		return s;
	}
	
} //class
