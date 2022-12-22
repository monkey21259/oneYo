package main.ict.tip.service;

import java.util.List;

import main.ict.tip.vo.TipVO;

public interface TipService {

	int tipInsert(TipVO tvo);

	List<TipVO> tipSelectAll();
	
	

}
