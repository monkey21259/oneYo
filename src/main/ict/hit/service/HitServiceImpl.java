package main.ict.hit.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.hit.dao.HitDAO;
import main.ict.hit.vo.HitVO;

@Service
@Transactional
public class HitServiceImpl implements HitService {
	Logger logger = LogManager.getLogger(HitServiceImpl.class);
	
	@Autowired(required=false)
	private HitDAO hitDAO;
	
	//조회 수 올리기
	@Override
	public int hitUp(HitVO hvo) {
		// TODO Auto-generated method stub
		logger.info("hitUp() 함수 진입 : ");
		return hitDAO.hitUp(hvo);
	}//end of hitUp() method

}//end of HitServiceImpl class
