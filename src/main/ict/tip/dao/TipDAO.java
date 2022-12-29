package main.ict.tip.dao;

import java.util.List;

import main.ict.tip.vo.TipVO;
import main.ict.warning.vo.WarningVO;

public interface TipDAO {

	int tipInsert(TipVO tvo);

	List<TipVO> tipSelectAll(TipVO tvo);

	List<TipVO> tipSelectContent(TipVO tvo);

	List<TipVO> tipUpdateForm(TipVO tvo);

	int tipUpdate(TipVO tvo);

	int tipDelete(TipVO tvo);
	
	public int tipWarningInsert(WarningVO wvo);

}
