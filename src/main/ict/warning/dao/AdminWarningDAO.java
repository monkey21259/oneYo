package main.ict.warning.dao;

import java.util.List;

import main.ict.warning.vo.WarningVO;

public interface AdminWarningDAO {

//신고 전체조회
	public List<WarningVO> adminWarningSelectAll(WarningVO wvo);
	
//신고분야(R)
	public List<WarningVO> adminWarningSelectRecipe(WarningVO wvo);
	
	
}
