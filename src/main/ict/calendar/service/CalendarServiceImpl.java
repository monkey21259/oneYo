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

	//DB에서 일정 목록 가져오기
	@Override
	public List<CalendarVO> calendarSelectAll() {
		// TODO Auto-generated method stub
		logger.info("calendarSelectAll()함수 진입 : ");
		
		return calendarDAO.calendarSelectAll();
	}

	//일정 추가
	@Override
	public int calendarInsert(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarInsert()함수 진입 : ");
		
		return calendarDAO.calendarInsert(cvo);
	}

	//캘린더 드래그앤드롭
	@Override
	public int calendarDragAndDrop(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarDragAndDrop()함수 진입 : ");
		return calendarDAO.calendarDragAndDrop(cvo);
	}

	//일정 수정
	@Override
	public int calendarUpdate(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarUpdate()함수 진입 : ");
		return calendarDAO.calendarUpdate(cvo);
	}

	//일정 삭제
	@Override
	public int calendarDelete(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarDelete()함수 진입 : ");
		return calendarDAO.calendarDelete(cvo);
	}

}
