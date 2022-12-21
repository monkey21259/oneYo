package main.ict.community.dao;

import java.util.List;

import main.ict.community.vo.CommunityVO;

public interface CommunityDAO {
	
//커뮤니티 게시글 전체조회
	public List<CommunityVO> communitySelcetAll(CommunityVO cvo);

}//class
