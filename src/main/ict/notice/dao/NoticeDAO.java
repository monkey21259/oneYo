package main.ict.notice.dao;

import java.util.List;

import main.ict.notice.vo.NoticeVO;

public interface NoticeDAO {
	
	//INSERT
	public int noticeInsert(NoticeVO nvo);
	
	//SELECT ALL
	public List<NoticeVO> noticeSelectAll(NoticeVO nvo);
	
	//SELECT CONTENT
	public List<NoticeVO> noticeSelectContent(NoticeVO nvo);
	
	//UPDATE
	public int noticeUpdate(NoticeVO nvo);
	
	//DELETE
	public int noticeDelete(NoticeVO nvo);
	
}//end of NoticeDAO interface
