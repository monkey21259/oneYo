package main.ict.levelup.dao;

import java.util.List;

import main.ict.levelup.vo.LevelupVO;

public interface AdminLevelupDAO {
	
	public List<LevelupVO> levelupSelectAll();
}
