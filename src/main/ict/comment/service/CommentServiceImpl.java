package main.ict.comment.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.comment.dao.CommentDAO;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {
	Logger logger = LogManager.getLogger(CommentServiceImpl.class);
	
	@Autowired(required=false)
	private CommentDAO commentDAO;
}//end of CommentServiceImpl class
