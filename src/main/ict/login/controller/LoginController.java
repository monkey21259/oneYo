package main.ict.login.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.ict.common.GoogleMail;
import main.ict.login.service.LoginService;
import main.ict.mem.vo.MemVO;

@Controller
public class LoginController {
	Logger logger = LogManager.getLogger(LoginController.class);
	
	@Autowired(required=false)
	private LoginService loginService;
	
	//로그인 폼 이동
	@GetMapping(value="loginForm")
	public String loginForm() {
		logger.info("loginForm() 함수 진입 : ");
		return "login/loginForm";
	}//end of loginForm() method
	
	//로그인
	@PostMapping(value="login")
	public String login(MemVO mvo, Model model) {
		logger.info("login() 함수 진입 : ");
		
		//서비스 호출
		List<MemVO> loginList = loginService.login(mvo);
		if(loginList.size() == 1) {
			return "home/home";
		}else {
			String msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
			model.addAttribute("msg", msg);
			return "login/loginForm";
		}//end of if-else
		
	}//end of login() method
	
	//아이디 찾기 폼 이동
	@GetMapping(value="idFindForm")
	public String idFindForm() {
		logger.info("idFindForm() 함수 진입 : ");
		return "login/idFindForm";
	}//end of idFindForm() method
	
	//아이디 찾기 및 인증메일 송부
	@PostMapping(value="idFind")
	@ResponseBody
	public String idFind(MemVO mvo) {
		logger.info("idFind() 함수 진입 : ");
		
		//ajax로 응답할 메세지
		String msg = "";
		
		//서비스 호출(이름 및 이메일 주소 확인)
		List<MemVO> idFindList = loginService.idFind(mvo);
		if(idFindList.size() == 1) {
			MemVO _mvo = idFindList.get(0);
			
			//송부할 이메일 주소
			String receiveMail = mvo.getMemail();
			//송부할 메일 제목
			String mailSubject = "[오내요]오내요 아이디 찾기 안내입니다.";
			//송부할 메세지 *****마지막에 IP주소 바꿀 것!*****
			String sendMsg = "<a href='http://localhost:8088/oneYo/loginShowId.ict?mid=" + _mvo.getMid() + "&insertdate=" + _mvo.getInsertdate() + "'>가입한 아이디 보러가기</a>";
			GoogleMail gm = new GoogleMail();
			gm.authumMail(receiveMail, mailSubject, sendMsg);
			
			msg = "FIND_YES";
		}else {
			msg = "FIND_NO";
		}//end of if-else
		
		return msg;
	}//end of idFind() method
	
	@GetMapping(value="loginShowId")
	public String loginShowId(MemVO mvo, Model model) {
		logger.info("loginShowId() 함수 진입 : ");
		model.addAttribute("idShowVO", mvo);
		return "login/loginShowId";
	}//end of loginShowId() method
	
	//비밀번호 찾기 폼 이동
	@GetMapping(value="pwFindForm")
	public String pwFindForm() {
		logger.info("pwFindForm() 함수 진입 : ");
		return "login/pwFindForm";
	}//end of pwFindForm() method
	
	//비밀번호 찾기 및 인증메일 송부
	@PostMapping(value="pwFind")
	@ResponseBody
	public String pwFind(MemVO mvo, Model model) {
		logger.info("idFind() 함수 진입 : ");
		
		//ajax로 응답할 메세지
		String msg = "";
		
		//서비스 호출(이름 및 이메일 주소 확인)
		List<MemVO> pwFindList = loginService.pwFind(mvo);
		if(pwFindList.size() == 1) {
			MemVO _mvo = pwFindList.get(0);
			
			//송부할 이메일 주소
			String receiveMail = mvo.getMemail();
			//송부할 메일 제목
			String mailSubject = "[오내요]오내요 비밀번호 찾기 안내입니다.";
			//송부할 메세지 *****마지막에 IP주소 바꿀 것!*****
			String sendMsg = "<a href='http://localhost:8088/oneYo/loginResetPWForm.ict?mid=" + _mvo.getMid() + "'>비밀번호 변경하기</a>";
			GoogleMail gm = new GoogleMail();
			gm.authumMail(receiveMail, mailSubject, sendMsg);
			
			msg = "FIND_YES";
		}else {
			msg = "FIND_NO";
		}//end of if-else
		
		return msg;
	}//end of idFind() method
	
	//비밀번호 변경 폼 이동
	@GetMapping(value="loginResetPWForm")
	public String loginResetPWForm(MemVO mvo, Model model) {
		logger.info("loginResetPWForm() 함수 진입 : ");
		model.addAttribute("pwFindVO", mvo);
		return "login/loginResetPW";
	}//end of loginResetPWForm() method
	
	//비밀번호 변경
	@PostMapping(value="resetPW")
	public String resetPW(MemVO mvo) {
		logger.info("resetPW() 함수 진입 : ");
		
		//서비스 호출
		int resetCnt = loginService.resetPW(mvo);
		if(resetCnt == 1) {
			logger.info("resetCnt : " + resetCnt);
			return "login/loginResetPWOK";
		}//end of if
		
		return "login/loginResetPW";
	}//end of resetPW() method
}//end of LoginController class
