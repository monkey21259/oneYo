package main.ict.levelup.vo;

public class LevelupVO {

	private String levelupnum; //순번
	private String lvnum; //등업번호 
	private String lvsubject; //등업제목
	private String lvcontent; //등업내용
	private String lvphoto; //등업사진
	private String mnum; //회원번호
	private String processyn; //등업처리여부
	private String insertdate; //등록일
	private String updatedate; //수정일
	
	//페이징
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	//닉네임
	private String mnick; //회원닉네임
	
//디폴트생성자	
	public LevelupVO() {
	}

//매개변수 있는 생성자	
	public LevelupVO(String levelupnum, String lvnum, String lvsubject, String lvcontent, String lvphoto, String mnum,
			String processyn, String insertdate, String updatedate, String mnick) {
		
		this.levelupnum = levelupnum;
		this.lvnum = lvnum;
		this.lvsubject = lvsubject;
		this.lvcontent = lvcontent;
		this.lvphoto = lvphoto;
		this.mnum = mnum;
		this.processyn = processyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.mnick = mnick;
	}
	
	
	
	public LevelupVO(String levelupnum, String lvnum, String lvsubject, String lvcontent, String lvphoto, String mnum,
			String processyn, String insertdate, String updatedate, String pageSize, String groupSize, String curPage,
			String totalCount, String mnick) {
	
		this.levelupnum = levelupnum;
		this.lvnum = lvnum;
		this.lvsubject = lvsubject;
		this.lvcontent = lvcontent;
		this.lvphoto = lvphoto;
		this.mnum = mnum;
		this.processyn = processyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.mnick = mnick;
	}

//getter, setter	

	public String getLvnum() {
		return lvnum;
	}

	public void setLvnum(String lvnum) {
		this.lvnum = lvnum;
	}

	public String getLvsubject() {
		return lvsubject;
	}

	public void setLvsubject(String lvsubject) {
		this.lvsubject = lvsubject;
	}

	public String getLvcontent() {
		return lvcontent;
	}

	public void setLvcontent(String lvcontent) {
		this.lvcontent = lvcontent;
	}

	public String getLvphoto() {
		return lvphoto;
	}

	public void setLvphoto(String lvphoto) {
		this.lvphoto = lvphoto;
	}

	public String getMnum() {
		return mnum;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public String getProcessyn() {
		return processyn;
	}

	public void setProcessyn(String processyn) {
		this.processyn = processyn;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	} 

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public String getLevelupnum() {
		return levelupnum;
	}

	public void setLevelupnum(String levelupnum) {
		this.levelupnum = levelupnum;
	}

	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
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
	
	
	
} //class
