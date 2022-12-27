package main.ict.mypage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.community.vo.CommunityVO;
import main.ict.mem.vo.MemVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<RecipeVO> selectMyRecipe(MemVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectMyRecipe", mvo);
	}

	@Override
	public List<CommunityVO> selectMyCommunity(MemVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectMyCommunity", mvo);
	}

	@Override
	public List<TipVO> selectMyTip(MemVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectMyTip", mvo);
	}

	@Override
	public List<MemVO> selectMyProfile(MemVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectMyProfile", mvo);
	}

}
