package main.ict.community.service;

import java.util.List;

import main.ict.community.vo.CommunityVO;

public interface CommunityService {

//커뮤니티 게시글 등록 
	public int communityInsert(CommunityVO cvo);
	
//커뮤니티 게시글 전체조회	
	public List<CommunityVO> communitySelcetAll(CommunityVO cvo);  
	

}//class
