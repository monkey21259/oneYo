package main.ict.calendar.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.calendar.vo.CalendarVO;

@Repository
public class CalendarDAOImpl implements CalendarDAO {
	Logger logger = LogManager.getLogger(CalendarDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	//DB에서 일정 목록 가져오기
	@Override
	public List<CalendarVO> calendarSelectAll() {
		// TODO Auto-generated method stub
		logger.info("calendarSelectAll()함수 진입 : ");
	
		return sqlSession.selectList("calendarSelectAll");
	}

	//일정 추가
	@Override
	public int calendarInsert(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarInsert()함수 진입 : ");
		
		return sqlSession.insert("calendarInsert");
	}

	//캘린더 드래그앤드롭
	@Override
	public int calendarDragAndDrop(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarInsert()함수 진입 : ");
		return (Integer)sqlSession.update("calendarDragAndDrop", cvo);
	}
	
	//일정 수정
	@Override
	public int calendarUpdate(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarInsert()함수 진입 : ");
		return (Integer)sqlSession.update("calendarUpdate", cvo);
	}
	
	//일정 삭제
	@Override
	public int calendarDelete(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarDelete()함수 진입 : ");
		return (Integer)sqlSession.update("calendarDelete", cvo);
	}
	
}
