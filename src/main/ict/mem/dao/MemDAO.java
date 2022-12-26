package main.ict.mem.dao;

import java.util.List;

import main.ict.mem.vo.MemVO;

public interface MemDAO {

	//	회원 가입	"memInsert"
	public int memInsert(MemVO mvo);

	//	ID 아이디 중복 검사	"memIdCheck"
	public List<MemVO> memIdCheck(MemVO mvo);
	
}
