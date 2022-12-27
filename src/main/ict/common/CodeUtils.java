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
	
	
	
	public static void main(String[] args) {
		
		logger.info(CodeUtils.getRcategory("-1"));
		logger.info(CodeUtils.getRdiff("0"));
		
		
	}
	
}
