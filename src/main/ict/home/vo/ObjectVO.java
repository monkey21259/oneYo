package main.ict.home.vo;

public class ObjectVO {

	// Common
	private String num;			// 고유번호
	private String subject;		// 제목
	private String category;	// 카테고리
	private String photo;		// 음식 사진
	private String content;		// 글 내용
	private String nick;		// 닉네임
	private String profile;		// 프로필
	private String mnum;		// 회원번호
	private String likecnt;		// 좋아요
	private String hit;			// 조회수
	private String warning;		// 경고누적횟수
	private String deleteyn;	// 삭제여부
	private String insertdate;	// 등록일
	private String updatedate;	// 수정일
	
	// Recipe
	private String jeryo;		// 재료
	private String time;		// 조리 시간
	private String person;		// 몇 인분(?)
	private String diff;		// 난이도
	
	// 조건별 처리
	private String dateCondition;	// 일간/주간/월간
	private String boardCategory;	// 게시판 카테고리
	
	// getter
	public String getNum() {
		return num;
	}
	public String getSubject() {
		return subject;
	}
	public String getCategory() {
		return category;
	}
	public String getPhoto() {
		return photo;
	}
	public String getContent() {
		return content;
	}
	public String getNick() {
		return nick;
	}
	public String getProfile() {
		return profile;
	}
	public String getMnum() {
		return mnum;
	}
	public String getLikecnt() {
		return likecnt;
	}
	public String getHit() {
		return hit;
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
	public String getJeryo() {
		return jeryo;
	}
	public String getTime() {
		return time;
	}
	public String getPerson() {
		return person;
	}
	public String getDiff() {
		return diff;
	}
	public String getDateCondition() {
		return dateCondition;
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	
	// setter
	public void setNum(String num) {
		this.num = num;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public void setMnum(String mnum) {
		this.mnum = mnum;
	}
	public void setLikecnt(String likecnt) {
		this.likecnt = likecnt;
	}
	public void setHit(String hit) {
		this.hit = hit;
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
	public void setJeryo(String jeryo) {
		this.jeryo = jeryo;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public void setDiff(String diff) {
		this.diff = diff;
	}
	public void setDateCondition(String dateCondition) {
		this.dateCondition = dateCondition;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	
	@Override
	public String toString() {
		return "ObjectVO [num=" + num + ", subject=" + subject + ", category=" + category + ", photo=" + photo
				+ ", content=" + content + ", nick=" + nick + ", profile=" + profile + ", mnum=" + mnum + ", likecnt="
				+ likecnt + ", hit=" + hit + ", warning=" + warning + ", deleteyn=" + deleteyn + ", insertdate="
				+ insertdate + ", updatedate=" + updatedate + ", jeryo=" + jeryo + ", time=" + time + ", person="
				+ person + ", diff=" + diff + ", dateCondition=" + dateCondition + ", boardCategory=" + boardCategory
				+ "]";
	}
	
}
