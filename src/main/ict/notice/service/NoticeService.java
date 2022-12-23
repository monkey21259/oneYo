package main.ict.notice.service;

import java.util.List;

import main.ict.notice.vo.NoticeVO;

public interface NoticeService {
	
	//INSERT
	public int noticeInsert(NoticeVO nvo);
	
	//SELECT ALL
	public List<NoticeVO> noticeSelectAll(NoticeVO nvo);
	
}//end of NoticeService interface
