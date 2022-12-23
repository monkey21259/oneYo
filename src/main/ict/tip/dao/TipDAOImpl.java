package main.ict.tip.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.tip.vo.TipVO;

@Repository
public class TipDAOImpl implements TipDAO {
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int tipInsert(TipVO tvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("tipInsert", tvo);
	}

	@Override
	public List<TipVO> tipSelectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("tipSelectAll");
	}
}