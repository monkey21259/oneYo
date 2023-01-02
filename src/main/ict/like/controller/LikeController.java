package main.ict.like.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.ict.common.ChabunUtils;
import main.ict.common.chabun.service.ChabunService;
import main.ict.like.service.LikeService;
import main.ict.like.vo.LikeVO;

@Controller
public class LikeController {
	Logger logger = LogManager.getLogger(LikeController.class);
	
	@Autowired(required=false)
	private LikeService likeService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	//좋아요
	@PostMapping(value="likeInsert")
	@ResponseBody
	public String likeInsert(LikeVO lvo) {
		logger.info("likeInsert() 함수 진입 : ");
		
		//ajax로 반환할 문자열
		String msg = "LIKE_NO";
		
		//채번 매기기
		String lnum = ChabunUtils.getLikeChabun("d", chabunService.getLikeChabun().getLnum());
		lvo.setLnum(lnum);
		
		//서비스 호출
		int insertCnt = likeService.likeInsert(lvo);
		if(insertCnt == 1) {
			msg = "LIKE_YES";
		}//end of if
		
		return msg;
	}//end of likeInsert() method
	
	//좋아요 취소
	@PostMapping(value="likeDelete")
	@ResponseBody
	public String likeDelete(LikeVO lvo) {
		logger.info("likeDelete() 함수 진입 : ");
		
		//ajax로 반환할 문자열
		String msg = "DEL_NO";
		
		//서비스 호출
		int deleteCnt = likeService.likeDelete(lvo);
		if(deleteCnt == 1) {
			msg = "DEL_YES";
		}//end of if
		
		return msg;
	}//end of likeDelete() method
	
	//좋아요 수 카운트
	@PostMapping(value="likeCount")
	@ResponseBody
	public String likeCount(LikeVO lvo) {
		logger.info("likeCount() 함수 진입 : ");
		
		//ajax로 반환할 문자열(카운트된 숫자)
		String msg = "0";
		
		//서비스 호출
		LikeVO _lvo = likeService.likeCount(lvo);
		logger.info("좋아요 수 : " + _lvo.getLikecount());
		msg = _lvo.getLikecount();
		
		return msg;
	}//end of likeCount() method
	
}//end of LikeController class
