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
		
} //class 
