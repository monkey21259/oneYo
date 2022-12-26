package main.ict.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.warning.vo.WarningVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired(required = false) 
	private SqlSession sqlsession;

//신고	
//	@Override
//	public List<WarningVO> warningSelectAll(WarningVO wvo) {
//		return null;
//	}

	
}
