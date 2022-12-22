package main.ict.tip.dao;

import java.util.List;

import main.ict.tip.vo.TipVO;

public interface TipDAO {

	int tipInsert(TipVO tvo);

	List<TipVO> tipSelectAll();

}
