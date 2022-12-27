package main.ict.comment.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOImpl implements CommentDAO {
	Logger logger = LogManager.getLogger(CommentDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
}//end of CommentDAOImpl class
