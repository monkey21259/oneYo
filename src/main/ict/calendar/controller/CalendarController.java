package main.ict.calendar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.calendar.service.CalendarService;
import main.ict.calendar.vo.CalendarVO;

@Controller
public class CalendarController {
	Logger logger = LogManager.getLogger(CalendarController.class);
	
	@Autowired(required=false)
	private CalendarService calendarService;
	
	@GetMapping(value="goCalendar")
	public String goCalendar() {
		logger.info("goCalendar()함수 진입 : ");	
		
		return "entertainment/calendar";
	}

	
	// 캘린더 전체조회
	@GetMapping(value="calendarSelectAll", produces="application/text; charset=UTF-8")
	public String calendarSelectAll(HttpServletRequest req, CalendarVO cvo, Model model) {
		logger.info("calendarSelectAll()함수 진입 : ");
		
		List<CalendarVO> aList = calendarService.calendarSelectAll();
		JSONArray jsonCalendar = new JSONArray();
		
		for(int i = 0 ; i < aList.size();i++){
			CalendarVO cvo_1 = aList.get(i);
			JSONObject jobj = new JSONObject();
			jobj.put("_id", cvo_1.getCal_no());
			jobj.put("title", cvo_1.getCal_title());
			jobj.put("description", cvo_1.getCal_description());
			jobj.put("start", cvo_1.getCal_startdate());
			jobj.put("end", cvo_1.getCal_enddate());
			jobj.put("type", cvo_1.getCal_type());
			jobj.put("backgroundColor", cvo_1.getCal_backgroundColor());
			jobj.put("textColor", cvo_1.getCal_textColor());
			boolean bool = false;
			if("true".equals(cvo_1.getCal_allDay())){
				bool = true;
			}
			jobj.put("allDay", bool);
			
			jsonCalendar.add(jobj);
		}
		
		model.addAttribute("jsonCalendar", jsonCalendar);
		
		return "entertainment/calendarData";
	}
	
	// 캘린더 입력
	@GetMapping(value="calendarInsert")
	public String calendarInsert(CalendarVO cvo, Model model) {
		logger.info("calendarInsert()함수 진입 : ");
		logger.info("cvo.getCal_type >>> : " + cvo.getCal_type());
		
		int nCnt = calendarService.calendarInsert(cvo);
		
		model.addAttribute("nCnt", nCnt);
		
		return "entertainment/calendarData";
	}
	
	//캘린더 드래그앤드롭
	@GetMapping(value="calendarDragAndDrop")
	public String calendarDragAndDrop(CalendarVO cvo, Model model) {
		logger.info("calendarDragAndDrop()함수 진입 : ");
		
		//서비스 호출
		int nCnt = calendarService.calendarDragAndDrop(cvo);
		
		model.addAttribute("nCnt", nCnt);
		
		return "entertainment/calendarData";
	}//end of calendarDragAndDrop() method
	
	//일정 수정
	@GetMapping(value="calendarUpdate")
	public String calendarUpdate(CalendarVO cvo, Model model) {
		logger.info("calendarUpdate()함수 진입 : ");
		
		//서비스 호출
		int nCnt = calendarService.calendarUpdate(cvo);
		
		model.addAttribute("nCnt", nCnt);
		
		return "entertainment/calendarData";
	}//end of calendarUpdate() method
	
	//일정 삭제
	@GetMapping(value="calendarDelete")
	public String calendarDelete(CalendarVO cvo, Model model) {
		logger.info("calendarDelete()함수 진입 : ");
		
		//서비스 호출
		int nCnt = calendarService.calendarDelete(cvo);
		
		model.addAttribute("nCnt", nCnt);
		
		return "entertainment/calendarData";
	}//end of calendarDelete() method
}
