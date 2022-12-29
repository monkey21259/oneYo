package main.ict.community.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.community.dao.CommunityDAO;
import main.ict.community.vo.CommunityVO;
import main.ict.warning.vo.WarningVO; 

@Service
@Transactional
public class CommunityServiceImpl implements CommunityService {

	Logger logger = LogManager.getLogger(CommunityServiceImpl.class);
	
	@Autowired(required = false)
	private CommunityDAO communityDAO;
	
//커뮤니티 글등록
	@Override
	public int communityInsert(CommunityVO cvo) {
		logger.info("communityInsert 서비스 진입 >>> ");
		
		return communityDAO.communityInsert(cvo); 
	}
	
//커뮤니티 전체조회
	@Override
	public List<CommunityVO> communitySelectAll(CommunityVO cvo) {
		logger.info("communitySelcetAll 서비스 진입 >>> ");
		
		return communityDAO.communitySelectAll(cvo); 
	}

//커뮤니티 게시글 조회	
	@Override
	public List<CommunityVO> communitySelect(CommunityVO cvo) {
		logger.info("communitySelect 서비스 진입 >>> ");
		
		return communityDAO.communitySelect(cvo); 
	}

//커뮤니티 게시글 수정	
	@Override
	public int communityUpdate(CommunityVO cvo) {
		logger.info("communityUpdate 서비스 진입 >>> ");
		
		return communityDAO.communityUpdate(cvo); 
	}

//커뮤니티 게시글 삭제
	@Override
	public int communityDelete(CommunityVO cvo) {
	logger.info("communityDelete 서비스 진입 >>> ");
		
		return communityDAO.communityDelete(cvo); 
	}

	@Override
	public int communityWarningInsert(WarningVO wvo) {
		// TODO Auto-generated method stub
		return communityDAO.communityWarningInsert(wvo);
	}

	
} //class
