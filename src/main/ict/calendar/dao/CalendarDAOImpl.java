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

	@Override
	public List<CalendarVO> calendarSelectAll() {
		// TODO Auto-generated method stub
		logger.info("calendarSelectAll()함수 진입 : ");
	
		return sqlSession.selectList("calendarSelectAll");
	}

	@Override
	public int calendarInsert(CalendarVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarInsert()함수 진입 : ");
		
		return sqlSession.insert("calendarInsert");
	}

}
