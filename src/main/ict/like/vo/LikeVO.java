package main.ict.like.vo;

public class LikeVO {
	
	private String lnum;
	private String mnum;
	private String likethis;
	private String likeyn;
	private String likedate;
	private String likecount; //좋아요 개수
	
	//default constructor
	public LikeVO() {
		
	}
	
	//constructor using fields
	public LikeVO(String lnum, String mnum, String likethis, String likeyn, String likedate, String likecount) {
		
		this.lnum = lnum;
		this.mnum = mnum;
		this.likethis = likethis;
		this.likeyn = likeyn;
		this.likedate = likedate;
		this.likecount = likecount;
	}
	
	//getter
	public String getLnum() {
		return lnum;
	}
	public String getMnum() {
		return mnum;
	}
	public String getLikethis() {
		return likethis;
	}
	public String getLikeyn() {
		return likeyn;
	}
	public String getLikedate() {
		return likedate;
	}
	public String getLikecount() {
		return likecount;
	}
	
	//setter
	public void setLnum(String lnum) {
		this.lnum = lnum;
	}
	public void setMnum(String mnum) {
		this.mnum = mnum;
	}
	public void setLikethis(String likethis) {
		this.likethis = likethis;
	}
	public void setLikeyn(String likeyn) {
		this.likeyn = likeyn;
	}
	public void setLikedate(String likedate) {
		this.likedate = likedate;
	}
	public void setLikecount(String likecount) {
		this.likecount = likecount;
	}
	
}//end of LikeVO class
