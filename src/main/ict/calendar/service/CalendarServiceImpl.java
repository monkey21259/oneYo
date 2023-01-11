package main.ict.calendar.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.calendar.dao.CalendarDAO;
import main.ict.calendar.vo.CalendarVO;

@Service
@Transactional
public class CalendarServiceImpl implements CalendarService {
	Logger logger = LogManager.getLogger(CalendarServiceImpl.class);
	
	@Autowired(required = false)
	private CalendarDAO calendarDAO;

	@Override
	public List<CalendarVO> calendarSelectAll() {
		// TODO Auto-generated method stub
		logger.info("calendarSelectAll()함수 진입 : ");
		
		return calendarDAO.calendarSelectAll();
	}

	@Override
	public int calendarInsert(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarInsert()함수 진입 : ");
		
		return calendarDAO.calendarInsert(cvo);
	}

}
