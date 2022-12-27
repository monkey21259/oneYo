package main.ict.comment.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.comment.dao.CommentDAO;
import main.ict.comment.vo.CommentVO;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {
	Logger logger = LogManager.getLogger(CommentServiceImpl.class);
	
	@Autowired(required=false)
	private CommentDAO commentDAO;
	
	//댓글 insert
	@Override
	public int commentInsert(CommentVO covo) {
		// TODO Auto-generated method stub
		logger.info("commentInsert() 함수 진입 : ");
		return commentDAO.commentInsert(covo);
	}//end of commentInsert() method

	//댓글 select all
	@Override
	public List<CommentVO> commentSelectAll(CommentVO covo) {
		// TODO Auto-generated method stub
		logger.info("commentSelectAll() 함수 진입 : ");
		return commentDAO.commentSelectAll(covo);
	}//end of commentSelectAll() method

	//댓글 delete
	@Override
	public int commentDelete(CommentVO covo) {
		// TODO Auto-generated method stub
		logger.info("commentDelete() 함수 진입 : ");
		return commentDAO.commentDelete(covo);
	}//end of commentDelete() method
	
}//end of CommentServiceImpl class
