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

}
