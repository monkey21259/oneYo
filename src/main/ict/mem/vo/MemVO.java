package main.ict.mem.vo;

public class MemVO {
	
	private String mnum;		//	MNUM		//	회원 번호		//	NOT NULL
	private String mid;			//	MID			//	아이디		//	NOT NULL
	private String mpw;			//	MPW			//	비밀번호		//	NOT NULL
	private String mname;		//	MNAME		//	이름			//	
	private String mnick;		//	MNICK		//	닉네임		//	
	private String mhp;			//	MHP			//	핸드폰		//	NOT NULL
	private String memail;		//	MEMAIL		//	이메일		//	NOT NULL
	private String mgrade;		//	MGRADE		//	등급			//	NOT NULL
	private String mprofile;	//	MPROFILE	//	프로필사진		//	
	private String mcategory;	//	MCATEGORY	//	요리 분야		//	
	private String mwarning;	//	MWARNING	//	경고 누적 횟수	//	
	private String deleteyn;	//	DELETEYN	//	삭제 여부		//	NOT NULL
	private String insertdate;	//	INSERTDATE	//	가입 일		//	
	private String updatedate;	//	UPDATEDATE	//	수정 일		//	
	
	public MemVO() {
		//	호출 목적 빈 생성자
	}
	
	//	vo 세팅
	public MemVO(String mnum, String mid, String mpw, String mname, String mnick, String mhp, String memail,
			String mgrade, String mprofile, String mcategory, String mwarning, String deleteyn, String insertdate,
			String updatedate) {
		this.mnum = mnum;
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mnick = mnick;
		this.mhp = mhp;
		this.memail = memail;
		this.mgrade = mgrade;
		this.mprofile = mprofile;
		this.mcategory = mcategory;
		this.mwarning = mwarning;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}

//	MNUM	//	회원 번호	//	NOT NULL
	public String getMnum() {
		return mnum;
	}
	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

//	MID	//	아이디	//	NOT NULL
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}

//	MPW	//	비밀번호	//	NOT NULL
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

//	MNAME	//	이름	//
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}

//	MNICK	//	닉네임	//	
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

//	MHP	//	핸드폰	//	NOT NULL
	public String getMhp() {
		return mhp;
	}
	public void setMhp(String mhp) {
		this.mhp = mhp;
	}

//	MEMAIL	//	이메일	//	NOT NULL
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}

//	MGRADE	//	등급	//	NOT NULL
	public String getMgrade() {
		return mgrade;
	}
	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}

//	MPROFILE	//	프로필사진	//	
	public String getMprofile() {
		return mprofile;
	}
	public void setMprofile(String mprofile) {
		this.mprofile = mprofile;
	}

//	MCATEGORY	//	요리 분야	//	
	public String getMcategory() {
		return mcategory;
	}
	public void setMcategory(String mcategory) {
		this.mcategory = mcategory;
	}

//	MWARNING	//	경고 누적 횟수	//	
	public String getMwarning() {
		return mwarning;
	}
	public void setMwarning(String mwarning) {
		this.mwarning = mwarning;
	}

//	DELETEYN	//	삭제 여부	//	NOT NULL
	public String getDeleteyn() {
		return deleteyn;
	}
	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}

//	INSERTDATE	//	가입 일	//	
	public String getInsertdate() {
		return insertdate;
	}
	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

//	UPDATEDATE	//	수정 일	//	
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	
	

}
