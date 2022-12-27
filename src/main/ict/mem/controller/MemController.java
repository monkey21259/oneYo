package main.ict.mem.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.ict.common.ChabunUtils;
import main.ict.common.ConstPack;
import main.ict.common.FileUpload;
import main.ict.common.GoogleMail;
import main.ict.common.chabun.service.ChabunService;
import main.ict.mem.service.MemService;
import main.ict.mem.vo.MemVO;

@Controller
public class MemController {
	
	//	log4j 세팅
	private Logger logger = LogManager.getLogger(MemController.class);
	
	//	Service 호출
	@Autowired(required=false)
	private MemService memService;

	//	채번Service 호출
	@Autowired(required=false)
	private ChabunService chabunService;
	
	//	회원가입 form 1(전문가/일반 선택) 호출
	@GetMapping("memGrade")
	public String memGrade() {
		
		logger.info("memGrade() >>> : memGrade.jsp");
		
		return "mem/memGrade";
	}

	//	이메일 인증
	@GetMapping("memInsertEmail")
	public String memInsertEmail(MemVO mvo) {
		
		logger.info("memInsertEmail(mvo) >>> : " + mvo.getMemail() + " / " + mvo.getMgrade());
		
		String memail = "";
		memail = mvo.getMemail();
		
		String subject = "";
		subject = "오내요 이메일 인증";
		
		String sendUrl = "";
//		sendUrl = "http://localhost:8088/oneYo/memInsertForm.ict?memail=";
		sendUrl = "http://192.168.219.128:8088/oneYo/memInsertForm.ict?memail=";	//	김은솔 ip
		sendUrl += memail + "&mgrade=" + mvo.getMgrade();
		
		String sendMsg = "";
		//	보낼 내용
		StringBuffer neyong = null;
		neyong = new StringBuffer();
		neyong.append(" <p style='background-color:#AC7B53;'> ");
		neyong.append(" <span style='color:#E0E086;background-color:#AC7B53;'>~~~ 오늘은 내가 요리사 ~~~</span> ");
		neyong.append(" <br> ");
		neyong.append(" <a style='text-decoration:none;color:#000;' href='" + sendUrl + "'><span style='color:#93A603;background-color:#F0F2CC;'>오내요 회원가입 이메일 인증</span></a> ");
		neyong.append(" <br> ");
		neyong.append(" <span style='color:#E0E086;background-color:#AC7B53;'>~~~ oneYo ~~~</span> ");
		neyong.append(" </p> ");
		sendMsg = neyong.toString();
		
		logger.info(sendMsg);
		
		GoogleMail gmail = null;
		gmail = new GoogleMail();
		
		gmail.authumMail(memail, subject, sendMsg);
		
		return "mem/memInsertEmail";
	}
	
	//	회원가입 form 2(회원가입) 호출
	@GetMapping("memInsertForm")
	public String memInsertForm(HttpServletRequest req, MemVO mvo, Model model) {
		
		logger.info("memInsertForm(mvo, model) >>> : memInsertForm.jsp"
				+ " >>> : " + req + " / " + mvo + " / " + model);
		
		logger.info("memInsertForm(mvo, model) >>> : " + mvo.getMemail() + " + " + mvo.getMgrade());
		
		if (mvo.getMemail() != null && mvo.getMgrade() != null) {
			return "mem/memInsertForm";
		}
		
		return "mem/memGrade";
	}
	
	//	ID 아이디 중복 체크
	@PostMapping("memIdCheck")
	@ResponseBody
	public Object memIdCheck(MemVO mvo) {
		
		logger.info("memIdCheck(mvo) >>> :" + mvo.getMid());
		
		List<MemVO> list = null;
		list = memService.memIdCheck(mvo);
		
		String msg = "";
		
		if (list.size() == 0) { msg = "ID_YES"; }
		else { msg = "ID_NO"; }
		
		return msg;
	}
	
