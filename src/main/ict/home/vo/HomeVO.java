package main.ict.home.vo;

public class HomeVO {
	
	private String recipecnt;
	private String communitycnt;
	private String tipcnt;
	private String membercnt;
	
	// 2023-01-05 이성일 추가
	private String mnum;
	private String mnick;
	private String mprofile;
	private String totalrecipe;
	private String totalrecipehitcnt;
	private String totaltip;
	private String totaltiphitcnt;
	private String subscription;
	
	// 정렬조건 
	private String sortcondition;
	
	public HomeVO() {
	
	}

	public HomeVO(String recipecnt, String communitycnt, String tipcnt, String membercnt) {
		this.recipecnt = recipecnt;
		this.communitycnt = communitycnt;
		this.tipcnt = tipcnt;
		this.membercnt = membercnt;
	}

	public HomeVO(String recipecnt, String communitycnt, String tipcnt, String membercnt, String mnum, String mnick,
			String mprofile, String totalrecipe, String totalrecipehitcnt, String totaltip, String totaltiphitcnt,
			String subscription, String sortcondition) {
		this.recipecnt = recipecnt;
		this.communitycnt = communitycnt;
		this.tipcnt = tipcnt;
		this.membercnt = membercnt;
		this.mnum = mnum;
		this.mnick = mnick;
		this.mprofile = mprofile;
		this.totalrecipe = totalrecipe;
		this.totalrecipehitcnt = totalrecipehitcnt;
		this.totaltip = totaltip;
		this.totaltiphitcnt = totaltiphitcnt;
		this.subscription = subscription;
		this.sortcondition = sortcondition;
	}

	public String getRecipecnt() {
		return recipecnt;
	}

	public void setRecipecnt(String recipecnt) {
		this.recipecnt = recipecnt;
	}

	public String getCommunitycnt() {
		return communitycnt;
	}

	public void setCommunitycnt(String communitycnt) {
		this.communitycnt = communitycnt;
	}

	public String getTipcnt() {
		return tipcnt;
	}

	public void setTipcnt(String tipcnt) {
		this.tipcnt = tipcnt;
	}

	public String getMembercnt() {
		return membercnt;
	}

	public void setMembercnt(String membercnt) {
		this.membercnt = membercnt;
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

	public String getMprofile() {
		return mprofile;
	}

	public void setMprofile(String mprofile) {
		this.mprofile = mprofile;
	}

	public String getTotalrecipe() {
		return totalrecipe;
	}

	public void setTotalrecipe(String totalrecipe) {
		this.totalrecipe = totalrecipe;
	}

	public String getTotalrecipehitcnt() {
		return totalrecipehitcnt;
	}

	public void setTotalrecipehitcnt(String totalrecipehitcnt) {
		this.totalrecipehitcnt = totalrecipehitcnt;
	}

	public String getTotaltip() {
		return totaltip;
	}

	public void setTotaltip(String totaltip) {
		this.totaltip = totaltip;
	}

	public String getTotaltiphitcnt() {
		return totaltiphitcnt;
	}

	public void setTotaltiphitcnt(String totaltiphitcnt) {
		this.totaltiphitcnt = totaltiphitcnt;
	}

	public String getSortcondition() {
		return sortcondition;
	}

	public void setSortcondition(String sortcondition) {
		this.sortcondition = sortcondition;
	}

	public String getSubscription() {
		return subscription;
	}

	public void setSubscription(String subscription) {
		this.subscription = subscription;
	}

	@Override
	public String toString() {
		return "HomeVO [recipecnt=" + recipecnt + ", communitycnt=" + communitycnt + ", tipcnt=" + tipcnt
				+ ", membercnt=" + membercnt + ", mnum=" + mnum + ", mnick=" + mnick + ", mprofile=" + mprofile
				+ ", totalrecipe=" + totalrecipe + ", totalrecipehitcnt=" + totalrecipehitcnt + ", totaltip=" + totaltip
				+ ", totaltiphitcnt=" + totaltiphitcnt + ", subscription=" + subscription + ", sortcondition="
				+ sortcondition + "]";
	}
	
}
