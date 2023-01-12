package main.ict.calendar.service;

import java.util.List;

import main.ict.calendar.vo.CalendarVO;

public interface CalendarService {
	
	public List<CalendarVO> calendarSelectAll();
	public int calendarInsert(CalendarVO cvo);
	public int calendarDragAndDrop(CalendarVO cvo);
	public int calendarUpdate(CalendarVO cvo);
	public int calendarDelete(CalendarVO cvo);

}
