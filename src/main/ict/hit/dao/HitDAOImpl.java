package main.ict.hit.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.hit.vo.HitVO;

@Repository
public class HitDAOImpl implements HitDAO {
	Logger logger = LogManager.getLogger(HitDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	//조회 수 올리기
	@Override
	public int hitUp(HitVO hvo) {
		// TODO Auto-generated method stub
		logger.info("hitUp() 함수 진입 : ");
		return (Integer)sqlSession.update("hitUp", hvo);
	}//end of hitUp() method
	
}//end of HitDAOImpl class
