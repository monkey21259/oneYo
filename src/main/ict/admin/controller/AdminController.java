package main.ict.admin.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.admin.service.AdminService;
import main.ict.community.controller.CommunityController;
import main.ict.warning.vo.WarningVO;

@Controller
public class AdminController {

	Logger logger = LogManager.getLogger(CommunityController.class);

//서비스호출
	@Autowired(required = false)
	private AdminService adminService;

//관리자 메인 페이지	
	@GetMapping("adminHome")
	public String adminHome(WarningVO wvo, Model model) {
		logger.info("adminHome 함수 진입 >>> ");
//		
//		//신고글
//			List<WarningVO> list = adminService.warningSelectAll(wvo);
//			int nCnt = list.size();
//			logger.info("신고글 갯수(nCnt) >>> : ");
//			
//			if(nCnt > 0) {
//				model.addAttribute("adminWarningSelectAll", list);
//			}
//			
			return "admin/adminHome";
		
		
		//커뮤니티
		

	}
}
