package main.ict.community.dao;

import java.util.List;

import main.ict.community.vo.CommunityVO;

public interface CommunityDAO { 
	
//게시글등록
	public int communityInsert(CommunityVO cvo);
	
//커뮤니티 게시글 전체조회
	public List<CommunityVO> communitySelectAll(CommunityVO cvo);
	
//커뮤니티 게시글 조회
	public List<CommunityVO> communitySelect(CommunityVO cvo);  
		
//커뮤니티 게시글 수정
	public int communityUpdate(CommunityVO cvo);


//커뮤니티 게시글 수정
	public int communityDelete(CommunityVO cvo);	

}//class
	 
