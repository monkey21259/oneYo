package main.ict.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class DateFormat {
	
	//년월일
	public static String ymdFormat() {
		
		return new SimpleDateFormat("yyyyMMdd").format(new Date());
	}//end of ymdFormat() method
	
	//년월
	public static String ymFormat() {
		
		return new SimpleDateFormat("yyyyMM").format(new Date());
	}//end of ymdFormat() method
	
	//년
	public static String yFormat() {
		
		return new SimpleDateFormat("yyyy").format(new Date());
	}//end of ymdFormat() method
	
	//날짜 형식 지정 함수
	public static String ymdFormats(String ymdFlag) {
		ymdFlag = ymdFlag.toUpperCase();
		
		String y = "";
		if("D".equals(ymdFlag)) {
			y = DateFormat.ymdFormat();
		}//end of if
		if("M".equals(ymdFlag)) {
			y = DateFormat.ymFormat();
		}//end of if
		if("Y".equals(ymdFlag)) {
			y = DateFormat.yFormat();
		}//end of if
		if("N".equals(ymdFlag)) {
			y = "";
		}//end of if
		
		return y;
	}//end of ymdFormat() method
	
}//end of DateFormat abstract class
