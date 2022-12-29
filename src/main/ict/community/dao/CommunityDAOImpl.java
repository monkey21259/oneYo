package main.ict.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.community.vo.CommunityVO;
import main.ict.warning.vo.WarningVO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	
	@Autowired(required = false)
	private SqlSession sqlSession;  

	
//게시글 등록
	@Override
	public int communityInsert(CommunityVO cvo) {
		return sqlSession.insert("communityInsert", cvo);
	}

//게시글 전체조회	
	@Override
	public List<CommunityVO> communitySelectAll(CommunityVO cvo) {
		return sqlSession.selectList("communitySelectAll", cvo);
	}

//커뮤니티 게시글 조회	
	@Override
	public List<CommunityVO> communitySelect(CommunityVO cvo) {
		return sqlSession.selectList("communitySelect", cvo);
	}


//커뮤니티 게시글 수정	
	@Override
	public int communityUpdate(CommunityVO cvo) {
		return sqlSession.update("communityUpdate", cvo);
	}

//커뮤니티 게시글 삭제
	@Override
	public int communityDelete(CommunityVO cvo) {
		return sqlSession.update("communityDelete", cvo);
	}

	@Override
	public int communityWarningInsert(WarningVO wvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("communityWarningInsert", wvo);
	}	


}//class
