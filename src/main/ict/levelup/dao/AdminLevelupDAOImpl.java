package main.ict.levelup.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.levelup.vo.LevelupVO;

@Repository
public class AdminLevelupDAOImpl implements AdminLevelupDAO {

	@Autowired(required=false)
	private SqlSession sqlSession;
	
	
	@Override
	public List<LevelupVO> levelupSelectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("levelupSelectAll");
	}


	@Override
	public List<LevelupVO> levelupSelectContent(LevelupVO lvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("levelupSelectContent");
	}


	@Override
	public int adminLevelupNope(LevelupVO lvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminLevelupNope",lvo);
	}


	@Override
	public int levelupOkey(LevelupVO lvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("levelupOkey",lvo);
	}


	@Override
	public int mgradeUpdate(LevelupVO lvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("mgradeUpdate",lvo);
	}

}
