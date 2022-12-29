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
	private String wtmnum;
	private String wtmnick;
	
	private String allnum;
	private String allsubject;
	private String value;
//신고자 닉네임
	private String mnick; //신고자 닉네임

//디폴트생성자	
	public WarningVO() {
		
		}


//매개변수 있는 생성자	
	public WarningVO(String warningnum, String wnum, String wtnum, String wcategory, String wcontent, String mnum, String deleteyn,
			String insertdate, String mnick, String allnum, String allsubject, String value, String wtmnum, String wtmnick) {
		this.warningnum = warningnum;
		this.wnum = wnum;
		this.wtnum = wtnum;
		this.wcategory = wcategory;
		this.wcontent = wcontent;
		this.mnum = mnum;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.mnick = mnick;
		this.allnum = allnum;
		this.allsubject = allsubject;
		this.value = value;
		this.wtmnum = wtmnum;
		this.wtmnick = wtmnick;
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


	public String getAllnum() {
		return allnum;
	}


	public void setAllnum(String allnum) {
		this.allnum = allnum;
	}


	public String getAllsubject() {
		return allsubject;
	}


	public void setAllsubject(String allsubject) {
		this.allsubject = allsubject;
	}


	public String getValue() {
		return value;
	}


	public void setValue(String value) {
		this.value = value;
	}


	public String getWtmnum() {
		return wtmnum;
	}


	public void setWtmnum(String wtmnum) {
		this.wtmnum = wtmnum;
	}


	public String getWtmnick() { 
		return wtmnick;
	}


	public void setWtmnick(String wtmnick) {
		this.wtmnick = wtmnick;
	}
	
	
} //class
