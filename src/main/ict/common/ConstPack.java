package main.ict.common;

public abstract class ConstPack {
	
	//구분코드
	public static final String MEMBER_GUBUN = "M";
	public static final String RECIPE_GUBUN = "R";
	public static final String TIP_GUBUN = "T";
	public static final String WARNING_GUBUN = "W";
	public static final String COMMENT_GUBUN = "CO";
	public static final String COMMUNITY_GUBUN = "C";
	public static final String LEVELUP_GUBUN = "LV";
	public static final String LIKE_GUBUN = "L";
	public static final String NOTICE_GUBUN = "N";
	
	
	//파일 업로드
	public static final String COMMON_IMG_PATH = "C:\\00.KOSMO120\\30.web\\el_ict_work\\oneYo\\webapp\\img\\";
	
	public static final String	MEMBER_IMG_PATH = COMMON_IMG_PATH + "mem";
	public static final int		MEMBER_IMG_SIZE = 10 * 1024 * 1024;
	public static final String	MEMBER_ENC_TYPE = "UTF-8";
	
	public static final String	RECIPE_IMG_PATH = COMMON_IMG_PATH + "recipe";
	public static final int		RECIPE_IMG_SIZE = 10 * 1024 * 1024;
	public static final String	RECIPE_ENC_TYPE = "UTF-8";
	
	public static final String	TIP_IMG_PATH = COMMON_IMG_PATH + "tip";
	public static final int		TIP_IMG_SIZE = 10 * 1024 * 1024;
	public static final String	TIP_ENC_TYPE = "UTF-8";
	
	public static final String	COMMUNITY_IMG_PATH = COMMON_IMG_PATH + "community";
	public static final int		COMMUNITY_IMG_SIZE = 10 * 1024 * 1024;
	public static final String	COMMUNITY_ENC_TYPE = "UTF-8";
	
	public static final String	LEVELUP_IMG_PATH = COMMON_IMG_PATH + "levelup";
	public static final int		LEVELUP_IMG_SIZE = 10 * 1024 * 1024;
	public static final String	LEVELUP_ENC_TYPE = "UTF-8";
	
	public static final String	NOTICE_IMG_PATH = COMMON_IMG_PATH + "notice";
	public static final int		NOTICE_IMG_SIZE = 10 * 1024 * 1024;
	public static final String	NOTICE_ENC_TYPE = "UTF-8";
	
}//end of ConstPack abstract class
