package main.ict.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.community.vo.CommunityVO;
import main.ict.mem.vo.MemVO;
import main.ict.mypage.service.MypageService;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;

@Controller
public class MypageController {
	private Logger logger = LogManager.getLogger(MypageController.class);
	
	@Autowired(required=false)
	private MypageService mypageService;
	
	@GetMapping(value="mypageHome")
	public String mypageHome(MemVO mvo, Model m) {
		logger.info("mypageHome() 페이지 진입");
		
		// 임시로 mnum 지정
		mvo.setMnum("M202212200001");
		
		List<RecipeVO> rList = mypageService.selectMyRecipe(mvo);
		List<CommunityVO> cList = mypageService.selectMyCommunity(mvo);
		List<TipVO> tList = mypageService.selectMyTip(mvo);
		List<MemVO> mList = mypageService.selectMyProfile(mvo);
		
		if(rList !=null && rList.size() > 0) {
			m.addAttribute("rList", rList);
		}
		if(cList !=null && cList.size() > 0) {
			m.addAttribute("cList", cList);
		}
		if(tList !=null && tList.size() > 0) {
			m.addAttribute("tList", tList);
		}
		if(mList !=null && mList.size() == 1) {
			m.addAttribute("mList", mList);
		}
		
		return "mypage/mypageHome";
	}
	

	//	마이페이지 넘어가기 전 비밀번호 확인 폼으로 이동
	@GetMapping("mypagePWChk")
	public String mypagePWChk() {
		
		logger.info("mypagePWChk() >>> : mypagePWChk.jsp");
		
		return "mypage/mypagePWChk";
	}

}
