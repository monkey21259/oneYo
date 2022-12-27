package main.ict.levelup.dao;

import java.util.List;

import main.ict.levelup.vo.LevelupVO;
import main.ict.mem.vo.MemVO;

public interface LevelupDAO {

	List<LevelupVO> levelupSelectAll(MemVO mvo);

}
