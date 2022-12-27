package main.ict.levelup.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.levelup.vo.LevelupVO;
import main.ict.mem.vo.MemVO;

@Repository
public class LevelupDAOImpl implements LevelupDAO {
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<LevelupVO> levelupSelectAll(MemVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("levelupSelectAll", mvo);
	}

}
