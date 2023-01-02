package main.ict.tip.service;

import java.util.List;

import main.ict.mem.vo.MemVO;
import main.ict.tip.vo.TipVO;
import main.ict.warning.vo.WarningVO;

public interface TipService {

	int tipInsert(TipVO tvo);

	List<TipVO> tipSelectAll(TipVO tvo);

	List<TipVO> tipSelectContent(TipVO tvo);

	List<TipVO> tipUpdateForm(TipVO tvo);

	int tipUpdate(TipVO tvo);

	int tipDelete(TipVO tvo);
	
	public int tipWarningInsert(WarningVO wvo);
	
	List<MemVO> tipSession(MemVO mvo);

}
