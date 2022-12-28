package main.ict.common;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public abstract class CodeUtils {
	
	static Logger logger = LogManager.getLogger(CodeUtils.class);
	
	//	프로필 조회 시 선호 카테고리 뷰
	public static String getMCategorys(String mCatV) {
		
		
		String mcate = "";
		
		if (mCatV == null || mCatV.length() == 0) return mcate;
		
		String[] mcategorys = null;
		mcategorys = mCatV.split("#");
		
		for (int i = 1; i < mcategorys.length; i++) {
			
			if (i > 1) {
				mcate += " / ";	//	처음이 아닐 시 문자열에 들어가는 것
			}
			
			for (int j = 0; j < ConstPack.RECIPE_CAT_IDX_ARR.length; j++) {
				
				if (mcategorys[i].equals(ConstPack.RECIPE_CAT_IDX_ARR[j])) {
					
					mcate += "#" + ConstPack.RECIPE_CAT_ARR[j];
				}
			}
		}
		return mcate;
	}	//	프로필 조회 시 선호 카테고리 뷰
	
	public static String getAdminRcategorys(String mcategorys) {
		
		
		String mcate = "";	
			
			for (int j = 0; j < ConstPack.RECIPE_CAT_IDX_ARR.length; j++) {
				
				if (mcategorys.equals(ConstPack.RECIPE_CAT_IDX_ARR[j])) {
					
					mcate = ConstPack.RECIPE_CAT_ARR[j];
				}
			
		}
		return mcate;
	}	//	프로필 조회 시 선호 카테고리 뷰
	
	//	프로필 조회 시 선호 카테고리 뷰
	public static String getMgradeVal(String mgrade) {
		
		logger.info("getMgradeVal - mgrade: " + mgrade);
		
		String mgr = "";
		
		if (mgrade == null || mgrade.length() == 0) return mgr;
		
		for (int i = 0; i < ConstPack.MEM_GRADE_IDX_ARR.length; i++) {
			
			logger.info("getMgradeVal - MEM_GRADE_IDX_ARR: " + ConstPack.MEM_GRADE_IDX_ARR[i]);
			
			if (mgrade.equals(ConstPack.MEM_GRADE_IDX_ARR[i])) {
				
				mgr = ConstPack.MEM_GRADE_ARR[i];
			}
		}
		logger.info("mgr: " + mgr);
		return mgr;
	}	//	프로필 조회 시 선호 카테고리 뷰
	
	
	
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
	
////관리자페이지에 adminHome에 들어가는  신고분야
	public static String getWcategory(String wcate){
		logger.info("신고분야(getWcategory) 함수 진입>>>");
		logger.info("신고분야(getWcategory) >>> : " + wcate);
		
		//public static final String[] WARNING_IND_ARR = {"00", "01", "02", "03", "04", "99"};
		//public static final String[] WARNING_ARR = {"욕설 및 비방", "음란물", "불법광고", "도배성", "주제와 맞지 않음", "기타"};
		String wcate1 = null;
		
		if(wcate.equals("00")) {
			wcate1 = "욕설 및 비방";
		}else if(wcate.equals("01")) {
			wcate1 = "음란물";
		}else if(wcate.equals("02")) {
			wcate1 = "불법광고";
		}else if(wcate.equals("03")) {
			wcate1 = "도배성";
		}else if(wcate.equals("04")) {
			wcate1 = "주제와 맞지 않음";
		}else if(wcate.equals("99")) {
			wcate1 = "기타";
		}
			
		
		return wcate1;
	}

	
//관리자페이지에 adminHome에 들어가는 팁분야	
	public static String getTipcate(String tipcate) {
		logger.info("신고분야(getTipcate) 함수 진입>>>");
//		public static final String[] TIP_ARR = {"요리", "주방관리", "재료정보", "기타"};
//		public static final String[] TIP_IND_ARR = {"00", "01", "02", "99"};
		
		String tipcate1 = null;
		
		for(int i=0; i < ConstPack.TIP_ARR.length; i++) {
			if(tipcate.equals(ConstPack.TIP_IND_ARR[i])) {
				tipcate1 = ConstPack.TIP_ARR[i];
			}
			
		}
		
		return tipcate1;
	}

	
	public static void main(String[] args) {
		
		
		logger.info(CodeUtils.getRcategoryVal("00"));
		logger.info(CodeUtils.getRcategory("-1"));
		logger.info(CodeUtils.getRdiff("0"));
		logger.info(CodeUtils.getWcategory("00"));
		
		
		
		
	}
	
}
