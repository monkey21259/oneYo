package main.ict.tip.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.tip.vo.TipVO;
import main.ict.warning.vo.WarningVO;

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
	public List<TipVO> tipSelectAll(TipVO tvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("tipSelectAll", tvo);
	}

	@Override
	public List<TipVO> tipSelectContent(TipVO tvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("tipSelectContent", tvo);
	}

	@Override
	public List<TipVO> tipUpdateForm(TipVO tvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("tipUpdateForm", tvo);
	}

	@Override
	public int tipUpdate(TipVO tvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("tipUpdate", tvo);
	}

	@Override
	public int tipDelete(TipVO tvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("tipDelete", tvo);
	}

	@Override
	public int tipWarningInsert(WarningVO wvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("tipWarningInsert", wvo);
	}
}
