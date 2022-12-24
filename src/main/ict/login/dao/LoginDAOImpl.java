package main.ict.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOImpl implements LoginDAO {
	Logger logger = LogManager.getLogger(LoginDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
}//end of LoginDAOImpl class
