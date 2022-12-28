package main.ict.common;

public abstract class ChabunUtils {
	
	//채번 매기기 함수
	public static String numPad(String ymdFlag, String num) {
		
		for(int i=num.length(); i<4; i++) {
			num = "0" + num;
		}//end of for
		
		String ymd = DateFormat.ymdFormats(ymdFlag);
		
		return ymd.concat(num);
	}//end of numPad()
	
	//회원
	public static String getMemberChabun(String ymdFlag, String num) {
		
		return ConstPack.MEMBER_GUBUN.concat(ChabunUtils.numPad(ymdFlag, num));
	}//end of getMemChabun() method
	
	//레시피
	public static String getRecipeChabun(String ymdFlag, String num) {
		
		return ConstPack.RECIPE_GUBUN.concat(ChabunUtils.numPad(ymdFlag, num));
	}//end of getMemChabun() method
	
	//전문가 팁
	public static String getTipChabun(String ymdFlag, String num) {
		
		return ConstPack.TIP_GUBUN.concat(ChabunUtils.numPad(ymdFlag, num));
	}//end of getMemChabun() method
	
	//경고
	public static String getWarningChabun(String ymdFlag, String num) {
		
		return ConstPack.WARNING_GUBUN.concat(ChabunUtils.numPad(ymdFlag, num));
	}//end of getMemChabun() method
	
	//댓글
	public static String getCommentChabun(String ymdFlag, String num) {
		
		return ConstPack.COMMENT_GUBUN.concat(ChabunUtils.numPad(ymdFlag, num));
	}//end of getMemChabun() method
	
	//커뮤니티
	public static String getCommunityChabun(String ymdFlag, String num) {
		
		return ConstPack.COMMUNITY_GUBUN.concat(ChabunUtils.numPad(ymdFlag, num));
	}//end of getMemChabun() method
	
	//등업
	public static String getLevelupChabun(String ymdFlag, String num) {
		
		return ConstPack.LEVELUP_GUBUN.concat(ChabunUtils.numPad(ymdFlag, num));
	}//end of getMemChabun() method
	
	//좋아요
	public static String getLikeChabun(String ymdFlag, String num) {
		
		return ConstPack.LIKE_GUBUN.concat(ChabunUtils.numPad(ymdFlag, num));
	}//end of getMemChabun() method
	
	//공지사항
	public static String getNoticeChabun(String ymdFlag, String num) {
		
		return ConstPack.NOTICE_GUBUN.concat(ChabunUtils.numPad(ymdFlag, num));
	}//end of getMemChabun() method
	
	//신고번호
	
}//end of ChabunUtils abstract class
