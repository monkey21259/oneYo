package main.ict.common;

import java.text.DecimalFormat;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class NumUtils {
	static Logger logger = LogManager.getLogger(NumUtils.class);
	
	// 기본 생성자
	public NumUtils() {
		
	}
	
	// 문자숫자를 입력받아 천단위에 콤마를 찍어주는 함수
	public String numComma(String number) {
		logger.info("numComma() 함수 진입");
		
		DecimalFormat df = new DecimalFormat("###,###");
		
		return number = df.format(numToInt(number));
	} // end of numComma()
	
	// 문자숫자를 입력받아 int로 변환
	public int numToInt(String number) {
		logger.info("numToInt() 함수 진입");
		
		int outPutNum = 0;
		
		if(number !=null && number.length() > 0) {
			
			outPutNum = Integer.parseInt(number);
			return outPutNum;
		}
		
		return 0;
	}
	
	// 조회수 1만 넘어가면 만단위로 변환(1.0만 ~ 9999.9만) / (1억 ~ 9999.9억)
	public String numToMan(String number) {
		logger.info("numToMan() 함수 진입");
		
		String out = "";
		
		if(number.length() > 8) {
			String sVal_0 = number.substring(0, number.length() - 8);
			String sVal_1 = number.substring(number.indexOf(sVal_0) + 1, (number.indexOf(sVal_0) + 2));
			out = sVal_0.concat(".").concat(sVal_1).concat("억");
			
		}else if(number.length() > 4) {
			String sVal_2 = number.substring(0, number.length() - 4);
			String sVal_3 = number.substring(number.indexOf(sVal_2) + 1, (number.indexOf(sVal_2) + 2));
			out = sVal_2.concat(".").concat(sVal_3).concat("만");
		}else if(number.length() == 4) {
			String sVal_4 = number.substring(0, 1);
			String sVal_5 = number.substring(number.indexOf(sVal_4) + 1, (number.indexOf(sVal_4) + 2));
			out = sVal_4.concat(".").concat(sVal_5).concat("천");
		}else {
			out = number;
		}
		
		return out;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		logger.info("main() 함수 진입");
		
		NumUtils nu = new NumUtils();
		
		String num_0 = "8685";
		String num_1 = "173467";
		String num_2 = "125215125";
		String num_3 = "68658";
		String num_4 = "458484521512";
		String num_5 = "150";
		
		
		num_0 = nu.numToMan(num_0);
		logger.info(num_0);
		
		num_1 = nu.numToMan(num_1);
		logger.info(num_1);
		
		num_2 = nu.numToMan(num_2);
		logger.info(num_2);
		
		num_3 = nu.numToMan(num_3);
		logger.info(num_3);
		
		num_4 = nu.numToMan(num_4);
		logger.info(num_4);

		num_5 = nu.numToMan(num_5);
		logger.info(num_5);
		
		
	} // end of main()
} // end of NumUtils.class
