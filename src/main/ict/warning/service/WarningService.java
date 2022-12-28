package main.ict.warning.service;

import java.util.List;

import main.ict.warning.vo.WarningVO;

public interface WarningService {
	
	//ajax 게시판 출력
	public List<WarningVO> recipeSelect();
	
	public List<WarningVO> tipSelect();

	public List<WarningVO> comSelect();
	
	//신고 insert
	public int warningInsert(WarningVO wvo);
	
}
