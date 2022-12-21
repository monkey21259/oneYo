package main.ict.mem.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemDAOImpl implements MemDAO {
	
	//	log4j 세팅
	private Logger logger = LogManager.getLogger(MemDAOImpl.class);
	
	//	sqlSession
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	
}
