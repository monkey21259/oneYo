package main.ict.warning.vo;

public class WarningVO {

	private String warningnum; //순번
	private String wnum; //신고번호
	private String wtnum; //신고글번호
	private String wcategory; //신고분야
	private String wcontent; //신고내용
	private String mnum; //회원번호
	private String deleteyn; //삭제여부
	private String insertdate; //작성일
 
//신고자 닉네임
	private String mnick; //신고자 닉네임

//디폴트생성자	
	public WarningVO() {
		
		}


//매개변수 있는 생성자	
	public WarningVO(String warningnum, String wnum, String wtnum, String wcategory, String wcontent, String mnum, String deleteyn,
			String insertdate, String mnick) {
		this.warningnum = warningnum;
		this.wnum = wnum;
		this.wtnum = wtnum;
		this.wcategory = wcategory;
		this.wcontent = wcontent;
		this.mnum = mnum;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.mnick = mnick;
	}


//setter, getter	
	public String getWnum() {
		return wnum;
	}


	public void setWnum(String wnum) {
		this.wnum = wnum;
	}


	public String getWtnum() {
		return wtnum;
	}


	public void setWtnum(String wtnum) {
		this.wtnum = wtnum;
	}


	public String getWcategory() {
		return wcategory;
	}


	public void setWcategory(String wcategory) {
		this.wcategory = wcategory;
	}


	public String getWcontent() {
		return wcontent;
	}


	public void setWcontent(String wcontent) {
		this.wcontent = wcontent;
	}


	public String getMnum() {
		return mnum;
	}


	public void setMnum(String mnum) {
		this.mnum = mnum;
	}


	public String getDeleteyn() {
		return deleteyn;
	}


	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}


	public String getInsertdate() {
		return insertdate;
	}


	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}


	public String getWarningnum() {
		return warningnum;
	}


	public void setWarningnum(String warningnum) {
		this.warningnum = warningnum;
	}


	public String getMnick() {
		return mnick;
	}


	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	
	
} //class
