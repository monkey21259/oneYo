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

}
