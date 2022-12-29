package main.ict.home.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.common.ConstPack;
import main.ict.common.O_Session;
import main.ict.mem.vo.MemVO;

@Controller
public class HomeController {
	
	//	log4j 세팅
	private Logger logger = LogManager.getLogger(HomeController.class);
	
	//	home 이동
	@GetMapping("home")
	public String home() {
		
		logger.info("home() >>> : home.jsp");
		
		return "home/home";
	}
	
	// SNS Logout
	@GetMapping(value="logout")
	public String logout(HttpServletRequest req, MemVO mvo) {
		
		logger.info("logout() 함수 진입");
		
		// 공통 (일반 + SNS)
		O_Session oSession = O_Session.getInstance();
		// [보류] session mid를 통해서 로그인 유형을 파악한 뒤 분기처리.
		
		// Naver 로그아웃 > 로그아웃이 아니라 탈퇴였음 (로그인 연동해제하면 토큰값이 달라지면서 다시 가입해야함.)
		// >>> 세션만 kill. (코드 주석처리: 탈퇴구현할 때 그대로 가져다넣기)
//		try {
//			
//			StringBuffer reqURI = new StringBuffer("https://nid.naver.com/oauth2.0/token");
//			reqURI.append("?grant_type=" + "delete");
//			reqURI.append("&client_id=" + ConstPack.M_NAVER_CID);
//			reqURI.append("&client_secret=" + ConstPack.M_NAVER_CSECRET);
//			// ※ 로그인 연동 해제 구현 시 토큰 유효성 검사 必 (토큰이 무효해도 success 리턴)
//			String access_token = (String)oSession.getAttribute(req, "access_token");
//			reqURI.append("&access_token=" + access_token);
//			reqURI.append("&service_provider=" + "NAVER");
//			logger.info(reqURI.toString());
//			
//			URL url = new URL(reqURI.toString());
//			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
//			conn.setRequestMethod("GET");
//			
//			int responseCode = conn.getResponseCode();
//			logger.info("responseCode: " + responseCode);
//			BufferedReader br = new BufferedReader(
//									new InputStreamReader(conn.getInputStream()));
//			String line = "";
//			String result = "";
//			while ((line = br.readLine()) != null) {
//				result += line;
//			}
//			logger.info("result: " + result);
//			br.close();
//			
//			JSONParser jsonParser = new JSONParser();
//			JSONObject jObj = (JSONObject)jsonParser.parse(result);
//			String ret_access_token = (String)jObj.get("access_token");
//			String success = (String)jObj.get("result");
//			boolean bool = false;
//			if (success != null && success.equals("success")) {
//				logger.info("로그인 연동 해제 요청 결과: " + success);
//				if (access_token.equals(ret_access_token)) {
//					logger.info("요청 & 응답 access token 일치");
//					bool = true;
//				}
//			}
//			
//			if (bool) {
//				logger.info("[SUCCESS] 로그인 연동 해제");
//				oSession.killSession(req);
//				return "home/home";
//			} else {
//				logger.info("[FAIL] 로그인 연동 해제 요청 or 토큰 불일치");
//				return "home/home";
//			}
//			
//		} catch (Exception e) {
//			logger.info(e.getMessage());
//			return "home/home";
//		}
		
		// Kakao : Access Token, APP_ADMIN_KEY
		
		
		
		
		// 공통 (일반 + SNS)
		oSession.killSession(req);
		
		return "home/home";
	}
	
}
