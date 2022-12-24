package main.ict.common;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public abstract class CodeUtils {
	
	static Logger logger = LogManager.getLogger(CodeUtils.class);
	
	public static String getRcategory(String catV) {
		
		logger.info("getRcategory() - 음식 카테고리 매핑 함수 진입.");
		if (catV == null) {
			return null;
		}
		
		try {
			if (catV.equals("99")) { return "기타"; }
			else if ("00,01,02,03,04".contains(catV)) {
				return ConstPack.RECIPE_CAT_ARR[Integer.parseInt(catV)];
			}
			else { return ""; }
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		
		logger.info("또 다른 무언가");
		return null;
	}
	
	public static String getRdiff(String diffV) {
		
		logger.info("getRdiff() - 조리 난이도 매핑 함수 진입.");
		if (diffV == null) {
			return null;
		}
		
		try {
			if ("0,1,2".contains(diffV)) {
				return ConstPack.RECIPE_DIFF_ARR[Integer.parseInt(diffV)];
			}
			else { return ""; }
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		
		logger.info("또 다른 무언가");
		return null;
		
	}
	
	public static String getRperson(String personV) {
		
		logger.info("getRdiff() - 조리 난이도 매핑 함수 진입.");
		if (personV == null) {
			return null;
		}
		
		Integer rPerson = null;
		try {
			rPerson = Integer.parseInt(personV);
		} catch (Exception e) {  // NumberFormat Exception
			logger.info(e.getMessage());
			rPerson = 0;
		}
		
		return rPerson + "인분";
	}
	
	public static void main(String[] args) {
		
		logger.info(CodeUtils.getRcategory("-1"));
		logger.info(CodeUtils.getRdiff("0"));
		
		
	}
	
}
