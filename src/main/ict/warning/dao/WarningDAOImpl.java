package main.ict.warning.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.warning.vo.WarningVO;

@Repository
public class WarningDAOImpl implements WarningDAO {
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public List<WarningVO> recipeSelect() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recipeSelect");
	}

	@Override
	public List<WarningVO> tipSelect() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("tipSelect");
	}

	@Override
	public List<WarningVO> comSelect() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("comSelect");
	}

	@Override
	public int warningInsert(WarningVO wvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("warningInsert", wvo);
	}

}
