package main.ict.mem.service;

import java.util.List;

import main.ict.mem.vo.MemVO;

public interface MemService {

	//	회원 가입	"memInsert"
	public int memInsert(MemVO mvo);

	//	ID 아이디 중복 검사	"memIdCheck"
	public List<MemVO> memIdCheck(MemVO mvo);

	//	프로필 조회 목적 memSelect "profileSelect"
	public List<MemVO> memSelect(MemVO mvo);
	
}
