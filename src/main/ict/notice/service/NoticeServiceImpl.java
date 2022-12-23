package main.ict.notice.service;

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
	
}//end of NoticeServiceImpl class
