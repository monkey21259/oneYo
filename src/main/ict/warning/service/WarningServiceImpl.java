package main.ict.warning.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.warning.dao.WarningDAO;
import main.ict.warning.vo.WarningVO;

@Transactional
@Service
public class WarningServiceImpl implements WarningService {
	
	@Autowired(required=false)
	private WarningDAO warningDAO;
	
	@Override
	public List<WarningVO> recipeSelect() {
		// TODO Auto-generated method stub
		return warningDAO.recipeSelect();
	}

	@Override
	public List<WarningVO> tipSelect() {
		// TODO Auto-generated method stub
		return warningDAO.tipSelect();
	}

	@Override
	public List<WarningVO> comSelect() {
		// TODO Auto-generated method stub
		return warningDAO.comSelect();
	}

	@Override
	public int warningInsert(WarningVO wvo) {
		// TODO Auto-generated method stub
		return warningDAO.warningInsert(wvo);
	}

}
