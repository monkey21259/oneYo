package main.ict.common;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public abstract class CodeUtils {
	
	static Logger logger = LogManager.getLogger(CodeUtils.class);
	
	public static String getRcategory(String catV) {
		
		logger.info("getRcategory() - 음식 카테고리 매핑 함수 진입.");
		logger.info("catV: " + catV);
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
	
	public static String getRcategoryVal(String catV) {
		
		logger.info("getRcategoryVal() - 음식 카테고리 매핑 함수 진입.");
		logger.info("catV: " + catV);
		if (catV == null) {
			return null;
		}

		try {
			if (catV.equals("기타")) { return "99"; }
			else if ("한식,중식,양식,일식,디저트".contains(catV)) {
				for (int i=0; i<ConstPack.RECIPE_CAT_ARR.length; i++) {
					String category = ConstPack.RECIPE_CAT_ARR[i];
					if (category.equals(catV)) {
						return "0" + i;
					}
				}
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
		logger.info("diffV: " + diffV);
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
	
	public static String getRdiffVal(String diffV) {
		
		logger.info("getRdiffVal() - 조리 난이도 매핑 함수 진입.");
		if (diffV == null) {
			return null;
		}
		
		try {
			for (int i=0; i<ConstPack.RECIPE_DIFF_ARR.length; i++) {
				if (ConstPack.RECIPE_DIFF_ARR[i].equals(diffV)) {
					return ConstPack.RECIPE_DIFF_IDX_ARR[i];
				}
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		
		logger.info("또 다른 무언가");
		return null;
		
	}

	public static String getRperson(String personV) {
		
		logger.info("getRperson() - 조리 난이도 매핑 함수 진입.");
		logger.info("personV: " + personV);
		if (personV == null) {
			return null;
		}
		
		Integer rPerson = null;
		try {
			if (personV.contains("인분")) {
				personV = personV.split("인분")[0];
			}
			rPerson = Integer.parseInt(personV);
		} catch (Exception e) {  // NumberFormat Exception
			logger.info(e.getMessage());
			rPerson = 0;
		}
		
		return rPerson + "인분";
	}
	
//신고
	public static String getWcategory(String wcate){
		logger.info("신고 매핑함수 진입>>>");
		logger.info("신고분야(Wcategory) >>> : " + wcate);
		
		//public static final String[] WARNING_IND_ARR = {"00", "01", "02", "03", "04", "99"};
		//public static final String[] WARNING_ARR = {"욕설 및 비방", "음란물", "불법광고", "도배성", "주제와 맞지 않음", "기타"};
		
		logger.info("WARNING_IND_ARR 길이 >>> : " +ConstPack.WARNING_IND_ARR.length);
		
		
		logger.info("wcate.length() >>> : " + wcate.length());
		
		for(int i=wcate.length(); i< 4; i++) {
			wcate = "0" + wcate;
			logger.info("wcate 0븉이기 >>> : " + wcate);
		}
		
		for(int j=0; j< ConstPack.WARNING_ARR.length; j++) {
		if(wcate.equals(ConstPack.WARNING_IND_ARR[j])) {
				wcate = ConstPack.WARNING_ARR[j];
				logger.info("wcate >>> : " + wcate);
			} //if
		} //for
	
		return wcate;
	}
	
	public static void main(String[] args) {
		
		logger.info(CodeUtils.getRcategory("-1"));
		logger.info(CodeUtils.getRdiff("0"));
		logger.info(CodeUtils.getWcategory("0"));
		
		
	}
	
}