package main.ict.common.chabun.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.common.chabun.dao.ChabunDAO;
import main.ict.community.vo.CommunityVO;
import main.ict.mem.vo.MemVO;
import main.ict.notice.vo.NoticeVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;

@Service
@Transactional
public class ChabunServiceImpl implements ChabunService {
	Logger logger = LogManager.getLogger(ChabunServiceImpl.class);
	
	@Autowired(required=false)
	private ChabunDAO chabunDAO;
	
	//회원
	@Override
	public MemVO getMemberChabun() {
		// TODO Auto-generated method stub
		logger.info("getMemberChabun() 함수 진입 : ");
		return chabunDAO.getMemberChabun();
	}//end of getMemberChabun() method
	
	//레시피
	@Override
	public RecipeVO getRecipeChabun() {
		
		logger.info("getRecipeChabun() 함수 진입.");
		
		return chabunDAO.getRecipeChabun();
	}
	
	//전문가 팁
	@Override
	public TipVO getTipChabun() {
		// TODO Auto-generated method stub
		logger.info("getTipChabun() 함수 진입");
		return chabunDAO.getTipChabun();
	}
	
	//경고
	
	
	//댓글
	
	
	//커뮤니티
	@Override
	public CommunityVO getCommunityChabun() {
		// TODO Auto-generated method stub
		logger.info("getCommunityChabun() 함수 진입 : ");
		return chabunDAO.getCommunityChabun();
	}//end of getCommunityChabun() method
	
	//등업
	
	
	//좋아요
	
	
	//공지사항
	@Override
	public NoticeVO getNoticeChabun() {
		// TODO Auto-generated method stub
		logger.info("getNoticeChabun() 함수 진입 : ");
		return chabunDAO.getNoticeChabun();
	}//end of getNoticeChabun() method
	
}//end of ChabunServiceImpl class
