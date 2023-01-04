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
	
	public static String[] getMhpParts(String mhp) {
		
		logger.info("getMhpParts() 함수 진입");
		String[] mhpParts = {"", "", ""};
		if (mhp == null || mhp.equals("null") || mhp.equals("")) {
			return mhpParts;
		}
		return mhp.split("-");
	}

////관리자페이지에 adminHome에 들어가는  신고분야
	public static String getWcategory(String wcate){
		logger.info("신고분야(getWcategory) 함수 진입>>>");
		logger.info("신고분야(getWcategory) >>> : " + wcate);

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
		
		String tipcate1 = null;
		
		for(int i=0; i < ConstPack.TIP_ARR.length; i++) {
			if(tipcate.equals(ConstPack.TIP_IND_ARR[i])) {
				tipcate1 = ConstPack.TIP_ARR[i];
			}
			
		}
		
		return tipcate1;
	}
	
//관리자페이지 요리분야 배열	

	public static String getAdminRcate(String rcate) {
		logger.info("관리자 회원목록 요리분야(getAdminRcate) 함수 진입>>>");
		
		//IDX_ARR 담을 배열
		String rcate1[] = null;
		
		// CAT_ARR 뽑을거
		String rcateV = "";
		
		if (rcate != null || rcate.length() > 0) {
			
			//배열쪼개기
			rcate1 = rcate.split("#");
			logger.info("rcate1 >>> : " + rcate1);
			logger.info("rcate1[1] >>> : " + rcate1[1]);
			logger.info("ConstPack.RECIPE_CAT_IDX_ARR[0]) >>> : " + ConstPack.RECIPE_CAT_IDX_ARR[0]);
			
			for(int i=1; i<rcate1.length; i++) { // 배열인덱스길이만큼 
				if(i>1) {
					rcateV += ",";
				} //if
				for(int j = 0; j < ConstPack.RECIPE_CAT_IDX_ARR.length-1; j++) { 
				
					if(rcate1[i].equals(ConstPack.RECIPE_CAT_IDX_ARR[j])) {
						rcateV += ConstPack.RECIPE_CAT_ARR[j];
					} //if
				} //for
			} //for
			
		} //if	
		
		return rcateV;
			
		
	} //getAdminRcate
		
// value-category 바인딩
	public static String getCategory(String categoryNumber) {
		
		String retStr = "";
		if (categoryNumber == null) { return retStr; }
		if (categoryNumber.equals("1")) {
			retStr = "레시피";
			return retStr;
		}
		if (categoryNumber.equals("2")) {
			retStr = "전문가팁";
			return retStr;
		}
		if (categoryNumber.equals("3")) {
			retStr = "커뮤니티";
			return retStr;
		}
		if (categoryNumber.equals("4")) {
			retStr = "공지사항";
			return retStr;
		}
		return retStr;
	}
	
	public static void main(String[] args) {
		
		
		logger.info(CodeUtils.getRcategoryVal("00"));
		logger.info(CodeUtils.getRcategory("-1"));
		logger.info(CodeUtils.getRdiff("0"));
		logger.info(CodeUtils.getWcategory("00"));
		logger.info(CodeUtils.getAdminRcate("#00#01#02"));
		
		
	}
	
}
