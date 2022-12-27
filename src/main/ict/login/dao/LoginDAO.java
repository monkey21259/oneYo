package main.ict.login.dao;

import java.util.List;

import main.ict.mem.vo.MemVO;

public interface LoginDAO {
	
	//로그인
	public List<MemVO> login(MemVO mvo);
	
	//아이디 찾기(이름 및 이메일 주소 확인)
	public List<MemVO> idFind(MemVO mvo);
	
	//비밀번호 찾기(아이디 및 이메일 주소 확인)
	public List<MemVO> pwFind(MemVO mvo);
	
	//비밀번호 변경
	public int resetPW(MemVO mvo);
	
}//end of LoginDAO interface
