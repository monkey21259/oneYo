package main.ict.warning.service;

import java.util.List;

import main.ict.mem.vo.MemVO;
import main.ict.warning.vo.WarningVO;

public interface AdminWarningService {
	
//신고 전체조회
	public List<WarningVO> adminWarningSelectAll(WarningVO wvo);

//신고분야(R)
	public List<WarningVO> adminWarningSelectRecipe(WarningVO wvo);
	
//신고분야(T)
	public List<WarningVO> adminWarningSelectTip(WarningVO wvo);
	
//신고분야(C)
	public List<WarningVO> adminWarningSelectCommunity(WarningVO wvo);
		
//회원경고
	public int adminMemberCaution(MemVO mvo);	
	
//신고글삭제
	public int adminWarningDelete(WarningVO wvo);
}
