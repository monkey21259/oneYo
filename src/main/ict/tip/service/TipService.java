package main.ict.tip.service;

import java.util.List;

import main.ict.tip.vo.TipVO;

public interface TipService {

	int tipInsert(TipVO tvo);

	List<TipVO> tipSelectAll();

	List<TipVO> tipSelectContent(TipVO tvo);

	List<TipVO> tipUpdateForm(TipVO tvo);

	int tipUpdate(TipVO tvo);

	int tipDelete(TipVO tvo);

}
