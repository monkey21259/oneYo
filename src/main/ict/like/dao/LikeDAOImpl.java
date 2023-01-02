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
		return sqlSession.selectList("likeCheck", lvo);
	}//end of likeCheck() method
	
	//좋아요 insert
	@Override
	public int likeInsert(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeInsert() 함수 진입 : ");
		return (Integer)sqlSession.insert("likeInsert", lvo);
	}//end of likeInsert() method
	
	//좋아요 취소
	@Override
	public int likeDelete(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeDelete() 함수 진입 : ");
		return (Integer)sqlSession.update("likeDelete", lvo);
	}//end of likeDelete() method
	
	//좋아요 개수 카운트
	@Override
	public LikeVO likeCount(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeCount() 함수 진입 : ");
		return sqlSession.selectOne("likeCount", lvo);
	}//end of likeCount() method
	
}//end of LikeDAOImpl class
