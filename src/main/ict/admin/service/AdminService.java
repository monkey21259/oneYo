package main.ict.admin.service;

import java.util.List;

import main.ict.community.vo.CommunityVO;
import main.ict.levelup.vo.LevelupVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;
import main.ict.warning.vo.WarningVO;

public interface AdminService {
	
//등업	
	public List<LevelupVO> adminLevelupSelectAll(LevelupVO lvvo);   
	
//신고글
	public List<WarningVO> adminWarningSelectAll(WarningVO wvo);   
	
//레시피
	public List<RecipeVO> adminRecipeSelectAll(RecipeVO rvo);  
	
//전문가팁	
	public List<TipVO> adminTipSelectAll(TipVO tvo);
	
//커뮤니티
	public List<CommunityVO> adminCommunitySelectAll(CommunityVO cvo);
	
}

