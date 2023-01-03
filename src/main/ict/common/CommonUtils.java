package main.ict.common;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public abstract class CommonUtils {

	static Logger logger = LogManager.getLogger(CommonUtils.class);
	
	public static String hourToMinutes(String hour) {
		
		return String.valueOf(Integer.parseInt(hour) * 60).concat("분");
	}
	
	public static String hourToMinutes(String hour, String minutes) {
		
		int iVal = Integer.parseInt(hour) * 60;
		iVal += Integer.parseInt(minutes);
		
		return String.valueOf(iVal).concat("분");
	}
	
	public static String minuteToHour(String minutes) {
		
		logger.info("minuteToHour() 함수 진입.");
		if (minutes != null && minutes.equals("") && minutes.equals("분")) {
			logger.info("함수 인자가 유효하지 않습니다.");
			return "";
		}
		
		minutes = minutes.split("분")[0];
		int min = Integer.parseInt(minutes);
		int hour = 0;
		if (min > 60) {
			hour = min / 60;
			min = min % 60;
		}
		logger.info("hour: " + hour);
		logger.info("min: " + min);
		
		return hour + "시" + min + "분";
	}
		
} //class 
