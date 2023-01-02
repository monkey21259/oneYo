package main.ict.home.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.community.vo.CommunityVO;
import main.ict.home.vo.HomeVO;
import main.ict.mem.vo.MemVO;
import main.ict.notice.vo.NoticeVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;

@Repository
public class HomeDAOImpl implements HomeDAO {
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<RecipeVO> getRecipeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getRecipeList");
	}

	@Override
	public List<TipVO> getTipList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getTipList");
	}

	@Override
	public List<CommunityVO> getCommunityList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getCommunityList");
	}

	@Override
	public List<NoticeVO> getNoticeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getNoticeList");
	}

	@Override
	public List<MemVO> getMemList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getMemList");
	}

	@Override
	public List<HomeVO> getCntList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getCntList");
	}

	@Override
	public List<MemVO> homeRestSelectMem(MemVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("homeRestSelectMem", mvo);
	}

	@Override
	public List<RecipeVO> homeRestSelectRecipe(RecipeVO rvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("homeRestSelectRecipe", rvo);
	}

}
