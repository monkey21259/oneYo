package main.ict.login.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.login.dao.LoginDAO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	Logger logger = LogManager.getLogger(LoginServiceImpl.class);
	
	@Autowired(required=false)
	private LoginDAO loginDAO;
}//end of LoginServiceImpl class
