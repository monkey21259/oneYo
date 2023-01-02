package main.ict.like.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.like.dao.LikeDAO;
import main.ict.like.vo.LikeVO;

@Service
@Transactional
public class LikeServiceImpl implements LikeService {
	Logger logger = LogManager.getLogger(LikeServiceImpl.class);
	
	@Autowired(required=false)
	private LikeDAO likeDAO;

	//세션에 저장된 회원이 좋아요 눌렀는지 확인하기
	@Override
	public List<LikeVO> likeCheck(LikeVO lvo) {
		// TODO Auto-generated method stub
		logger.info("likeCheck() 함수 진입 : ");
		return likeDAO.likeCheck(lvo);
	}//end of likeCheck() method
	
}//end of LikeServiceImpl class
