package main.ict.common.chabun.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.community.vo.CommunityVO;
import main.ict.mem.vo.MemVO;
import main.ict.notice.vo.NoticeVO;
import main.ict.recipe.vo.RecipeVO;

@Repository
public class ChabunDAOImpl implements ChabunDAO {
	Logger logger = LogManager.getLogger(ChabunDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	//회원
	@Override
	public MemVO getMemberChabun() {
		// TODO Auto-generated method stub
		logger.info("getMemberChabun() 함수 진입 : ");
		return sqlSession.selectOne("getMemberChabun");
	}//end of getMemberChabun() method
	
	//레시피
	@Override
	public RecipeVO getRecipeChabun() {
		
		return sqlSession.selectOne("getRecipeChabun");
	}
	
	//전문가 팁
	
	
	//경고
	
	
	//댓글
	
	
	//커뮤니티
	@Override
	public CommunityVO getCommunityChabun() {
		// TODO Auto-generated method stub
		logger.info("getCommunityChabun() 함수 진입 : ");
		return sqlSession.selectOne("getCommunityChabun");
	}//end of getCommunityChabun() method
	
	//등업
	
	
	//좋아요
	
	
	//공지사항
	@Override
	public NoticeVO getNoticeChabun() {
		// TODO Auto-generated method stub
		logger.info("getNoticeChabun() 함수 진입 : ");
		return sqlSession.selectOne("getNoticeChabun");
	}//end of getNoticeChabun() method
	
}//end of ChabunDAOImpl class
