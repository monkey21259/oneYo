package main.ict.like.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.like.vo.LikeVO;

@Repository
public class LikeDAOImpl implements LikeDAO {
	Logger logger = LogManager.getLogger(LikeDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	//세션에 저장된 회원이 좋아요 눌렀는지 확인하기
	@Override
	public List<LikeVO> likeCheck(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeCheck() 함수 진입 : ");
		return null;
	}//end of likeCheck() method
	
}//end of LikeDAOImpl class
