package main.ict.tip.vo;

public class TipVO {
	
	// 기본 ICT_TIP 테이블에 존재하는 컬럼
	private String tnum;
	private String tsubject;
	private String tcontent;
	private String tphoto;
	private String tcategory;
	private String warning;
	private String thit;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	// 로그인 정보, 글 조회 등으로 받아올 mnum
	private String mnum;
	
	// 글번호
	private String tipnum;
	
	// 글 작성자 닉네임, 글 좋아요 수
	private String mnick;
	private String likecnt;
	
	public TipVO() {

	}

	public TipVO(String tnum, String tsubject, String tcontent, String tphoto, String tcategory, String warning,
			String mnum, String thit, String deleteyn, String insertdate, String updatedate, String tipnum,
			String mnick, String likecnt) {
		this.tnum = tnum;
		this.tsubject = tsubject;
		this.tcontent = tcontent;
		this.tphoto = tphoto;
		this.tcategory = tcategory;
		this.warning = warning;
		this.mnum = mnum;
		this.thit = thit;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.tipnum = tipnum;
		this.mnick = mnick;
		this.likecnt = likecnt;
	}

	public String getTnum() {
		return tnum;
	}

	public void setTnum(String tnum) {
		this.tnum = tnum;
	}

	public String getTsubject() {
		return tsubject;
	}

	public void setTsubject(String tsubject) {
		this.tsubject = tsubject;
	}

	public String getTcontent() {
		return tcontent;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public String getTphoto() {
		return tphoto;
	}

	public void setTphoto(String tphoto) {
		this.tphoto = tphoto;
	}

	public String getTcategory() {
		return tcategory;
	}

	public void setTcategory(String tcategory) {
		this.tcategory = tcategory;
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

	public String getThit() {
		return thit;
	}

	public void setThit(String thit) {
		this.thit = thit;
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

	public String getTipnum() {
		return tipnum;
	}

	public void setTipnum(String tipnum) {
		this.tipnum = tipnum;
	}
	
	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	
	

	public String getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(String likecnt) {
		this.likecnt = likecnt;
	}

	@Override
	public String toString() {
		return "TipVO [tnum=" + tnum + ", tsubject=" + tsubject + ", tcontent=" + tcontent + ", tphoto=" + tphoto
				+ ", tcategory=" + tcategory + ", warning=" + warning + ", thit=" + thit + ", deleteyn=" + deleteyn
				+ ", insertdate=" + insertdate + ", updatedate=" + updatedate + ", mnum=" + mnum + ", tipnum=" + tipnum
				+ ", mnick=" + mnick + ", likecnt=" + likecnt + "]";
	}

}
