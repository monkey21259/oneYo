package main.ict.warning.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	@Override
	public List<WarningVO> adminWarningSelectRecipe(WarningVO wvo) {
		return sqlSession.selectList("adminWarningSelectRecipe", wvo);
	}



	
	
}
