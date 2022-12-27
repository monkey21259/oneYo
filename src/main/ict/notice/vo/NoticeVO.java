package main.ict.notice.vo;

public class NoticeVO {
	
	private String nnum;
	private String nsubject;
	private String ncontent;
	private String nphoto;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	private int nhit;
	
	//페이징
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	private String noticeno;
	
	//좋아요
	private int likecnt;
	
	//default constructor
	public NoticeVO() {
		
	}

	//constructor using fields
	public NoticeVO(String nnum, String nsubject, String ncontent, String nphoto, String deleteyn, String insertdate,
			String updatedate, int nhit, String pageSize, String groupSize, String curPage, String totalCount,
			String noticeno, int likecnt) {
		
		this.nnum = nnum;
		this.nsubject = nsubject;
		this.ncontent = ncontent;
		this.nphoto = nphoto;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.nhit = nhit;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.noticeno = noticeno;
		this.likecnt = likecnt;
	}

	//getter
	public String getNnum() {
		return nnum;
	}

	public String getNsubject() {
		return nsubject;
	}

	public String getNcontent() {
		return ncontent;
	}

	public String getNphoto() {
		return nphoto;
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

	public int getNhit() {
		return nhit;
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

	//setter
	public void setNnum(String nnum) {
		this.nnum = nnum;
	}

	public void setNsubject(String nsubject) {
		this.nsubject = nsubject;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public void setNphoto(String nphoto) {
		this.nphoto = nphoto;
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

	public void setNhit(int nhit) {
		this.nhit = nhit;
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
	
}//end of NoticeVO class
