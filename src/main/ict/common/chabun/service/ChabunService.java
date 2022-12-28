package main.ict.common.chabun.service;

import main.ict.comment.vo.CommentVO;
import main.ict.community.vo.CommunityVO;
import main.ict.levelup.vo.LevelupVO;
import main.ict.mem.vo.MemVO;
import main.ict.notice.vo.NoticeVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;
import main.ict.warning.vo.WarningVO;

public interface ChabunService {
	
	//회원
	public MemVO getMemberChabun();
	
	//레시피
	public RecipeVO getRecipeChabun();
	
	//전문가 팁
	public TipVO getTipChabun();
	
	//경고
	
	
	//댓글
	public CommentVO getCommentChabun();
	
	//커뮤니티
	public CommunityVO getCommunityChabun();
	
	//등업
	public LevelupVO getLevelupChabun();
	
	//좋아요
	
	
	//공지사항
	public NoticeVO getNoticeChabun();
	
	//신고
	public WarningVO getWarningChabun();
	
}//end of ChabunService interface
