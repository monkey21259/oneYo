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
import main.ict.community.vo.CommunityVO;
import main.ict.levelup.vo.LevelupVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;
import main.ict.warning.vo.WarningVO;

@Controller
public class AdminController {

	Logger logger = LogManager.getLogger(CommunityController.class);

//서비스호출
	@Autowired(required = false)
	private AdminService adminService;

//관리자 메인 페이지	
	@GetMapping("adminHome")
	public String adminHome(WarningVO wvo, LevelupVO lvvo, RecipeVO rvo, TipVO tvo, CommunityVO cvo, Model model) {
		logger.info("adminHome 함수 진입 >>> ");
		
		//등업
			List<LevelupVO> listLV = adminService.adminLevelupSelectAll(lvvo);
			int nCntLV = listLV.size();
			logger.info("등업글 갯수(nCnt) >>> : " + nCntLV);
			 
			if(nCntLV > 0) {
				model.addAttribute("adminLevelupSelectAll", listLV);
			}
		
		//신고
			List<WarningVO> listW = adminService.adminWarningSelectAll(wvo);
			int nCntW = listW.size();
			logger.info("신고글 갯수(nCnt) >>> : " + nCntW);
			 
			if(nCntW > 0) {
				model.addAttribute("adminWarningSelectAll", listW);
			} 
		
		//레시피
			List<RecipeVO> listR = adminService.adminRecipeSelectAll(rvo);
			int nCntR = listW.size();
			logger.info("레시피 갯수(nCnt) >>> : " + nCntR);
			 
			if(nCntR > 0) {
				model.addAttribute("adminRecipeSelectAll", listR);
			}
			
		//전문가팁
			List<TipVO> listT = adminService.adminTipSelectAll(tvo);
			int nCntT = listT.size();
			logger.info("전문가팁 갯수(nCnt) >>> : " + nCntT);
			 
			if(nCntT > 0) {
				model.addAttribute("adminTipSelectAll", listT);
			}
		
		//커뮤니티
			List<CommunityVO> listC = adminService.adminCommunitySelectAll(cvo);
			int nCntC = listT.size();
			logger.info("커뮤니티 갯수(nCnt) >>> : " + listC);
			 
			if(nCntC > 0) {
				model.addAttribute("adminCommunitySelectAll", listC);
			}
			
			
			return "admin/adminHome";
	} //adminHome
}//class
