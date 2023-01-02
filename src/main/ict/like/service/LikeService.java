package main.ict.like.service;

import java.util.List;

import main.ict.like.vo.LikeVO;

public interface LikeService {
	
	//세션에 저장된 회원이 좋아요 눌렀는지 확인하기
	public List<LikeVO> likeCheck(LikeVO lvo);
	
	//좋아요 insert
	public int likeInsert(LikeVO lvo);
	
	//좋아요 취소
	public int likeDelete(LikeVO lvo);
	
	//좋아요 카운트
	public LikeVO likeCount(LikeVO lvo);
	
	//기존 좋아요 취소 이력 있는지 체크
	public List<LikeVO> likeNCheck(LikeVO lvo);
	
	//기존에 DB에 있는 좋아요 취소한 이력 다시 좋아요
	public int likeUpdate(LikeVO lvo);
	
}//end of LikeService interface
