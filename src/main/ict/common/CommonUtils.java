package main.ict.common;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public abstract class CommonUtils {

	static Logger logger = LogManager.getLogger(CommonUtils.class);
	
//페이지
	public static final int COMMUNITY_PAGE_SIZE =3; //한페이지에 나오는 ROW 수
	public static final int COMMUNITY_GROUP_SIZE =3; //그룹페이지 개수
	public static final int COMMUNITY_CUR_PAGE =1; //현재페이지
	public static final int COMMUNITY_TOTAL_COUNT =0; //총 게시글 수

} //class 
