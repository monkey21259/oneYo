package main.ict.comment.service;

import java.util.List;

import main.ict.comment.vo.CommentVO;

public interface CommentService {
	
	//댓글 insert
	public int commentInsert(CommentVO covo);
	
	//댓글 select all
	public List<CommentVO> commentSelectAll(CommentVO covo);
	
	//댓글 delete
	public int commentDelete(CommentVO covo);
	
}//end of CommentService interface
