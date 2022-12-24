package main.ict.login.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import main.ict.login.service.LoginService;

@Controller
public class LoginController {
	Logger logger = LogManager.getLogger(LoginController.class);
	
	@Autowired(required=false)
	private LoginService loginService;
}//end of LoginController class
