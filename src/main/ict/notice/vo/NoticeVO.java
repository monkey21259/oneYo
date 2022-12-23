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
	private String pagesize;
	private String groupsize;
	private String curpage;
	private String totalcount;
	
	//default constructor
	public NoticeVO() {
		
	}
	
	//constructor using fields
	public NoticeVO(String nnum, String nsubject, String ncontent, String nphoto, String deleteyn, String insertdate,
			String updatedate, int nhit, String pagesize, String groupsize, String curpage, String totalcount) {
		super();
		this.nnum = nnum;
		this.nsubject = nsubject;
		this.ncontent = ncontent;
		this.nphoto = nphoto;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.nhit = nhit;
		this.pagesize = pagesize;
		this.groupsize = groupsize;
		this.curpage = curpage;
		this.totalcount = totalcount;
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

	public String getPagesize() {
		return pagesize;
	}

	public String getGroupsize() {
		return groupsize;
	}

	public String getCurpage() {
		return curpage;
	}

	public String getTotalcount() {
		return totalcount;
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

	public void setPagesize(String pagesize) {
		this.pagesize = pagesize;
	}

	public void setGroupsize(String groupsize) {
		this.groupsize = groupsize;
	}

	public void setCurpage(String curpage) {
		this.curpage = curpage;
	}

	public void setTotalcount(String totalcount) {
		this.totalcount = totalcount;
	}
	
}//end of NoticeVO class
