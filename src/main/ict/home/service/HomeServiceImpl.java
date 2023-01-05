package main.ict.home.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.comment.vo.CommentVO;
import main.ict.community.vo.CommunityVO;
import main.ict.home.dao.HomeDAO;
import main.ict.home.vo.HomeVO;
import main.ict.home.vo.ObjectVO;
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

	@Override
	public List<MemVO> homeRestSelectMem(MemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("homeRestSelectMem() 함수 진입");
		return homeDAO.homeRestSelectMem(mvo);
	}

	@Override
	public List<RecipeVO> homeRestSelectRecipe(RecipeVO rvo) {
		// TODO Auto-generated method stub
		logger.info("homeRestSelectRecipe() 함수 진입");
		return homeDAO.homeRestSelectRecipe(rvo);
	}

	@Override
	public List<TipVO> homeRestSelectTip(TipVO tvo) {
		// TODO Auto-generated method stub
		logger.info("homeRestSelectTip() 함수 진입");
		return homeDAO.homeRestSelectTip(tvo);
	}

	@Override
	public List<CommunityVO> homeRestSelectCommunity(CommunityVO cvo) {
		// TODO Auto-generated method stub
		logger.info("homeRestSelectComment() 함수 진입");
		return homeDAO.homeRestSelectCommunity(cvo);
	}

	@Override
	public List<RecipeVO> chefRecipeSelectAll(RecipeVO rvo) {
		// TODO Auto-generated method stub
		logger.info("chefRecipeSelectAll() 함수 진입");
		return homeDAO.chefRecipeSelectAll(rvo);
	}

	@Override
	public List<RecipeVO> chefTipSelectAll(TipVO tvo) {
		// TODO Auto-generated method stub
		logger.info("chefTipSelectAll() 함수 진입");
		return homeDAO.chefTipSelectAll(tvo);
	}

	@Override
	public List<ObjectVO> getCondVOList(ObjectVO ovo) {
		
		logger.info("getCondVOList() 함수 진입");
		return homeDAO.getCondVOList(ovo);
	}
	
	public List<RecipeVO> chefRecipeShowMore(RecipeVO rvo) {
		// TODO Auto-generated method stub
		logger.info("chefRecipeShowMore() 함수 진입");
		return homeDAO.chefRecipeShowMore(rvo);
	}

	@Override
	public List<TipVO> chefTipShowMore(TipVO tvo) {
		// TODO Auto-generated method stub
		logger.info("chefTipShowMore() 함수 진입");
		return homeDAO.chefTipShowMore(tvo);
	}

	@Override
	public List<CommunityVO> chefCommunityShowMore(CommunityVO cvo) {
		// TODO Auto-generated method stub
		logger.info("chefCommunityShowMore() 함수 진입");
		return homeDAO.chefCommunityShowMore(cvo);
	}

	@Override
	public List<HomeVO> chefListShowMore(HomeVO hvo) {
		// TODO Auto-generated method stub
		logger.info("chefListShowMore() 함수 진입");
		return homeDAO.chefListShowMore(hvo);
	}

}
