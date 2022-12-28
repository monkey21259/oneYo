package main.ict.levelup.service;

import java.util.List;

import main.ict.levelup.vo.LevelupVO;

public interface AdminLevelupService {

	public List<LevelupVO> levelupSelectAll();
	
	public List<LevelupVO> levelupSelectContent(LevelupVO lvo);
	
	public int adminLevelupNope(LevelupVO lvo);
}
