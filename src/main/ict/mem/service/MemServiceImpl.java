package main.ict.mem.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.mem.dao.MemDAO;
import main.ict.mem.vo.MemVO;

@Service
@Transactional
public class MemServiceImpl implements MemService {
	
	//	log4j 세팅
	private Logger logger = LogManager.getLogger(MemServiceImpl.class);
	
	//	DAO
	@Autowired(required=false)
	private MemDAO memDAO;

	//	회원 가입	"memInsert"
	@Override
	public int memInsert(MemVO mvo) {
		
		logger.info("memInsert(mvo) >>> : " + mvo);
		
		return memDAO.memInsert(mvo);
	}	//	회원 가입	"memInsert"

	//	ID 아이디 중복 검사	"memIdCheck"
	@Override
	public List<MemVO> memIdCheck(MemVO mvo) {
		logger.info("memIdCheck(mvo) >>> : " + mvo.getMid());
		
		return memDAO.memIdCheck(mvo);
	}

	//	프로필 조회 목적 memSelect "profileSelect"
	@Override
	public List<MemVO> memSelect(MemVO mvo) {
		
		logger.info("memSelect(mvo) >>> : " + mvo.getMnum());
		
		return memDAO.memSelect(mvo);
	}
	
}
