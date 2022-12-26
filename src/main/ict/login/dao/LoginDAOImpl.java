package main.ict.login.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.mem.vo.MemVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	Logger logger = LogManager.getLogger(LoginDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	//로그인
	@Override
	public List<MemVO> login(MemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("login() 함수 진입 : ");
		return sqlSession.selectList("login", mvo);
	}//end of login() method
	
	//아이디 찾기(이름 및 이메일 주소 확인)
	@Override
	public List<MemVO> idFind(MemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("idFind() 함수 진입 : ");
		return sqlSession.selectList("idFind", mvo);
	}//end of idFind() method
	
}//end of LoginDAOImpl class
