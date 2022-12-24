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
	
	
	//페이징
	
	//mem
	public static final int MEMBER_PAGE_SIZE = 3; //한페이지에 나오는 ROW 수
	public static final int MEMBER_GROUP_SIZE = 3; //그룹페이지 개수
	public static final int MEMBER_CUR_PAGE = 1; //현재페이지
	public static final int MEMBER_TOTAL_COUNT = 0; //총 게시글 수
	
	//recipe
	public static final int RECIPE_PAGE_SIZE = 3; 
	public static final int RECIPE_GROUP_SIZE = 3; 
	public static final int RECIPE_CUR_PAGE = 1; 
	public static final int RECIPE_TOTAL_COUNT = 0; 
		
	//tip
	public static final int TIP_PAGE_SIZE = 3; 
	public static final int TIP_GROUP_SIZE = 3; 
	public static final int TIP_CUR_PAGE = 1; 
	public static final int TIP_TOTAL_COUNT = 0;
	
	//community
	public static final int COMMUNITY_PAGE_SIZE = 3;
	public static final int COMMUNITY_GROUP_SIZE = 3; 
	public static final int COMMUNITY_CUR_PAGE = 1; 
	public static final int COMMUNITY_TOTAL_COUNT = 0; 
	
	//levelup
	public static final int LEVELUP_PAGE_SIZE = 3;
	public static final int LEVELUP_GROUP_SIZE = 3; 
	public static final int LEVELUP_CUR_PAGE = 1; 
	public static final int LEVELUP_TOTAL_COUNT = 0; 
	
	//notice
	public static final int NOTICE_PAGE_SIZE = 3;
	public static final int NOTICE_GROUP_SIZE = 3; 
	public static final int NOTICE_CUR_PAGE = 1; 
	public static final int NOTICE_TOTAL_COUNT = 0; 

	// ------------------------------------
	// 코드값 라벨링 관련 상수
	public static final String[] RECIPE_CAT_ARR = {"한식", "중식", "양식", "일식", "디저트", "기타"};
	public static final String[] RECIPE_DIFF_ARR = {"쉬움", "보통", "어려움"};
	
	
	
}//end of ConstPack abstract class
