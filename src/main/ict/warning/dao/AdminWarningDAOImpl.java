package main.ict.warning.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.mem.vo.MemVO;
import main.ict.warning.vo.WarningVO;

@Repository
public class AdminWarningDAOImpl implements AdminWarningDAO{

	@Autowired(required = false)
	private SqlSession sqlSession;
	
//신고전체조회	
	@Override
	public List<WarningVO> adminWarningSelectAll(WarningVO wvo) {
		return sqlSession.selectList("adminWarningSelectAll", wvo);
	}
	
//신고분야(R)
	@Override
	public List<WarningVO> adminWarningSelectRecipe(WarningVO wvo) {
		return sqlSession.selectList("adminWarningSelectRecipe", wvo);
	}
	
//신고분야(T)
	@Override
	public List<WarningVO> adminWarningSelectTip(WarningVO wvo){
		return sqlSession.selectList("adminWarningSelectTip", wvo);
	}
		
//신고분야(C)
	@Override
	public List<WarningVO> adminWarningSelectCommunity(WarningVO wvo){
		return sqlSession.selectList("adminWarningSelectCommunity", wvo);
	}
	
//회원경고
	@Override
	public int adminMemberCaution(MemVO mvo) {
		return sqlSession.update("adminMemberCaution", mvo);
	}	

//신고글 삭제
	@Override
	public int adminWarningDelete(WarningVO wvo) {
		return sqlSession.update("adminWarningDelete", wvo);
	}		

	
}
