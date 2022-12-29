package main.ict.warning.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.community.controller.CommunityController;
import main.ict.warning.dao.AdminWarningDAO;
import main.ict.warning.vo.WarningVO;

@Service
@Transactional
public class AdminWarningServiceImpl implements AdminWarningService{
	
	@Autowired(required = false)
	private AdminWarningDAO adminWarningDAO; 
	
	Logger logger = LogManager.getLogger(AdminWarningServiceImpl.class);

//신고 전체조회
	@Override
	public List<WarningVO> adminWarningSelectAll(WarningVO wvo) {
		logger.info("adminWarningSelectAll 함수진입 >>> ");
		return adminWarningDAO.adminWarningSelectAll(wvo);
	}

	
//신고분야(R)
	@Override
	public List<WarningVO> adminWarningSelectRecipe(WarningVO wvo) {
		logger.info("adminWarningSelectRecipe 함수진입 >>> ");
		return adminWarningDAO.adminWarningSelectRecipe(wvo);
	}

	
}
