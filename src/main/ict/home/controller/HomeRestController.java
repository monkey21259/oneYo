package main.ict.home.controller;

import java.io.StringWriter;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import main.ict.mem.vo.MemVO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.tip.vo.TipVO;
import main.ict.comment.vo.CommentVO;
import main.ict.common.CodeUtils;
import main.ict.community.vo.CommunityVO;
import main.ict.home.service.HomeService;
import main.ict.home.vo.HomeVO;
import main.ict.home.vo.ObjectVO;

@RestController
public class HomeRestController {
	Logger logger = LogManager.getLogger(HomeRestController.class);
	
	@Autowired(required=false)
	private HomeService homeService;
	
	@GetMapping(value="/recipe/{mem_num}", produces = "text/json; charset=UTF-8")
	public String homeRestSelectRecipe(@PathVariable String mem_num) {
		logger.info("homeRestSelectRecipe() 함수 진입");
		logger.info("mem_num : " + mem_num);
		
		MemVO mvo = null;
		RecipeVO rvo = null;
		List<MemVO> mList = null;
		List<RecipeVO> rList = null;
		JSONObject json_output = new JSONObject();
		
		if(mem_num !=null && !(mem_num.equals("")) && mem_num.length() > 0) {
			mvo = new MemVO();
			mvo.setMnum(mem_num);
			mList = homeService.homeRestSelectMem(mvo);
			
			rvo = new RecipeVO();
			rvo.setMnum(mem_num);
			rList = homeService.homeRestSelectRecipe(rvo);
		} // end of if
		
		if(mList !=null && mList.size() == 1) {
			mvo = mList.get(0);
			logger.info("회원 정보 : " + mvo.toString());
			
			JSONObject json_member_obj = new JSONObject();
			JSONArray json_member_array = new JSONArray();
			
			json_member_obj.put("mnum", mvo.getMnum());
			json_member_obj.put("mnick", mvo.getMnick());
			json_member_obj.put("mgrade", mvo.getMgrade());
			json_member_obj.put("mprofile", mvo.getMprofile());
			json_member_obj.put("insertdate", mvo.getInsertdate());
			json_member_array.add(json_member_obj);
			json_output.put("mem", json_member_array);
		} // end of if
		
		if(rList !=null && rList.size() > 0) {
			JSONObject json_recipe_obj = null;
			JSONArray json_recipe_array = new JSONArray();
			
			for(int i=0; i < rList.size(); i++) {
				rvo = rList.get(i);
				logger.info("레시피 정보 : " + rvo.toString());
				
				json_recipe_obj = new JSONObject();
				json_recipe_obj.put("rnum", rvo.getRnum());
				json_recipe_obj.put("rsubject", rvo.getRsubject());
				json_recipe_obj.put("rcategory", rvo.getRcategory());
				json_recipe_obj.put("rphoto", rvo.getRphoto());
				json_recipe_obj.put("mnick", rvo.getMnick());
				json_recipe_obj.put("rhit", rvo.getRhit());
				json_recipe_obj.put("insertdate", rvo.getInsertdate());
				json_recipe_obj.put("likecnt", rvo.getLikecnt());
				json_recipe_array.add(json_recipe_obj);
			} // end of for
			json_output.put("recipe", json_recipe_array);
		} // end of if
		
		return json_output.toJSONString();
	} // end of homeRestSelectMem()
	
