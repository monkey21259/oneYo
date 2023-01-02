package main.ict.common.chabun.dao;

import main.ict.comment.vo.CommentVO;
import main.ict.community.vo.CommunityVO;
import main.ict.levelup.vo.LevelupVO;
import main.ict.like.vo.LikeVO;
import main.ict.mem.vo.MemVO;
import main.ict.notice.vo.NoticeVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;
import main.ict.warning.vo.WarningVO;

public interface ChabunDAO {
	
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
	
	
	//좋아요
	public LikeVO getLikeChabun();
	
	//공지사항
	public NoticeVO getNoticeChabun();

	public LevelupVO getLevelupChabun();
	
	//신고
	public WarningVO getWarningChabun();
}//end of ChabunDAO interface
