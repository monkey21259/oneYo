package main.ict.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.community.vo.CommunityVO;
import main.ict.levelup.vo.LevelupVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;
import main.ict.warning.vo.WarningVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired(required = false) 
	private SqlSession sqlsession;
	
	
	
//등업
	@Override
	public List<LevelupVO> adminLevelupSelectAll(LevelupVO lvvo) {
		return sqlsession.selectList("adminLevelupSelectAll", lvvo);
		}
 
//신고	
	@Override
	public List<WarningVO> adminWarningSelectAll(WarningVO wvo) {
		return sqlsession.selectList("adminWarningSelectAll", wvo);
	}

//레시피
	@Override
	public List<RecipeVO> adminRecipeSelectAll(RecipeVO rvo) {
		return sqlsession.selectList("adminRecipeSelectAll", rvo);
	}

//전문가팁
	@Override
	public List<TipVO> adminTipSelectAll(TipVO tvo) {
		return sqlsession.selectList("adminTipSelectAll", tvo);
	}

//커뮤니티	
	@Override
	public List<CommunityVO> adminCommunitySelectAll(CommunityVO cvo) {
		return sqlsession.selectList("adminCommunitySelectAll", cvo);
	}
	
} 