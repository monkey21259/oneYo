package main.ict.home.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.ict.common.ConstPack;
import main.ict.common.O_Session;
import main.ict.community.service.CommunityService;
import main.ict.community.vo.CommunityVO;
import main.ict.home.service.HomeService;
import main.ict.home.vo.HomeVO;
import main.ict.mem.vo.MemVO;
import main.ict.notice.service.NoticeService;
import main.ict.notice.vo.NoticeVO;
import main.ict.recipe.service.RecipeService;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.service.TipService;
import main.ict.tip.vo.TipVO;

@Controller
public class HomeController {
	
	//	log4j 세팅
	private Logger logger = LogManager.getLogger(HomeController.class);
	
	@Autowired(required=false)
	private HomeService homeService;
	
	@Autowired(required=false)
	private RecipeService recipeService;
	
	@Autowired(required=false)
	private TipService tipService;
	
	@Autowired(required=false)
	private CommunityService communityService;
	
	@Autowired(required=false)
	private NoticeService noticeService;
	
	//	home 이동
	// 2022-12-30 이성일 home 데이터 추가
	@GetMapping(value="home")
	public String home(HttpServletRequest req, Model model) {
		
		logger.info("home() >>> : home.jsp");
		
		logger.info((String)req.getParameter("client_id"));
		
		Map<String, Object> dataMap = new HashMap();
		
		List<RecipeVO> rList = homeService.getRecipeList();
		List<TipVO> tList = homeService.getTipList();
		List<CommunityVO> cList = homeService.getCommunityList();
		List<NoticeVO> nList = homeService.getNoticeList();
		List<MemVO> mList = homeService.getMemList();
		List<HomeVO> cntList = homeService.getCntList();
		
		if(rList !=null && rList.size() > 0)
			dataMap.put("RecipeList", rList);
		
		if(tList !=null && tList.size() > 0)
			dataMap.put("TipList", tList);
		
		if(cList !=null && cList.size() > 0)
			dataMap.put("CommunityList", cList);
		
		if(nList !=null && nList.size() > 0)
			dataMap.put("NoticeList", nList);
		
		if(mList !=null && mList.size() > 0)
			dataMap.put("MemList", mList);
		
		if(cntList !=null && cntList.size() == 1)
			dataMap.put("Count", cntList);
		
		model.addAttribute("DataMap", dataMap);
		
		return "home/home";
	}
	
	@GetMapping(value="chefIntroduce")
	public String chefIntroduce(HttpServletRequest req, Model m) {
		logger.info("chefIntroduce() 함수 진입");
		m.addAttribute("mnum", req.getParameter("mnum"));
		return "home/chefIntroduce";
	}
	
	
//	public List<RecipeVO> recipeSelectContent(RecipeVO recipevo) { goSelectContent
	@GetMapping(value="goSelectContent")
	public String goSelectContent(HttpServletRequest req, Model model) {
		logger.info("goSelectContent() 함수 진입");
		
		String num = req.getParameter("num");
		if (num == null) {
			logger.info("메인페이지에서 바로 글보기로 넘어올 때 값 설정이 제대로 되어있지 않습니다.");
			return "#";
		}
		
		String category;
		try {
			category = num.substring(0, 1);	// 카테고리별 분기처리
			if (category.equals("R")) {		// Recipe
				RecipeVO rvo = new RecipeVO();
				rvo.setRnum(num);
				
				List<RecipeVO> recipeList = recipeService.recipeSelectContent(rvo);
				logger.info("recipeList: " + recipeList);
				if (recipeList != null) {
					model.addAttribute("recipeList", recipeList);
					return "./recipe/recipeSelectContent";
				}
			}
			if (category.equals("T")) {		// Expert Tip
				TipVO tvo = new TipVO();
				tvo.setTnum(num);
				
				List<TipVO> list = tipService.tipSelectContent(tvo);
				logger.info("list: " + list);
				if (list != null) {
					model.addAttribute("list", list);
					return "./tip/tipSelectContent";
				}
			}
			if (category.equals("C")) {		// Community
				CommunityVO cvo = new CommunityVO();
				cvo.setCnum(num);
				
				List<CommunityVO> listS = communityService.communitySelect(cvo);
				logger.info("listS: " + listS);
				if (listS != null) {
					model.addAttribute("listS", listS);
					return "./community/communitySelectContent";
				}
			}
			if (category.equals("N")) {		// Notice
				NoticeVO nvo = new NoticeVO();
				nvo.setNnum(num);
				
				List<NoticeVO> scontList = noticeService.noticeSelectContent(nvo);
				logger.info("scontList: " + scontList);
				if (scontList != null) {
					model.addAttribute("scontList", scontList);
					return "./notice/noticeSelectContent";
				}
			}
			
		} catch (Exception e) {
			logger.info("빈 문자열로 인한 IndexOutOfBoundsException이 발생하였습니다.");
		}
		logger.info("그 다른 어떠한 문제 발생");
		return "#";
	}
	
	
	
	
	// SNS Logout
//	@GetMapping(value="logout")
//	public String logout(HttpServletRequest req, MemVO mvo) {
		
//		logger.info("logout() 함수 진입");
		
		// 공통 (일반 + SNS)
//		O_Session oSession = O_Session.getInstance();
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
//		oSession.killSession(req);
		
//		return "home/home";
//	}
	
}
