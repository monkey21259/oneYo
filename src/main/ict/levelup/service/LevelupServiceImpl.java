package main.ict.levelup.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.levelup.dao.LevelupDAO;
import main.ict.levelup.vo.LevelupVO;
import main.ict.mem.vo.MemVO;

@Service
@Transactional
public class LevelupServiceImpl implements LevelupService {
	private Logger logger = LogManager.getLogger(LevelupServiceImpl.class);
	
	@Autowired(required=false)
	private LevelupDAO levelupDAO;

	@Override
	public List<LevelupVO> levelupSelectAll(MemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("levelupSelectAll() 함수 진입");
		return levelupDAO.levelupSelectAll(mvo);
	}

	@Override
	public int levelupInsert(LevelupVO lvvo) {
		// TODO Auto-generated method stub
		logger.info("levelupInsert() 함수 진입");
		return levelupDAO.levelupInsert(lvvo);
	}

}
