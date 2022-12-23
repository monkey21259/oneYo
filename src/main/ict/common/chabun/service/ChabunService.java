package main.ict.common.chabun.service;

import main.ict.community.vo.CommunityVO;
import main.ict.mem.vo.MemVO;
import main.ict.notice.vo.NoticeVO;
import main.ict.recipe.vo.RecipeVO;

public interface ChabunService {
	
	//회원
	public MemVO getMemberChabun();
	
	//레시피
	public RecipeVO getRecipeChabun();
	
	//전문가 팁
	
	
	//경고
	
	
	//댓글
	
	
	//커뮤니티
	public CommunityVO getCommunityChabun();
	
	//등업
	
	
	//좋아요
	
	
	//공지사항
	public NoticeVO getNoticeChabun();
	
}//end of ChabunService interface
