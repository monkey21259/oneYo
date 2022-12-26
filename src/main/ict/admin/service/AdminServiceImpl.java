package main.ict.admin.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.admin.dao.AdminDAO;
import main.ict.community.service.CommunityServiceImpl;
import main.ict.warning.vo.WarningVO;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

	Logger logger = LogManager.getLogger(CommunityServiceImpl.class);
	
	@Autowired(required = false)
	private AdminDAO adminDAO; 
	
//	@Override
//	public List<WarningVO> warningSelectAll(WarningVO wvo) {
//		logger.info("warningSelectAll 함수진입 >>> : ");
//		return adminDAO.warningSelectAll(wvo);
//	}

	
	
	
}
