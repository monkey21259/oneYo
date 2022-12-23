package main.ict.recipe.vo;

public class RecipeVO {

	private String rnum;		// 레시피글 고유번호
	private String rsubject;	// 레시피 제목
	private String rcategory;	// 음식 카테고리
	private String rjeryo;		// 재료
	private String rtime;		// 조리 시간
	private String rperson;		// 몇 인분(?)
	private String rdiff;		// 난이도
	private String rcontent;	// 글 내용
	private String rphoto;		// 음식 사진
	private String rhit;		// 조회수
	private String mnum;		// 회원번호
	private String warning;		// 경고누적횟수
	private String deleteyn;	// 삭제여부
	private String insertdate;	// 등록일
	private String updatedate;	// 수정일
	
	// paging
	
	// filter
	
	
	public RecipeVO() {}

	public RecipeVO(String rnum, String rsubject, String rcategory, String rjeryo, String rtime, String rperson,
			String rdiff, String rcontent, String rphoto, String rhit, String mnum, String warning, String deleteyn,
			String insertdate, String updatedate) {
		this.rnum = rnum;
		this.rsubject = rsubject;
		this.rcategory = rcategory;
		this.rjeryo = rjeryo;
		this.rtime = rtime;
		this.rperson = rperson;
		this.rdiff = rdiff;
		this.rcontent = rcontent;
		this.rphoto = rphoto;
		this.rhit = rhit;
		this.mnum = mnum;
		this.warning = warning;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}

	// Getter
	public String getRnum() {
		return rnum;
	}

	public String getRsubject() {
		return rsubject;
	}

	public String getRcategory() {
		return rcategory;
	}

	public String getRjeryo() {
		return rjeryo;
	}

	public String getRtime() {
		return rtime;
	}

	public String getRperson() {
		return rperson;
	}

	public String getRdiff() {
		return rdiff;
	}

	public String getRcontent() {
		return rcontent;
	}

	public String getRphoto() {
		return rphoto;
	}

	public String getRhit() {
		return rhit;
	}

	public String getMnum() {
		return mnum;
	}

	public String getWarning() {
		return warning;
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

	// Setter
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public void setRsubject(String rsubject) {
		this.rsubject = rsubject;
	}

	public void setRcategory(String rcategory) {
		this.rcategory = rcategory;
	}

	public void setRjeryo(String rjeryo) {
		this.rjeryo = rjeryo;
	}

	public void setRtime(String rtime) {
		this.rtime = rtime;
	}

	public void setRperson(String rperson) {
		this.rperson = rperson;
	}

	public void setRdiff(String rdiff) {
		this.rdiff = rdiff;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public void setRphoto(String rphoto) {
		this.rphoto = rphoto;
	}

	public void setRhit(String rhit) {
		this.rhit = rhit;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public void setWarning(String warning) {
		this.warning = warning;
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

	@Override
	public String toString() {
		return "RecipeVO [rnum=" + rnum + ", rsubject=" + rsubject + ", rcategory=" + rcategory + ", rjeryo=" + rjeryo
				+ ", rtime=" + rtime + ", rperson=" + rperson + ", rdiff=" + rdiff + ", rcontent=" + rcontent
				+ ", rphoto=" + rphoto + ", rhit=" + rhit + ", mnum=" + mnum + ", warning=" + warning + ", deleteyn="
				+ deleteyn + ", insertdate=" + insertdate + ", updatedate=" + updatedate + "]";
	}
	
}