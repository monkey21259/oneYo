package main.ict.test.vo;

public class TestVO {
	
	private String empno;
	private String ename;
	
	public TestVO() {
		
	}
	
	public TestVO(String empno, String ename) {
		super();
		this.empno = empno;
		this.ename = ename;
	}
	
	public String getEmpno() {
		return empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	
}
