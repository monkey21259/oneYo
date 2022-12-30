package main.ict.home.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.community.vo.CommunityVO;
import main.ict.home.dao.HomeDAO;
import main.ict.home.vo.HomeVO;
import main.ict.mem.vo.MemVO;
import main.ict.notice.vo.NoticeVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;

@Service
@Transactional
public class HomeServiceImpl implements HomeService {
	
	private Logger logger = LogManager.getLogger(HomeServiceImpl.class);
	
	@Autowired(required=false)
	private HomeDAO homeDAO;

	@Override
	public List<RecipeVO> getRecipeList() {
		// TODO Auto-generated method stub
		logger.info("getRecipeList() 함수 진입");
		return homeDAO.getRecipeList();
	}

	@Override
	public List<TipVO> getTipList() {
		// TODO Auto-generated method stub
		logger.info("getTipList() 함수 진입");
		return homeDAO.getTipList();
	}

	@Override
	public List<CommunityVO> getCommunityList() {
		// TODO Auto-generated method stub
		logger.info("getCommunityList() 함수 진입");
		return homeDAO.getCommunityList();
	}

	@Override
	public List<NoticeVO> getNoticeList() {
		// TODO Auto-generated method stub
		logger.info("getNoticeList() 함수 진입");
		return homeDAO.getNoticeList();
	}

	@Override
	public List<MemVO> getMemList() {
		// TODO Auto-generated method stub
		logger.info("getMemList() 함수 진입");
		return homeDAO.getMemList();
	}

	@Override
	public List<HomeVO> getCntList() {
		// TODO Auto-generated method stub
		logger.info("getCntList() 함수 진입");
		return homeDAO.getCntList();
	}

}
