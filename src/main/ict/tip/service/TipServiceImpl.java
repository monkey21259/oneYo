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
	public List<TipVO> tipSelectAll(TipVO tvo) {
		// TODO Auto-generated method stub
		logger.info("tipSelectAll() 함수 진입");
		return tipDAO.tipSelectAll(tvo);
	}

	@Override
	public List<TipVO> tipSelectContent(TipVO tvo) {
		// TODO Auto-generated method stub
		logger.info("tipSelectContent() 함수 진입");
		return tipDAO.tipSelectContent(tvo);
	}

	@Override
	public List<TipVO> tipUpdateForm(TipVO tvo) {
		// TODO Auto-generated method stub
		logger.info("tipUpdateForm() 함수 진입");
		return tipDAO.tipUpdateForm(tvo);
	}

	@Override
	public int tipUpdate(TipVO tvo) {
		// TODO Auto-generated method stub
		logger.info("tipUpdate() 함수 진입");
		return tipDAO.tipUpdate(tvo);
	}

	@Override
	public int tipDelete(TipVO tvo) {
		// TODO Auto-generated method stub
		logger.info("tipDelete() 함수 진입");
		return tipDAO.tipDelete(tvo);
	}

}
