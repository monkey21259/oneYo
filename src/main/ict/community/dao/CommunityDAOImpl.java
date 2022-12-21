package main.ict.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.ict.community.service.CommunityServiceImpl;
import main.ict.community.vo.CommunityVO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	Logger logger = LogManager.getLogger(CommunityServiceImpl.class);
	
	@Autowired(required = false)
	private SqlSession sqlSession;  
	
	@Override
	public List<CommunityVO> communitySelcetAll(CommunityVO cvo) {
		logger.info("communitySelcetAll DAO >>> : ");
		
		return sqlSession.selectList("communitySelcetAll", cvo);
	}

	
	
}//class
