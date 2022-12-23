package main.ict.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.notice.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	Logger logger = LogManager.getLogger(NoticeDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	//INSERT
	@Override
	public int noticeInsert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		logger.info("noticeInsert() 함수 진입 : ");
		return (Integer)sqlSession.insert("noticeInsert", nvo);
	}//end of noticeInsert() method
	
	//SELECT ALL
	@Override
	public List<NoticeVO> noticeSelectAll(NoticeVO nvo) {
		// TODO Auto-generated method stub
		logger.info("noticeSelectAll() 함수 진입 : ");
		return sqlSession.selectList("noticeSelectAll", nvo);
	}//end of noticeSelectAll() method
	
}//end of NoticeDAOImpl class