	@GetMapping(value="/tip/{mem_num}", produces="text/json; charset=UTF-8")
	public String homeRestSelectTip(@PathVariable String mem_num) {
		logger.info("homeRestSelectTip() 함수 진입");
		
		MemVO mvo = null;
		TipVO tvo = null;
		List<MemVO> mList = null;
		List<TipVO> tList = null;
		JSONObject json_output = new JSONObject();
		
		if(mem_num !=null && !(mem_num.equals("")) && mem_num.length() > 0) {
			mvo = new MemVO();
			mvo.setMnum(mem_num);
			mList = homeService.homeRestSelectMem(mvo);
			
			tvo = new TipVO();
			tvo.setMnum(mem_num);
			tList = homeService.homeRestSelectTip(tvo);
		} // end of if
		
		if(mList !=null && mList.size() == 1) {
			mvo = mList.get(0);
			logger.info("회원 정보 : " + mvo.toString());
			
			JSONObject json_member_obj = new JSONObject();
			JSONArray json_member_array = new JSONArray();
			
			json_member_obj.put("mnum", mvo.getMnum());
			json_member_obj.put("mnick", mvo.getMnick());
			json_member_obj.put("mgrade", mvo.getMgrade());
			json_member_obj.put("mprofile", mvo.getMprofile());
			json_member_array.add(json_member_obj);
			json_output.put("mem", json_member_array);
		} // end of if
		
		if(tList !=null && tList.size() > 0) {
			JSONObject json_tip_obj = null;
			JSONArray json_tip_array = new JSONArray();
			
			for(int i=0; i < tList.size(); i++) {
				tvo = tList.get(i);
				logger.info("전문가팁 정보 : " + tvo.toString());
				
				json_tip_obj = new JSONObject();
				json_tip_obj.put("tnum", tvo.getTnum());
				json_tip_obj.put("tsubject", tvo.getTsubject());
				json_tip_obj.put("tcategory", tvo.getTcategory());
				json_tip_obj.put("tphoto", tvo.getTphoto());
				json_tip_obj.put("mnick", tvo.getMnick());
				json_tip_obj.put("thit", tvo.getThit());
				json_tip_obj.put("insertdate", tvo.getInsertdate());
				json_tip_obj.put("likecnt", tvo.getLikecnt());
				json_tip_array.add(json_tip_obj);
			} // end of for
			json_output.put("tip", json_tip_array);
		} // end of if
		
		return json_output.toJSONString();
	} // end of homeRestSelectTip()

	@GetMapping(value="/community/{mem_num}", produces="text/json; charset=UTF-8")
	public String homeRestSelectCommunity(@PathVariable String mem_num) {
		logger.info("homeRestSelectCommunity() 함수 진입");
		
		MemVO mvo = null;
		CommunityVO cvo = null;
		List<MemVO> mList = null;
		List<CommunityVO> cList = null;
		JSONObject json_output = new JSONObject();
		
		if(mem_num !=null && !(mem_num.equals("")) && mem_num.length() > 0) {
			mvo = new MemVO();
			mvo.setMnum(mem_num);
			mList = homeService.homeRestSelectMem(mvo);
			
			cvo = new CommunityVO();
			cvo.setMnum(mem_num);
			cList = homeService.homeRestSelectCommunity(cvo);
		} // end of if
		
		if(mList !=null && mList.size() == 1) {
			mvo = mList.get(0);
			logger.info("회원 정보 : " + mvo.toString());
			
			JSONObject json_member_obj = new JSONObject();
			JSONArray json_member_array = new JSONArray();
			
			json_member_obj.put("mnum", mvo.getMnum());
			json_member_obj.put("mnick", mvo.getMnick());
			json_member_obj.put("mgrade", mvo.getMgrade());
			json_member_obj.put("mprofile", mvo.getMprofile());
			json_member_array.add(json_member_obj);
			json_output.put("mem", json_member_array);
		} // end of if
		
		if(cList !=null && cList.size() > 0) {
			JSONObject json_community_obj = null;
			JSONArray json_community_array = new JSONArray();
			
			for(int i=0; i < cList.size(); i++) {
				cvo = cList.get(i);
				logger.info("커뮤니티 정보 : " + cvo.toString());
				
				json_community_obj = new JSONObject();
				json_community_obj.put("cnum", cvo.getCnum());
				json_community_obj.put("csubject", cvo.getCsubject());
				json_community_obj.put("cphoto", cvo.getCphoto());
				json_community_obj.put("csubject", cvo.getCsubject());
				json_community_obj.put("mnick", cvo.getMnick());
				json_community_obj.put("chit", cvo.getChit());
				json_community_obj.put("insertdate", cvo.getInsertdate());
				json_community_array.add(json_community_obj);
			} // end of for
			json_output.put("community", json_community_array);
		} // end of if
		
		return json_output.toJSONString();
	}
	
