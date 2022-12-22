package main.ict.tip.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.tip.dao.TipDAO;
import main.ict.tip.vo.TipVO;

@Service
@Transactional
public class TipServiceImpl implements TipService {
	private Logger logger = LogManager.getLogger(TipServiceImpl.class);
	
	@Autowired(required=false)
	private TipDAO tipDAO;

	@Override
	public int tipInsert(TipVO tvo) {
		// TODO Auto-generated method stub
		logger.info("tipInsert() 함수 진입");
		return tipDAO.tipInsert(tvo);
	}

	@Override
	public List<TipVO> tipSelectAll() {
		// TODO Auto-generated method stub
		logger.info("tipSelectAll() 함수 진입");
		return tipDAO.tipSelectAll();
	}
	
	

}
