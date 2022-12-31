package main.ict.login.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.ict.common.ChabunUtils;
import main.ict.common.ConstPack;
import main.ict.common.GoogleMail;
import main.ict.common.O_Session;
import main.ict.common.chabun.service.ChabunService;
import main.ict.login.service.LoginService;
import main.ict.mem.service.MemService;
import main.ict.mem.vo.MemVO;

@Controller
public class LoginController {
	Logger logger = LogManager.getLogger(LoginController.class);
	
	@Autowired(required=false)
	private LoginService loginService;
	
	@Autowired(required=false)
	private MemService memService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	//로그인 폼 이동
	@GetMapping(value="loginForm")
	public String loginForm(HttpServletRequest req, Model model) {
		logger.info("loginForm() 함수 진입 : ");
		
		// NAVER ------------------------------------------------------
		if (req.getParameter("state") != null && req.getParameter("state").equals(ConstPack.M_NAVER_STATE)
				&& req.getParameter("code") != null) {  // 네이버 회원가입 폼을 지나온 경우
			
			// - Access Token 가져오기
			// 토큰 발급 : grant_type="authorization_code"
			// 토큰 갱신 : 		   "refresh_token"
			// 토큰 삭제 : 		   "delete"
			// ※ 로그인 연동 해제 구현 시 토큰 유효성 검사 必 (토큰이 무효해도 success 리턴)
			try {
				logger.info("[Naver] 액세스 토큰 가져오기");
				// Naver Authorization 시 reponse된 값
				String code = req.getParameter("code");
				String state = req.getParameter("state");
				
				String url = "https://nid.naver.com/oauth2.0/token";
				String getTokenURL = url 
								   + "?grant_type=" + "authorization_code"
								   + "&client_id=" + ConstPack.M_NAVER_CID
								   + "&client_secret=" + ConstPack.M_NAVER_CSECRET
								   + "&code=" + code
								   + "&state=" + state;
				
				URL accTokenURL = new URL(getTokenURL);
				HttpURLConnection conn = (HttpURLConnection)accTokenURL.openConnection();
				conn.setRequestMethod("GET");
				
				int responseCode = conn.getResponseCode();
				logger.info("responseCode: " + responseCode);
				
				BufferedReader br = new BufferedReader(
						new InputStreamReader(conn.getInputStream()));
				
				String line = "";
				String result = "";
				while ((line = br.readLine()) != null) {
					result += line;
				}
				logger.info("result: " + result);
				br.close();

				// Parsing ------------------------------
				JSONParser jsonParser = new JSONParser();
				JSONObject jObj = (JSONObject)jsonParser.parse(result);
				
				String access_token = (String)jObj.get("access_token");
//				String refreshToken = (String)jObj.get("refresh_token");
				String tokenType = (String)jObj.get("token_type");
//				logger.info(accessToken);
//				logger.info(tokenType);
				
				// Naver Get Profile API ----------------
				logger.info("[Naver] 프로필 API 정보 가져오기");
				url = "https://openapi.naver.com/v1/nid/me";
				URL profURL = new URL(url);
				conn = (HttpURLConnection)profURL.openConnection();
				conn.setRequestMethod("POST");
				
				// Authorization: [토큰 타입] {접근 토큰}
				String reqHeader = tokenType + " " + access_token;
				conn.setRequestProperty("Authorization", reqHeader);
				conn.setUseCaches(false);
				conn.setDoOutput(true);
				
				responseCode = conn.getResponseCode();
				logger.info("responseCode: " + responseCode);
				
				br = new BufferedReader(
						new InputStreamReader(conn.getInputStream()));
				
				line = "";
				result = "";
				while ((line = br.readLine()) != null) {
					result += line;
				}
				logger.info("result: " + result);  // profile
				br.close();
				
				jsonParser = new JSONParser();
				jObj = (JSONObject)jsonParser.parse(result);
				
				String message = (String)jObj.get("message");  // success
				if (!(message.equals("success"))) {  // NAVER - 프로필 획득 성공
					logger.info("[Profile API] message: " + message);
					return "#";
				}
				JSONObject response = (JSONObject)jObj.get("response");
				
				// DTO Setting
				MemVO mvo = new MemVO();
				mvo.setMid(ConstPack.M_NAVER_FR_ID.concat((String)response.get("id")));
				mvo.setMpw("X");  // 임시값
				mvo.setMname((String)response.get("name"));
				mvo.setMnick((String)response.get("nickname"));
				mvo.setMemail((String)response.get("email"));
				mvo.setMhp((String)response.get("mobile"));
				mvo.setAccess_token(access_token);
				
				// 회원가입 여부 체크
				logger.info(mvo.getMid());
				List<MemVO> memChkList = memService.memIdCheck(mvo);
				if (memChkList != null && memChkList.size() == 1) {  // 로그인 성공시 세션 최초생성
					
					logger.info("[SUCCESS] 회원가입 이력 존재: 메인페이지로 이동");
					// 세션 생성 및 부여하기
					O_Session mSession = O_Session.getInstance();
					mSession.setSession(req, mvo.getMid());
					mSession.addAttribute(req, "access_token", access_token);
					
					return "home/home";  // 메인 페이지로 이동하기
				}
				
				logger.info("[NEW] 회원가입이 필요합니다.");
				model.addAttribute("mvoSNS", mvo);
				logger.info("[SUCCESS] SNS -> memGrade");
				
				return "mem/memGrade";
				
			} catch (Exception e) {
				logger.info("[ERROR - Naver] " + e.getMessage());
				return "#";
			}
			 
		}
		
		// KAKAO ------------------------------------------------------
		if (req.getParameter("code") != null) {
			
			logger.info("[Kakao] 액세스 토큰 가져오기");
			String code = req.getParameter("code");
			logger.info("전달된 코드(code): " + code);
			model.addAttribute("code", code);
			
			// POST /oauth/token HTTP/1.1
			// Host: kauth.kakao.com
			// Content-type: application/x-www-form-urlencoded;charset=utf-8
			String reqURL = "https://kauth.kakao.com/oauth/token";
			// 전달할 소스
			// grant_type	String	authorization_code로 고정	O
			// client_id	String	앱 REST API 키 - [내 애플리케이션] > [앱 키]에서 확인 가능	O
			// redirect_uri	String	인가 코드가 리다이렉트된 URI	O
			String grantType = "authorization_code";
			String clientId = "d00ed47ba28a4cf79b2ef80cee3bfdc0";
			String redirect_uri = "http://localhost:8088/oneYo/loginForm.ict";
			String accessToken = "";
			String refreshToken = "";
			
			try {
				// 데이터를 받아올 URL 및 URL에 연결할 객체 생성
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection)url.openConnection();
				
				conn.setRequestMethod("POST");  // POST
				// Output으로 Connection 객체 사용하도록 설정.
				// POST 방식의 경우 output의 기본값이 false이므로 true로 변경.
				conn.setDoOutput(true);
				
				BufferedWriter bw = new BufferedWriter(
						new OutputStreamWriter(conn.getOutputStream()));
				StringBuffer sb = new StringBuffer();
				sb.append("grant_type=" + grantType);
				sb.append("&client_id=" + clientId);
				sb.append("&redirect_uri=" + redirect_uri);
				sb.append("&code=" + code);
				
				bw.write(sb.toString());
				bw.flush();
				
				int responseCode = conn.getResponseCode();
				logger.info("(결과코드가 200일 경우 성공) 결과 코드: " + responseCode);
				
				BufferedReader br = new BufferedReader(
						new InputStreamReader(conn.getInputStream()));
				
				String line = "";
				String result = "";
				while ((line = br.readLine()) != null) {
					result += line;
				}
				logger.info("result: " + result);

				/*
				 * result:
				 * {
				 * 	"access_token":"aK_BZlu6EtFAUiC6BINSn3cc-g8gY2jPlgfljBq8CioljgAAAYVXwJ8b",
				 * 	"token_type":"bearer",
				 * 	"refresh_token":"LfYgWFTeHBw0WM5FmjfkEIn0uBquxa3MreSKrVxvCioljgAAAYVXwJ8a",
				 * 	"expires_in":21599,
				 * 	"scope":"birthday account_email gender profile_nickname",
				 * 	"refresh_token_expires_in":5183999
				 * }
				 */
				JSONParser jsonParser = new JSONParser();
				JSONObject jObj = (JSONObject)jsonParser.parse(result);
				String access_token = (String)jObj.get("access_token");
//				GET/POST /v2/user/me HTTP/1.1
//				Host: kapi.kakao.com
//				Authorization: Bearer ${ACCESS_TOKEN}/KakaoAK ${APP_ADMIN_KEY}
//				Content-type: application/x-www-form-urlencoded;
//				charset=utf-8
				
				reqURL = "https://kapi.kakao.com/v2/user/me";
				url = new URL(reqURL);
				conn = (HttpURLConnection)url.openConnection();
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Authorization", "Bearer " + access_token);
				conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
				conn.setRequestProperty("charset", "utf-8");
				conn.setDoOutput(true);
				
				bw = new BufferedWriter(
						new OutputStreamWriter(conn.getOutputStream()));
				
				// HttpURLConnection - Query String
				String property_keys = "[\"kakao_account.birthday\", \"kakao_account.email\", \"kakao_account.gender\", \"kakao_account.profile\"]";
				bw.write("property_keys=" + property_keys);
				bw.flush();
				bw.close();
				
				responseCode = conn.getResponseCode();
				logger.info("(결과코드가 200일 경우 성공) 결과 코드: " + responseCode);

				br = new BufferedReader(
						new InputStreamReader(conn.getInputStream()));
				line = "";
				result = "";
				while ((line = br.readLine()) != null) {
					result += line;
				}
				br.close();
				logger.info("result: " + result);
				// 필요한 데이터(또는 사용 가능성이 있는 데이터)를 제외하고 모두 삭제해놓은 상태
//				{	"id":1111111111,
//					"connected_at":"2022-12-09T09:42:46Z",  // TEMP
//					"kakao_account":
//						{
//							"profile":{"nickname":"abc"},
//							"email":"abc@nate.com",
//							"birthday":"1231",  // TEMP
//							"gender":"male"     // TEMP
//						}
//				}
				jObj = (JSONObject)jsonParser.parse(result);
				// ID
				String id = ConstPack.M_KAKAO_FR_ID;
				id += ((Long)jObj.get("id")).toString();
				// Profile info
				JSONObject kakaoAccount = (JSONObject)jObj.get("kakao_account");
				String nick = (String)((JSONObject)kakaoAccount.get("profile")).get("nickname");
				String email = (String)kakaoAccount.get("email");

				MemVO mvo = new MemVO();
				mvo.setMid(id);
				mvo.setMname(nick);
				mvo.setMemail(email);
				mvo.setMpw("X");  // TEMP
				mvo.setMkey("Kakao");
				mvo.setAccess_token(access_token);

				logger.info(mvo.getMid());
				List<MemVO> memChkList = memService.memIdCheck(mvo);
				if (memChkList != null && memChkList.size() == 1) {
					
					logger.info("[SUCCESS] 회원가입 이력 존재: 메인페이지로 이동");
					// 세션 생성 및 부여하기
					O_Session mSession = O_Session.getInstance();
					mSession.setSession(req, mvo.getMid());
					mSession.addAttribute(req, "access_token", access_token);
					
					return "home/home";  // 메인 페이지로 이동하기
				}
				
				logger.info("[NEW] 회원가입이 필요합니다.");
				model.addAttribute("mvoSNS", mvo);
				logger.info("[SUCCESS] SNS -> memGrade");
				
				return "mem/memGrade";
				
			} catch (Exception e) {
				logger.info("[ERROR - Kakao] " + e.getMessage());
				return "#";
			}
		}
		return "login/loginForm";
	} //end of loginForm() method
	
	//로그인
	@PostMapping(value="login")
	public String login(HttpServletRequest req, MemVO mvo, Model model) {
		logger.info("login() 함수 진입 : ");
		
		//서비스 호출
		List<MemVO> loginList = loginService.login(mvo);
		
		logger.info("loginList.get(0) >>> : " + loginList.get(0));
		
		String mnum = loginList.get(0).getMnum();
		logger.info("mnum >>>>>>>>>>>>>>>>>> : " + mnum);
		
		// 세션 생성 및 부여하기
		O_Session mSession = O_Session.getInstance();
		mSession.setSession(req, mnum);
//		String mnum1 = mSession.getSession(req);
//		System.out.println("mnum : " + mnum1);
//		
		if(loginList.size() == 1) {
			return "home/home";
		}else {
			String msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
			model.addAttribute("msg", msg);
			return "login/loginForm";
		}//end of if-else
		
	}//end of login() method
	
	@GetMapping("logout")
	public String logout(HttpServletRequest req, MemVO mvo, Model model) {
		logger.info("logout() 함수 진입.");
		
		// (공통) 카카오, 네이버, 일반
		O_Session oSession = O_Session.getInstance();
		String access_token = (String)oSession.getAttribute(req, "access_token");
		oSession.killSession(req);
		
//		POST /v1/user/logout HTTP/1.1
//		Host: kapi.kakao.com
//		Authorization: Bearer ${ACCESS_TOKEN}/KakaoAK ${APP_ADMIN_KEY}
//		로그아웃 요청 성공 시, 응답 코드와 로그아웃된 사용자의 회원번호를 받습니다.
		String result = "";
		logger.info(mvo.toString());
		if (mvo != null && access_token != null && !(access_token.equals("")) && mvo.getMid().contains(ConstPack.M_KAKAO_FR_ID)) {
			// 토큰이 존재하는 경우 -> 카카오톡 로그인 상태
			String headAuth = "Bearer ";
			headAuth += req.getParameter("accessToken");
			logger.info("headAuth: " + headAuth);
			try {
				URL reqURL = new URL("https://kapi.kakao.com/v1/user/logout");
				HttpURLConnection conn = (HttpURLConnection)reqURL.openConnection();
				conn.setRequestProperty("Authorization", headAuth);
				conn.setUseCaches(false);
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				
				int responseCode = conn.getResponseCode();
				
				BufferedReader bw = new BufferedReader(
										new InputStreamReader(conn.getInputStream()));
				
				String line = "";
				while ((line = bw.readLine()) != null) {
					result += line;
				}
				
				logger.info("[ID] result: " + result);
				
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
			
		}
		
		return "home/home";
	}
	
	//아이디 찾기 폼 이동
	@GetMapping(value="idFindForm")
	public String idFindForm() {
		logger.info("idFindForm() 함수 진입 : ");
		return "login/idFindForm";
	}//end of idFindForm() method
	
	//아이디 찾기 및 인증메일 송부
	@PostMapping(value="idFind")
	@ResponseBody
	public String idFind(MemVO mvo) {
		logger.info("idFind() 함수 진입 : ");
		
		//ajax로 응답할 메세지
		String msg = "";
		
		//서비스 호출(이름 및 이메일 주소 확인)
		List<MemVO> idFindList = loginService.idFind(mvo);
		if(idFindList.size() == 1) {
			MemVO _mvo = idFindList.get(0);
			
			//송부할 이메일 주소
			String receiveMail = mvo.getMemail();
			//송부할 메일 제목
			String mailSubject = "[오내요]오내요 아이디 찾기 안내입니다.";
			//송부할 메세지 *****마지막에 IP주소 바꿀 것!*****
			String sendMsg = "<a href='http://localhost:8088/oneYo/loginShowId.ict?mid=" + _mvo.getMid() + "&insertdate=" + _mvo.getInsertdate() + "'>가입한 아이디 보러가기</a>";
			GoogleMail gm = new GoogleMail();
			gm.authumMail(receiveMail, mailSubject, sendMsg);
			
			msg = "FIND_YES";
		}else {
			msg = "FIND_NO";
		}//end of if-else
		
		return msg;
	}//end of idFind() method
	
	@GetMapping(value="loginShowId")
	public String loginShowId(MemVO mvo, Model model) {
		logger.info("loginShowId() 함수 진입 : ");
		model.addAttribute("idShowVO", mvo);
		return "login/loginShowId";
	}//end of loginShowId() method
	
	//비밀번호 찾기 폼 이동
	@GetMapping(value="pwFindForm")
	public String pwFindForm() {
		logger.info("pwFindForm() 함수 진입 : ");
		return "login/pwFindForm";
	}//end of pwFindForm() method
	
	//비밀번호 찾기 및 인증메일 송부
	@PostMapping(value="pwFind")
	@ResponseBody
	public String pwFind(MemVO mvo, Model model) {
		logger.info("idFind() 함수 진입 : ");
		
		//ajax로 응답할 메세지
		String msg = "";
		
		//서비스 호출(이름 및 이메일 주소 확인)
		List<MemVO> pwFindList = loginService.pwFind(mvo);
		if(pwFindList.size() == 1) {
			MemVO _mvo = pwFindList.get(0);
			
			//송부할 이메일 주소
			String receiveMail = mvo.getMemail();
			//송부할 메일 제목
			String mailSubject = "[오내요]오내요 비밀번호 찾기 안내입니다.";
			//송부할 메세지 *****마지막에 IP주소 바꿀 것!*****
			String sendMsg = "<a href='http://localhost:8088/oneYo/loginResetPWForm.ict?mid=" + _mvo.getMid() + "'>비밀번호 변경하기</a>";
			GoogleMail gm = new GoogleMail();
			gm.authumMail(receiveMail, mailSubject, sendMsg);
			
			msg = "FIND_YES";
		}else {
			msg = "FIND_NO";
		}//end of if-else
		
		return msg;
	}//end of idFind() method
	
	//비밀번호 변경 폼 이동
	@GetMapping(value="loginResetPWForm")
	public String loginResetPWForm(MemVO mvo, Model model) {
		logger.info("loginResetPWForm() 함수 진입 : ");
		model.addAttribute("pwFindVO", mvo);
		return "login/loginResetPW";
	}//end of loginResetPWForm() method
	
	//비밀번호 변경
	@PostMapping(value="resetPW")
	public String resetPW(MemVO mvo) {
		logger.info("resetPW() 함수 진입 : ");
		
		//서비스 호출
		int resetCnt = loginService.resetPW(mvo);
		if(resetCnt == 1) {
			logger.info("resetCnt : " + resetCnt);
			return "login/loginResetPWOK";
		}//end of if
		
		return "login/loginResetPW";
	}//end of resetPW() method
}//end of LoginController class
