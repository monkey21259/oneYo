package main.ict.comment.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.ict.comment.service.CommentService;
import main.ict.comment.vo.CommentVO;
import main.ict.common.ChabunUtils;
import main.ict.common.O_Session;
import main.ict.common.chabun.service.ChabunService;

@Controller
public class CommentController {
	Logger logger = LogManager.getLogger(CommentController.class);
	
	@Autowired(required=false)
	private CommentService commentService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	//댓글 폼 이동 : 테스트용
	@GetMapping(value="commentForm")
	public String commentForm() {
		logger.info("commentForm() 함수 진입 : ");
		return "comment/commentForm";
	}//end of commentForm() method
	
	//댓글 insert
	@PostMapping(value="commentInsert")
	@ResponseBody
	public String commentInsert(HttpServletRequest req, CommentVO covo) {
		logger.info("commentInsert() 함수 진입 : ");
		
		//ajax로 리턴할 메시지
		String msg = "";
		
		//채번 서비스 호출 -> 채번  매기기
		String conum = ChabunUtils.getCommentChabun("d", chabunService.getCommentChabun().getConum());
		//채번값 vo에 넣기
		covo.setConum(conum);
		
		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(req);
		covo.setMnum(mnum);
		
		//서비스 호출
		int insertCnt = commentService.commentInsert(covo);
		if(insertCnt == 1) {
			logger.info("insertCnt : " + insertCnt);
			msg = "INSERT_YES";
		}else{
			msg = "INSERT_NO";
		}//end of if-else
		
		return msg;
	}//end of commentInsert() method
	
	//댓글 select all
	@PostMapping(value="commentSelectAll", produces="application/text; charset=UTF-8")
	@ResponseBody
	public String commentSelectAll(CommentVO covo) {
		logger.info("commentSelectAll() 함수 진입 : ");
		logger.info("commentSelectAll() -> cotnum : " + covo.getCotnum());
		
		//ajax로 리턴할 문자열
		String commentStr = "";
		
		//서비스 호출
		List<CommentVO> selectList = commentService.commentSelectAll(covo);
		if(selectList != null) {
			if(selectList.size() > 0) {
				for(int i=0; i<selectList.size(); i++) {
					CommentVO _covo = selectList.get(i);
					String conum = _covo.getConum();
					String cocontent = _covo.getCocontent();
					String mnum = _covo.getMnum();
					String mnick = _covo.getMnick();
					String insertdate= _covo.getInsertdate();
					String row = "";
					row = conum.concat(",").concat(cocontent).concat(",").concat(mnum).concat(",").concat(mnick).concat(",").concat(insertdate);
					logger.info((i + 1) + "번째 row : " + row);
					if(i == (selectList.size() - 1)) {
						commentStr += row;
					}else {
						commentStr += row.concat("&");
					}//end of if-else
				}//end of for
			}//end of inner if
		}//end of outer if
		logger.info("commentStr : " + commentStr);
		return commentStr;
	}//end of commentSelectAll() method
	
	//댓글 delete
	@PostMapping(value="commentDelete")
	@ResponseBody
	public String commentDelete(CommentVO covo) {
		logger.info("commentDelete() 함수 진입 : ");
		logger.info("commentDelete() -> conum : " + covo.getConum());
		
		//ajax로 응답할 문자열
		String msg = "";
		
		//서비스 호출
		int deleteCnt = commentService.commentDelete(covo);
		if(deleteCnt == 1) {
			logger.info("deleteCnt : " + deleteCnt);
			msg = "DELETE_YES";
		}else{
			msg = "DELETE_NO";
		}//end of if-else
		
		return msg;
	}//end of commentDelete() method
	
}//end of CommentController class
