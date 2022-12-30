package main.ict.home.vo;

public class HomeVO {
	
	private String recipecnt;
	private String communitycnt;
	private String tipcnt;
	private String membercnt;
	
	public HomeVO() {
	
	}

	public HomeVO(String recipecnt, String communitycnt, String tipcnt, String membercnt) {
		this.recipecnt = recipecnt;
		this.communitycnt = communitycnt;
		this.tipcnt = tipcnt;
		this.membercnt = membercnt;
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

}
