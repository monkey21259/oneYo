package main.ict.community.vo;

public class CommunityVO { 
	
	//좋아요
	private String likecnt;
	
	private String communitynum; //순번
	private String cnum; //글번호
	private String csubject; //글제목
	private String ccontent; //글내용
	private String cphoto; //글사진
	private String warning; //신고누적횟수
	private String mnum; //회원번호
	private String mnick; //회원닉네임
	private String chit; //조회수
	private String deleteyn; //삭제여부 
	private String insertdate; //등록일
	private String updatedate; //수정일
	
//페이지
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
//디폴트생성자	
	public CommunityVO() {
		
	}

	public CommunityVO(String cnum, String csubject, String ccontent, String cphoto, String warning,
			String mnum, String mnick, String chit, String deleteyn, String insertdate, String updatedate,
			String pageSize, String groupSize, String curPage, String totalCount, String communitynum) {
		this.cnum = cnum;
		this.csubject = csubject;
		this.ccontent = ccontent;
		this.cphoto = cphoto;
		this.warning = warning;
		this.mnum = mnum;
		this.mnick = mnick;
		this.chit = chit;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.totalCount = communitynum;
	}
	
//좋아요 추가한 생성자
	public CommunityVO(String likecnt, String communitynum, String cnum, String csubject, String ccontent,
			String cphoto, String warning, String mnum, String mnick, String chit, String deleteyn, String insertdate,
			String updatedate, String pageSize, String groupSize, String curPage, String totalCount) {

		this.likecnt = likecnt;
		this.communitynum = communitynum;
		this.cnum = cnum;
		this.csubject = csubject;
		this.ccontent = ccontent;
		this.cphoto = cphoto;
		this.warning = warning;
		this.mnum = mnum;
		this.mnick = mnick;
		this.chit = chit;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}

	public String getCnum() {
		return cnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public String getCsubject() {
		return csubject;
	}

	public void setCsubject(String csubject) {
		this.csubject = csubject;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getCphoto() {
		return cphoto;
	}

	public void setCphoto(String cphoto) {
		this.cphoto = cphoto;
	}

	public String getWarning() {
		return warning;
	}

	public void setWarning(String warning) {
		this.warning = warning;
	}

	public String getMnum() {
		return mnum;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	public String getChit() {
		return chit;
	}

	public void setChit(String chit) {
		this.chit = chit;
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

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
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

	public String getCommunitynum() {
		return communitynum;
	}

	public void setCommunitynum(String communitynum) {
		this.communitynum = communitynum;
	}

	public String getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(String likecnt) {
		this.likecnt = likecnt;
	}
	
	
	
	
} //class
