package main.ict.levelup.service;

import java.util.List;

import main.ict.levelup.vo.LevelupVO;
import main.ict.mem.vo.MemVO;

public interface LevelupService {

	List<LevelupVO> levelupSelectAll(MemVO mvo);

}
