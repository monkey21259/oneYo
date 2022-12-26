package main.ict.mypage.dao;

import java.util.List;

import main.ict.community.vo.CommunityVO;
import main.ict.mem.vo.MemVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;

public interface MypageDAO {

	List<RecipeVO> selectMyRecipe(MemVO mvo);

	List<CommunityVO> selectMyCommunity(MemVO mvo);

	List<TipVO> selectMyTip(MemVO mvo);

	List<MemVO> selectMyProfile(MemVO mvo);

}
