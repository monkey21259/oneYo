package main.ict.community.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.community.dao.CommunityDAO;
import main.ict.community.vo.CommunityVO; 

@Service
@Transactional
public class CommunityServiceImpl implements CommunityService {

	Logger logger = LogManager.getLogger(CommunityServiceImpl.class);
	
	@Autowired(required = false)
	private CommunityDAO communityDAO;
	
	@Override
	public List<CommunityVO> communitySelcetAll(CommunityVO cvo) {
		logger.info("CommunitySelcetAll 서비스 진입 >>> ");
		
		return communityDAO.communitySelcetAll(cvo); 
	}

	
	
} //class
