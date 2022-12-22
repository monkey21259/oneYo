package main.ict.notice.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.notice.dao.NoticeDAO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
	Logger logger = LogManager.getLogger(NoticeServiceImpl.class);
	
	@Autowired(required=false)
	private NoticeDAO noticeDAO;
}//end of NoticeServiceImpl class
