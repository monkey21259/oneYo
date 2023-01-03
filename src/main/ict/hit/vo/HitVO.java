package main.ict.hit.vo;

public class HitVO {
	
	private String boardNum;
	private String boardFlag;
	
	//default constructor
	public HitVO() {
		
	}
	
	//constructor using fields
	public HitVO(String boardNum, String boardFlag) {
		
		this.boardNum = boardNum;
		this.boardFlag = boardFlag;
	}
	
	//getter
	public String getBoardNum() {
		return boardNum;
	}
	public String getBoardFlag() {
		return boardFlag;
	}
	
	//setter
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	public void setBoardFlag(String boardFlag) {
		this.boardFlag = boardFlag;
	}
	
}//end of HitVO
