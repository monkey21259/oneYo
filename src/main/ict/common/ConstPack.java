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
	//public static final String COMMON_IMG_PATH = "C:\\00.KOSMO120\\30.web\\el_ict_work\\oneYo\\webapp\\img\\";
	public static final String COMMON_IMG_PATH = "C:\\00.KOSMO120\\30.web\\el_project_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\oneYo\\img\\";
	
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
	public static final int MEMBER_PAGE_SIZE = 10; //한페이지에 나오는 ROW 수
	public static final int MEMBER_GROUP_SIZE = 5; //그룹페이지 개수
	public static final int MEMBER_CUR_PAGE = 1; //현재페이지
	public static final int MEMBER_TOTAL_COUNT = 0; //총 게시글 수
	
	//recipe
	public static final int RECIPE_PAGE_SIZE = 12; 
	public static final int RECIPE_GROUP_SIZE = 5; 
	public static final int RECIPE_CUR_PAGE = 1; 
	public static final int RECIPE_TOTAL_COUNT = 0; 
		
	//tip
	public static final int TIP_PAGE_SIZE = 12; 
	public static final int TIP_GROUP_SIZE = 5; 
	public static final int TIP_CUR_PAGE = 1; 
	public static final int TIP_TOTAL_COUNT = 0;
	
	//community
	public static final int COMMUNITY_PAGE_SIZE = 20;
	public static final int COMMUNITY_GROUP_SIZE = 5; 
	public static final int COMMUNITY_CUR_PAGE = 1; 
	public static final int COMMUNITY_TOTAL_COUNT = 0; 
	
	//levelup
	public static final int LEVELUP_PAGE_SIZE = 10;
	public static final int LEVELUP_GROUP_SIZE = 5; 
	public static final int LEVELUP_CUR_PAGE = 1; 
	public static final int LEVELUP_TOTAL_COUNT = 0; 
	
	//notice
	public static final int NOTICE_PAGE_SIZE = 20;
	public static final int NOTICE_GROUP_SIZE = 5; 
	public static final int NOTICE_CUR_PAGE = 1; 
	public static final int NOTICE_TOTAL_COUNT = 0; 
	
	//warning
	public static final int WARNING_PAGE_SIZE = 10;
	public static final int WARNING_GROUP_SIZE = 5; 
	public static final int WARNING_CUR_PAGE = 1; 
	public static final int WARNING_TOTAL_COUNT = 0; 

	// ------------------------------------
	// 코드값 라벨링 관련 상수
	public static final String[] MEM_GRADE_ARR = {"일반", "전문가", "관리자"};
	public static final String[] MEM_GRADE_IDX_ARR = {"0", "1","9"};
	public static final String[] RECIPE_CAT_ARR = {"한식", "중식", "양식", "일식", "디저트", "기타"};
	public static final String[] RECIPE_CAT_IDX_ARR = {"00", "01", "02", "03", "04", "99"};
	public static final String[] RECIPE_DIFF_ARR = {"쉬움", "보통", "어려움"};
	public static final String[] RECIPE_DIFF_IDX_ARR = {"0", "1", "2"};
	
	// SNS(네이버) 관련 상수
	public static final String M_NAVER_STATE = "oneYo120";  // 사이트간 요청 위조 방지를 위한 상태 토큰값(인코딩을 적용한 값 사용)
	public static final String M_NAVER_CID = "ONEHnTFShtFKdeomauWh";  // App 등록 시 발급받은 Client ID
	public static final String M_NAVER_CSECRET = "9VNi2Puk9t";  // App 등록 시 발급받은 Client secret
	public static final String M_NAVER_FR_ID = "naver_";  // 회원 가입시 아이디에 붙일 네이버 이름
	// SNS(카카오) 관련 상수
	public static final String M_KAKAO_FR_ID = "kakao_";  // 회원 가입시 아이디에 붙일 카카오 이름

	//신고
	public static final String[] WARNING_ARR = {"욕설 및 비방", "음란물", "불법광고", "도배성", "주제와 맞지 않음", "기타"};
	public static final String[] WARNING_IND_ARR = {"00", "01", "02", "03", "04", "99"};
	
	//팁 분야
	public static final String[] TIP_ARR = {"요리", "주방관리", "재료정보", "기타"};
	public static final String[] TIP_IND_ARR = {"00", "01", "02", "99"};
	
}//end of ConstPack abstract class
