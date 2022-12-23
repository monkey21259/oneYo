package main.ict.notice.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.notice.dao.NoticeDAO;
import main.ict.notice.vo.NoticeVO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
	Logger logger = LogManager.getLogger(NoticeServiceImpl.class);
	
	@Autowired(required=false)
	private NoticeDAO noticeDAO;

	//INSERT
	@Override
	public int noticeInsert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		logger.info("noticeInsert() 함수 진입 : ");
		return noticeDAO.noticeInsert(nvo);
	}//end of noticeInsert() method

	//SELECT ALL
	@Override
	public List<NoticeVO> noticeSelectAll(NoticeVO nvo) {
		// TODO Auto-generated method stub
		logger.info("noticeSelectAll() 함수 진입 : ");
		return noticeDAO.noticeSelectAll(nvo);
	}//end of noticeSelectAll() method

	//SELECT CONTENT
	@Override
	public List<NoticeVO> noticeSelectContent(NoticeVO nvo) {
		// TODO Auto-generated method stub
		logger.info("noticeSelectContent() 함수 진입 : ");
		return noticeDAO.noticeSelectContent(nvo);
	}//end of noticeSelectContent() method

	//UPDATE
	@Override
	public int noticeUpdate(NoticeVO nvo) {
		// TODO Auto-generated method stub
		logger.info("noticeUpdate() 함수 진입 : ");
		return noticeDAO.noticeUpdate(nvo);
	}//end of noticeUpdate() method

	//DELETE
	@Override
	public int noticeDelete(NoticeVO nvo) {
		// TODO Auto-generated method stub
		logger.info("noticeDelete() 함수 진입 : ");
		return noticeDAO.noticeDelete(nvo);
	}//end of noticeDelete() method
	
}//end of NoticeServiceImpl class
