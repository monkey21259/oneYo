package main.ict.warning.dao;

import java.util.List;

import main.ict.warning.vo.WarningVO;

public interface WarningDAO {
	
	//ajax 게시판 글 출력
	public List<WarningVO> recipeSelect();
	
	public List<WarningVO> tipSelect();

	public List<WarningVO> comSelect();
	
	//신고 insert
	public int warningInsert(WarningVO wvo);
}
