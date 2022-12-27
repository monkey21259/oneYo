package main.ict.comment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.comment.vo.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {
	Logger logger = LogManager.getLogger(CommentDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	//댓글 insert
	@Override
	public int commentInsert(CommentVO covo) {
		// TODO Auto-generated method stub
		logger.info("commentInsert() 함수 진입 : ");
		return (Integer)sqlSession.insert("commentInsert", covo);
	}//end of commentInsert() method
	
	//댓글 select all
	@Override
	public List<CommentVO> commentSelectAll(CommentVO covo) {
		// TODO Auto-generated method stub
		logger.info("commentSelectAll() 함수 진입 : ");
		return sqlSession.selectList("commentSelectAll", covo);
	}//end of commentSelectAll() method
	
	//댓글 delete
	@Override
	public int commentDelete(CommentVO covo) {
		// TODO Auto-generated method stub
		logger.info("commentDelete() 함수 진입 : ");
		return (Integer)sqlSession.update("commentDelete", covo);
	}//end of commentDelete() method
	
}//end of CommentDAOImpl class
