package main.ict.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class O_Session {
	
	static Logger logger = LogManager.getLogger(O_Session.class);

	private static final String M_SESSION_ID = "mid";
	private static final String M_SESSION_ACC_TOK = "access_token";  // 코드 리팩토링할때 활용 가능.
	
	private static class LazyHolder {
		public static final O_Session SESSIONLISTENER_INSTANCE = new O_Session();
	}
	
	public static O_Session getInstance() {
		return LazyHolder.SESSIONLISTENER_INSTANCE;
	}
	
	public O_Session() {}
	
	public Object getAttribute(final HttpServletRequest req, String attr) {
		
		logger.info("getAttribute() 함수 진입");
		
		HttpSession hSession = req.getSession(false);
		return hSession.getAttribute(attr);
	}
	
	public boolean addAttribute(final HttpServletRequest req, String attr, Object obj) {
		
		logger.info("addAttribute() 함수 진입");
		HttpSession hSession = req.getSession(false);
		if (hSession != null) {
			hSession.setAttribute(attr, obj);
			return true;
		}
		return false;
	}
	
	public void killSession(final HttpServletRequest req) {
		
		HttpSession hSession = req.getSession(false);
		System.out.println("[killSession] hSession: " + hSession);
		if (hSession != null) {
			// 속성 제거 후 객체 메모리 해제
			hSession.removeAttribute(M_SESSION_ID);
			hSession.invalidate();
		}
	}
	
	public boolean setSession(final HttpServletRequest req, final String userID) {
		
		HttpSession	hSession = null;	// 세션 객체
		String		session_val = null;	// 세션으로부터 가져온 로그인 ID를 저장하는 문자열
		int			nCnt = 0;			// 세션 유무 체크 변수
		
		hSession = req.getSession();
		session_val = (String)hSession.getAttribute(M_SESSION_ID);
		logger.info("userID: " + userID);
		logger.info("session_val: " + session_val);
		if (session_val != null) {
			boolean b1 = session_val.equals(userID);
			
			if (b1) {
				++nCnt;
			} else {
				System.out.println("세션과 로그인 아이디 불일치");
			}
		} else {
			System.out.println("세션에 저장된 Attribute가 없음");
		}
		
		if (nCnt == 0) {  // 정상적으로 세션이 처리되지 않는 경우
			hSession.setAttribute(M_SESSION_ID, userID);	// 값을 만들거나 덮어씌우기
			hSession.setMaxInactiveInterval(60*60*9);		// 9h : 세션 지속시간
			
			return false;
		}
		return true;
	}
	
	public String getSession(final HttpServletRequest req) {
		
		String strSession = "";
		HttpSession hSession = req.getSession(false);
		
		if (hSession != null) {
			Object obj = hSession.getAttribute(M_SESSION_ID);
			if (obj != null) {
				strSession = (String)obj;
			}
		}
		
		return strSession;
	}
	
}
