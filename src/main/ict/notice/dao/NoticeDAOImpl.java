package main.ict.notice.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	Logger logger = LogManager.getLogger(NoticeDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
}//end of NoticeDAOImpl class
