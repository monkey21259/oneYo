package main.ict.login.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.login.dao.LoginDAO;
import main.ict.mem.vo.MemVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	Logger logger = LogManager.getLogger(LoginServiceImpl.class);
	
	@Autowired(required=false)
	private LoginDAO loginDAO;

	//로그인
	@Override
	public List<MemVO> login(MemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("login() 함수 진입 : ");
		return loginDAO.login(mvo);
	}//end of login() method

	//아이디 찾기(이름 및 이메일 주소 확인)
	@Override
	public List<MemVO> idFind(MemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("idFind() 함수 진입 : ");
		return loginDAO.idFind(mvo);
	}//end of idFind() method
	
}//end of LoginServiceImpl class
