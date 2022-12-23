package main.ict.notice.dao;

import java.util.List;

import main.ict.notice.vo.NoticeVO;

public interface NoticeDAO {
	
	//INSERT
	public int noticeInsert(NoticeVO nvo);
	
	//SELECT ALL
	public List<NoticeVO> noticeSelectAll(NoticeVO nvo);
	
}//end of NoticeDAO interface
