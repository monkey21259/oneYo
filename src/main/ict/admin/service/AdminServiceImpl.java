package main.ict.admin.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.admin.dao.AdminDAO;
import main.ict.community.service.CommunityServiceImpl;
import main.ict.community.vo.CommunityVO;
import main.ict.levelup.vo.LevelupVO;
import main.ict.mem.vo.MemVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;
import main.ict.warning.vo.WarningVO;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

	Logger logger = LogManager.getLogger(CommunityServiceImpl.class);

//dao호출	
	@Autowired(required = false)
	private AdminDAO adminDAO; 


//등업
	@Override
		public List<LevelupVO> adminLevelupSelectAll(LevelupVO lvvo) {
			logger.info("adminLevelupSelectAll 함수진입 >>> : ");
			return adminDAO.adminLevelupSelectAll(lvvo);
		}
 
//신고
	@Override
		public List<WarningVO> adminWarningSelectAll(WarningVO wvo) {
			logger.info("adminWarningSelectAll 함수진입 >>> : ");
			return adminDAO.adminWarningSelectAll(wvo);
	}
	
//레시피
	@Override
	public List<RecipeVO> adminRecipeSelectAll(RecipeVO rvo) {
		logger.info("adminRecipeSelectAll 함수진입 >>> : ");
		return adminDAO.adminRecipeSelectAll(rvo);
	}
	
//전문가팁
	@Override
	public List<TipVO> adminTipSelectAll(TipVO tvo) {
		logger.info("adminTipSelectAll 함수진입 >>> : ");
		return adminDAO.adminTipSelectAll(tvo);
	}

//커뮤니티	
	@Override
	public List<CommunityVO> adminCommunitySelectAll(CommunityVO cvo) {
		logger.info("adminCommunitySelectAll 함수진입 >>> : ");
		return adminDAO.adminCommunitySelectAll(cvo);
	}
	
	
//회원조회
	@Override
	public List<MemVO> adminMemSelectAll(MemVO mvo) {
		logger.info("adminMemSelectAll 함수진입 >>> : ");
		return adminDAO.adminMemSelectAll(mvo);
	}

//회원탈퇴	
	@Override
	public int adminMemDelete(MemVO mvo) {
		logger.info("adminMemDelete 함수진입 >>> : ");
		return adminDAO.adminMemDelete(mvo);
	}

	

	
	
} //class
