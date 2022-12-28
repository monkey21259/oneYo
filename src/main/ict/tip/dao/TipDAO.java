package main.ict.tip.dao;

import java.util.List;

import main.ict.tip.vo.TipVO;

public interface TipDAO {

	int tipInsert(TipVO tvo);

	List<TipVO> tipSelectAll(TipVO tvo);

	List<TipVO> tipSelectContent(TipVO tvo);

	List<TipVO> tipUpdateForm(TipVO tvo);

	int tipUpdate(TipVO tvo);

	int tipDelete(TipVO tvo);

}