	//	회원가입 데이터 전송
	@PostMapping("memInsert")
	public String memInsert(HttpServletRequest req/* , MemVO mvo, Model model */) {
		
		logger.info("memInsert(req, mvo, model) >>> : memInsert.jsp"
				+ " >>> : " + req/* + " / " + mvo + " / " + model */);
		
		FileUpload fu = null;
		fu = new FileUpload( ConstPack.MEMBER_IMG_PATH
							,ConstPack.MEMBER_IMG_SIZE
							,ConstPack.MEMBER_ENC_TYPE	);
		
		boolean bool = fu.imgFileUpload(req);
		logger.info("memInsert().bool >>> : " + bool);
		
		//	vo 호출
		MemVO mvo = null;
		mvo = new MemVO();
		
		//	MNUM	//	회원 번호	//	NOT NULL
		String mnum = "";
		mnum = ChabunUtils.getMemberChabun("D", chabunService.getMemberChabun().getMnum());	//	채번 로직
		logger.info("mnum >>> : " + mnum);
		mvo.setMnum(mnum);	//	vo 세팅
		logger.info("vo.mnum >>> : " + mvo.getMnum());
		
		//	MID	//	아이디	//	NOT NULL
		String mid = "";
		mid = fu.getParameter("mid");	//	호출
		logger.info("mid >>> : " + mid);
		mvo.setMid(mid);	//	vo 세팅
		logger.info("vo.mid >>> : " + mvo.getMid());
		
		//	MPW	//	비밀번호	//	NOT NULL
		String mpw = "";
		mpw = fu.getParameter("mpw");	//	호출
		logger.info("mpw >>> : " + mpw);
		mvo.setMpw(mpw);	//	vo 세팅
		logger.info("vo.mpw >>> : " + mvo.getMpw());
		
		//	MNAME	//	이름	//
		String mname = "";
		mname = fu.getParameter("mname");	//	호출
		logger.info("mname >>> : " + mname);
		mvo.setMname(mname);	//	vo 세팅
		logger.info("vo.mname >>> : " + mvo.getMname());
		
		//	MNICK	//	닉네임	//
		String mnick = "";
		mnick = fu.getParameter("mnick");	//	호출
		logger.info("mnick >>> : " + mnick);
		mvo.setMnick(mnick);	//	vo 세팅
		logger.info("vo.mnick >>> : " + mvo.getMnick());
		
		//	MHP	//	핸드폰	//	NOT NULL
		String mhp = "";
		mhp = fu.getParameter("mhp");	//	호출
		logger.info("mhp >>> : " + mhp);
		mvo.setMhp(mhp);	//	vo 세팅
		logger.info("vo.mhp >>> : " + mvo.getMhp());
		
		//	MEMAIL	//	이메일	//	NOT NULL
		String memail = "";
		memail = fu.getParameter("memail");	//	호출
		logger.info("memail >>> : " + memail);
		mvo.setMemail(memail);	//	vo 세팅
		logger.info("vo.memail >>> : " + mvo.getMemail());
		
		//	MGRADE	//	등급	//	NOT NULL
		String mgrade = "";
		mgrade = fu.getParameter("mgrade");	//	호출
		logger.info("mgrade >>> : " + mgrade);
		mvo.setMgrade(mgrade);	//	vo 세팅
		logger.info("vo.mgrade >>> : " + mvo.getMgrade());
		
		//	MPROFILE	//	프로필사진	//	
		String mprofile = "";
		mprofile = fu.getFileName("mprofile");	//	호출
		logger.info("mprofile >>> : " + mprofile);
		mvo.setMprofile(mprofile);	//	vo 세팅
		logger.info("vo.mprofile >>> : " + mvo.getMprofile());

		//	MCATEGORY	//	요리 분야	//	
		String mcategory = "";
		mcategory = fu.getParameter("mcategory");	//	호출
		logger.info("mcategory >>> : " + mcategory);
		mvo.setMcategory(mcategory);	//	vo 세팅
		logger.info("vo.mcategory >>> : " + mvo.getMcategory());
		
		
		int insertCnt = memService.memInsert(mvo);
		
		if (insertCnt > 0) {
			logger.info("memInsert().nCnt >>> : " + insertCnt);
			
			return "mem/memGrade";
		}
		
		logger.info("memInsert().nCnt >>> : " + insertCnt + "로 입력 실패");
		
		return "mem/memGrade";
	}
	

	//	마이페이지 프로필 편집 memSelect
	@PostMapping("profileSelect")
	public String profileSelect(@ModelAttribute MemVO mvo, Model model) {
		
		logger.info("profileSelect() >>> : " + mvo.getMnum());
		
		String mnum = mvo.getMnum();
		
		if (mnum != null && mnum.length() > 0) {
			
			List<MemVO> list = null;
			list = memService.memSelect(mvo);
			
			logger.info("memSelect() - list != null >>> : " + (boolean)(list != null));
			
			int nCnt = list.size();
			
			if (list != null && nCnt > 0) {
				
				logger.info("memSelect() - nCnt >>> : " + nCnt);
				
				model.addAttribute("list", list);
				
				return "mypage/profileSelect";
			}
		}
		
		
		return "mypage/mypagePWCheck";
	}
}
