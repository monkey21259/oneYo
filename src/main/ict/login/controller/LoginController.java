package main.ict.login.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	@GetMapping(value="idFind")
	public String idFind(MemVO mvo, Model model) {
		logger.info("idFind() 함수 진입 : ");
		
		//서비스 호출(이름 및 이메일 주소 확인)
		//List<MemVO> idFindList = loginService
		
		return "";
	}//end of idFind() method
	
	//비밀번호 찾기 폼 이동
	@GetMapping(value="pwFindForm")
	public String pwFindForm() {
		logger.info("pwFindForm() 함수 진입 : ");
		return "login/pwFindForm";
	}//end of pwFindForm() method
}//end of LoginController class