	@GetMapping(value="/info", produces="application/json; charset=UTF8")
	public String homeRestInformation() {
		logger.info("homeRestInformation() 함수 진입");
		
		HomeVO hvo = null;
		JSONObject json_obj = new JSONObject();
		List<HomeVO> list = homeService.getCntList();
		
		// list.size() : 1
		if(list !=null && list.size() == 1) {
			
			logger.info(list);
			hvo = list.get(0);

			if(hvo !=null) {
				
				json_obj.put("RecipeCnt", hvo.getRecipecnt());
				json_obj.put("CommunityCnt", hvo.getCommunitycnt());
				json_obj.put("TipCnt", hvo.getTipcnt());
				json_obj.put("MemberCnt", hvo.getMembercnt());
				
			}
		}		
		return json_obj.toJSONString();
	}
	
	@GetMapping(value="/condCategory/{cc}", produces="text/json;charset=UTF-8")
	public void homeRESTCateCond(@PathVariable String cc, HttpServletResponse res) {	// return JSONString -> void
		
		logger.info("homeRESTCateCond() 함수 진입. cc: " + cc);  // ex) W1
		if (cc == null || cc.length() == 0) {
			logger.info("cc == null || cc.length() == 0");
//			return null;
			return;
		}
		
		String dateCondition = cc.substring(0, 1);	// 일간D/주간W/월간M
		String boardCategory = cc.substring(1, 2);	// 레시피/팁/커뮤니티/공지사항
		String viewCount = cc.substring(2);			// 보여줄 게시글 개수
		logger.info("dateCondition: " + dateCondition);	// ex) W -> Week
		// 1: 레시피 -> A / 2: 전문가 -> B / 3: 커뮤니티 -> C / 4: 공지사항 -> D
//		logger.info("boardCategory(before): " + boardCategory);	// ex) 1
		boardCategory = CodeUtils.getCategory(boardCategory);
		logger.info("boardCategory(after): " + boardCategory);	// ex) A

		ObjectVO ovo = new ObjectVO();
		// DTO Setting
		ovo.setDateCondition(dateCondition);
		ovo.setBoardCategory(boardCategory);
		ovo.setViewCount(Integer.parseInt(viewCount));

		List<ObjectVO> oList = homeService.getCondVOList(ovo);
		if (oList != null) {
			logger.info("oList is not null");
			logger.info(oList.toString());
		}
		
		// JSONArray를 사용해서 리스트 받기 -> 각 VO를 Map으로 변경해서 할당.
		
		// ** 테스트케이스 ** //
//		JSONObject testObj = new JSONObject();  // 
//		testObj.put("TEST", "TEST입니다.");  // VO를 Map으로 받아서 다 넣어야됨.
		
		// JSONArray(jsonArr)를 담을 최종 JSONObject
		JSONObject jsonObj = new JSONObject();
		// JSONObject를 담을 Array
		JSONArray  jsonArr = new JSONArray();
		
		// jsonArr에 담겨질 JSONObject
		JSONObject jObj = null;
//		Map<String, Object> oMap = null;
		logger.info("oList: " + oList);
		if (oList != null) {
			try {
				if (oList.size() == 0) { throw new Exception("사이즈 부족"); }
				for (ObjectVO _ovo: oList) {
//					oMap = CodeUtils.convertToMap(oList.get(0));
					jObj = CodeUtils.convertToJSONObj(_ovo);
					jsonArr.add(jObj);
				}
			} catch (Exception e) {
				logger.info("[FAIL] VO -> JSONObject: " + e.getMessage());
//				oMap = Collections.emptyMap();
				jObj = new JSONObject();
				jsonArr = new JSONArray();
				jsonArr.add(jObj);
			}
		}
//		logger.info("oMap.toString(): " + oMap.toString());
		logger.info("jObj.toString(): " + jObj.toString());
		
//		obj = new JSONObject(oMap);  // json-simple-1.1.1.jar에서 지원.
//		StringWriter out = new StringWriter();
//		try {
//			JSONObject.writeJSONString(oMap, out);
//		} catch (Exception e) {
//			logger.info("[FAIL] Write JSONObject to JSONString.");
//		}
//		logger.info("out.toString(): " + out.toString());
		
		// JSONObject --------------------------
		jsonObj.put("jsonArr", jsonArr);
		
		try {
			logger.info("JSONObject 보내기 시도");
			res.getWriter().print(jsonObj);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		
		return;	// String -> void
	}

}
