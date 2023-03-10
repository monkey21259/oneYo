package main.ict.warning.vo;

public class WarningVO {

	private String warningnum; 	//순번
	private String wnum; 		//신고 번호
	private String wtnum; 		//신고당한 글번호
	private String wcategory; 	//신고분야
	private String wcontent; 	//신고내용
	private String mnum; 		//신고한 회원번호
	private String deleteyn; 	//삭제여부
	private String insertdate;	//작성일
	private String wtmnum;		//신고당한사람회원번호
	private String wtmnick;		//신고당한사람닉네임
	
	private String allnum;
	private String allsubject;
	private String value;

//신고자 닉네임
	private String mnick; //신고한사람 닉네임
	
//페이징
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
//서칭
	private String searchCategory;

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

	
	
//페이징추가
public WarningVO(String warningnum, String wnum, String wtnum, String wcategory, String wcontent, String mnum,
			String deleteyn, String insertdate, String wtmnum, String wtmnick, String allnum, String allsubject,
			String value, String mnick, String pageSize, String groupSize, String curPage, String totalCount) {
		this.warningnum = warningnum;
		this.wnum = wnum;
		this.wtnum = wtnum;
		this.wcategory = wcategory;
		this.wcontent = wcontent;
		this.mnum = mnum;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.wtmnum = wtmnum;
		this.wtmnick = wtmnick;
		this.allnum = allnum;
		this.allsubject = allsubject;
		this.value = value;
		this.mnick = mnick;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
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


	public String getPageSize() {
		return pageSize;
	}


	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}


	public String getGroupSize() {
		return groupSize;
	}


	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}


	public String getCurPage() {
		return curPage;
	}


	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}


	public String getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	
	//search getter, setter
	public String getSearchCategory() {
		return searchCategory;
	}
	
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
} //class
