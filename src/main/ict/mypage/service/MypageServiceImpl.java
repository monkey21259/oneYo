package main.ict.mypage.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.community.vo.CommunityVO;
import main.ict.mem.vo.MemVO;
import main.ict.mypage.dao.MypageDAO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;

@Service
@Transactional
public class MypageServiceImpl implements MypageService {
	private Logger logger = LogManager.getLogger(MypageServiceImpl.class);
	
	@Autowired(required=false)
	private MypageDAO mypageDAO;

	@Override
	public List<RecipeVO> selectMyRecipe(MemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("selectMyRecipe() 함수 진입");
		return mypageDAO.selectMyRecipe(mvo);
	}

	@Override
	public List<CommunityVO> selectMyCommunity(MemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("selectMyCommunity() 함수 진입");
		return mypageDAO.selectMyCommunity(mvo);
	}

	@Override
	public List<TipVO> selectMyTip(MemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("selectMyTip() 함수 진입");
		return mypageDAO.selectMyTip(mvo);
	}

	@Override
	public List<MemVO> selectMyProfile(MemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("selectMyProfile() 함수 진입");
		return mypageDAO.selectMyProfile(mvo);
	}

}
