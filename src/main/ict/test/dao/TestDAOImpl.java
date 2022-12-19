package main.ict.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.test.vo.TestVO;

@Repository
public class TestDAOImpl implements TestDAO {
	Logger logger = LogManager.getLogger(TestDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public List<TestVO> testSelectAll() {
		// TODO Auto-generated method stub
		logger.info("testSelectAll() 함수 진입");
		return sqlSession.selectList("testSelectAll");
	}
	
}
