package main.ict.calendar.service;

import java.util.List;

import main.ict.calendar.vo.CalendarVO;

public interface CalendarService {

	public List<CalendarVO> calendarSelectAll();
	public int calendarInsert(CalendarVO cvo);

}
