package main.ict.levelup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.levelup.dao.AdminLevelupDAO;
import main.ict.levelup.vo.LevelupVO;

@Transactional
@Service
public class AdminLevelupServiceImpl implements AdminLevelupService {

	@Autowired(required=false)
	private AdminLevelupDAO adminLevelupDAO;
	
	@Override
	public List<LevelupVO> levelupSelectAll() {
		// TODO Auto-generated method stub
		return adminLevelupDAO.levelupSelectAll();
	}

	@Override
	public List<LevelupVO> levelupSelectContent(LevelupVO lvo) {
		// TODO Auto-generated method stub
		return adminLevelupDAO.levelupSelectContent(lvo);
	}

	@Override
	public int adminLevelupNope(LevelupVO lvo) {
		// TODO Auto-generated method stub
		return adminLevelupDAO.adminLevelupNope(lvo);
	}

	@Override
	public int levelupOkey(LevelupVO lvo) {
		// TODO Auto-generated method stub
		return adminLevelupDAO.levelupOkey(lvo);
	}

	@Override
	public int mgradeUpdate(LevelupVO lvo) {
		// TODO Auto-generated method stub
		return adminLevelupDAO.mgradeUpdate(lvo);
	}

}
