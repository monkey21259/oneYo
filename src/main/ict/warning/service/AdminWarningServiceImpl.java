package main.ict.warning.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.community.controller.CommunityController;
import main.ict.mem.vo.MemVO;
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

//신고분야(T)
	@Override
	public List<WarningVO> adminWarningSelectTip(WarningVO wvo){
		logger.info("adminWarningSelectTip 함수진입 >>> ");
		return adminWarningDAO.adminWarningSelectTip(wvo);
	}
	
	
//신고분야(C)
	@Override
	public List<WarningVO> adminWarningSelectCommunity(WarningVO wvo){
		logger.info("adminWarningSelectCommunity 함수진입 >>> ");
		return adminWarningDAO.adminWarningSelectCommunity(wvo);
	}
	
//회원경고
	@Override
	public int adminMemberCaution(MemVO mvo) {
		logger.info("adminMemberCaution 함수진입 >>> ");
		return adminWarningDAO.adminMemberCaution(mvo);
	}

//신고글삭제
	@Override
	public int adminWarningDelete(WarningVO wvo) {
		logger.info("adminWarningDelete 함수진입 >>> ");
		return adminWarningDAO.adminWarningDelete(wvo);
	}		

	
}
