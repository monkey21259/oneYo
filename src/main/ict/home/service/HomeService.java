package main.ict.home.service;

import java.util.List;

import main.ict.community.vo.CommunityVO;
import main.ict.home.vo.HomeVO;
import main.ict.mem.vo.MemVO;
import main.ict.notice.vo.NoticeVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;

public interface HomeService {

	// 레시피, 전문가팁, 커뮤니티, 공지사항 글 일부 Select : 2022-12-30 이성일
	List<RecipeVO> getRecipeList();
	List<TipVO> getTipList();
	List<CommunityVO> getCommunityList();
	List<NoticeVO> getNoticeList();
	List<MemVO> getMemList();
	List<HomeVO> getCntList();
	List<MemVO> homeRestSelectMem(MemVO mvo);
	List<RecipeVO> homeRestSelectRecipe(RecipeVO rvo);

}
