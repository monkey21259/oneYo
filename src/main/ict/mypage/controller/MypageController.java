package main.ict.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.ict.common.GoogleMail;
import main.ict.common.O_Session;
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
	public String mypageHome(HttpServletRequest req, MemVO mvo, Model m) {
		logger.info("mypageHome() 페이지 진입");
		
		//세션
		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(req);
		logger.info("mnum >>> : " + mnum);
		
		mvo.setMnum(mnum);
		
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
	public String mypagePWChk(MemVO mvo, Model model) {
		logger.info("mypagePWChk() >>> : mypagePWChk.jsp");
		
		List<MemVO> list = mypageService.selectMyProfile(mvo);
		
		String mpw = list.get(0).getMpw();
		mvo.setMpw(mpw);
		logger.info("mpw >>>> : " + mvo.getMpw());
	
		if(list.size() == 1) {
			model.addAttribute("list", list);
		}
		
		return "mypage/mypagePWChk";
	}
	
	//	이메일 변경시 확인
	@PostMapping("profileEmailCheck")
	@ResponseBody
	public String profileEmailCheck(MemVO mvo) {
		
		logger.info("profileEmailCheck() >>> : " + mvo.getMemail());
		
		String memail = "";
		memail = mvo.getMemail();
		
		String subject = "";
		subject = "오내요 이메일 인증";
		
		String mailkey = "";
		mailkey = mvo.getMkey();
		logger.info("profileEmailCheck >>> : " + mailkey);
		
		String sendMsg = "";
//		보낼 내용
		StringBuffer neyong = null;
		neyong = new StringBuffer();
		neyong.append(" <p style='background-color:#AC7B53;'> ");
		neyong.append(" <span style='color:#E0E086;background-color:#AC7B53;'>~~~ 오늘은 내가 요리사 ~~~</span> ");
		neyong.append(" <br> ");
		neyong.append("	<span style='color:#93A603;background-color:#F0F2CC;'>" + mailkey + "</span> ");
		neyong.append(" <br> ");
		neyong.append(" <span style='color:#E0E086;background-color:#AC7B53;'>~~~ oneYo ~~~</span> ");
		neyong.append(" </p> ");
		sendMsg = neyong.toString();
		
		GoogleMail gmail = null;
		gmail = new GoogleMail();
		
		gmail.authumMail(memail, subject, sendMsg);
		
		String msg = "";
		if (memail != null && memail.length() > 0 && mailkey != null && mailkey.length() > 0) {
			msg = "GOMAIL";
		}else {
			msg = "NOTMAIL";
		}
		
		return msg;
	}

	
	//등업목록 mgrade 
	@GetMapping("mgradeChk")
	@ResponseBody
	public String mgradeChk(HttpServletRequest req, MemVO mvo) {
		logger.info("mgradeChk 함수진입 >>> ");
		
		//세션
		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(req);
			
		//세션에서 받은 mnum
		mvo.setMnum(mnum);
		logger.info("mnum >>> : " + mvo.getMnum());
		
		List<MemVO> list = mypageService.selectMyProfile(mvo);
		
		//회원등급 담는 변수
		String mgrade= list.get(0).getMgrade();
		logger.info("mgrade >>> : " + mgrade);
		
		return mgrade;
	}
}
