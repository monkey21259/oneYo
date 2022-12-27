package main.ict.comment.vo;

public class CommentVO {
	
	private String conum;
	private String cotnum;
	private String cocontent;
	private String mnum;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	private String mnick; //getter, setter, 생성자 추가부터 시작하자
	
	//페이징
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	private String noticeno;
	
	//좋아요
	private int likecnt;

	//default constructor
	public CommentVO() {
		
	}
	
	//constructor using fields
	public CommentVO(String conum, String cotnum, String cocontent, String mnum, String deleteyn, String insertdate,
			String updatedate, String pageSize, String groupSize, String curPage, String totalCount, String noticeno,
			int likecnt, String mnick) {
		
		this.conum = conum;
		this.cotnum = cotnum;
		this.cocontent = cocontent;
		this.mnum = mnum;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.noticeno = noticeno;
		this.likecnt = likecnt;
		this.mnick = mnick;
	}

	//getter
	public String getConum() {
		return conum;
	}

	public String getCotnum() {
		return cotnum;
	}

	public String getCocontent() {
		return cocontent;
	}

	public String getMnum() {
		return mnum;
	}

	public String getDeleteyn() {
		return deleteyn;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public String getPageSize() {
		return pageSize;
	}

	public String getGroupSize() {
		return groupSize;
	}

	public String getCurPage() {
		return curPage;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public String getNoticeno() {
		return noticeno;
	}

	public int getLikecnt() {
		return likecnt;
	}
	
	public String getMnick() {
		return mnick;
	}

	//setter
	public void setConum(String conum) {
		this.conum = conum;
	}

	public void setCotnum(String cotnum) {
		this.cotnum = cotnum;
	}

	public void setCocontent(String cocontent) {
		this.cocontent = cocontent;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	public void setNoticeno(String noticeno) {
		this.noticeno = noticeno;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	
}//end of CommentVO class
