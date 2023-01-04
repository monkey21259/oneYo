package main.ict.home.controller;

import java.util.List;

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
			json_member_array.add(json_member_obj);
			json_output.put("mem", json_member_array);
		} // end of if
		
		if(rList !=null && rList.size() > 0) {
			JSONObject json_tip_obj = null;
			JSONArray json_tip_array = new JSONArray();
			
			for(int i=0; i < rList.size(); i++) {
				rvo = rList.get(i);
				logger.info("레시피 정보 : " + rvo.toString());
				
				json_tip_obj = new JSONObject();
				json_tip_obj.put("rnum", rvo.getRnum());
				json_tip_obj.put("rsubject", rvo.getRsubject());
				json_tip_obj.put("rphoto", rvo.getRphoto());
				json_tip_obj.put("rsubject", rvo.getRsubject());
				json_tip_array.add(json_tip_obj);
			} // end of for
			json_output.put("recipe", json_tip_array);
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
				json_tip_obj.put("tphoto", tvo.getTphoto());
				json_tip_obj.put("tsubject", tvo.getTsubject());
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
				json_community_array.add(json_community_obj);
			} // end of for
			json_output.put("community", json_community_array);
		} // end of if
		
		return json_output.toJSONString();
	}
	
	@GetMapping(value="/info")
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
	public void homeRESTCateCond(@PathVariable String cc, HttpServletResponse res) {	// return JSON
		
		logger.info("homeRESTCateCond() 함수 진입. cc: " + cc);  // ex) W1
		
		if (cc == null && cc.length() == 0) {
			return;
		}
		
		String dateCondition = cc.substring(0, 1);	// 일간/주간/월간
		String boardCategory = cc.substring(1);		// 레시피/팁/커뮤니티/공지사항
		logger.info("dateCondition: " + dateCondition);	// ex) W -> Week
		// 1: 레시피 -> A / 2: 전문가 -> B / 3: 커뮤니티 -> C / 4: 공지사항 -> D
		logger.info("boardCategory(before): " + boardCategory);	// ex) 1
		boardCategory = CodeUtils.getCategory(boardCategory);
		logger.info("boardCategory(after): " + boardCategory);	// ex) A

		ObjectVO ovo = new ObjectVO();
		// DTO Setting
		ovo.setDateCondition(dateCondition);
		ovo.setBoardCategory(boardCategory);

		List<ObjectVO> oList = homeService.getCondVOList(ovo);
		if (oList != null) {
			logger.info("oList is not null");
			logger.info(oList.toString());
		}
//		#{ boardCategory }
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("TEST", "TEST입니다.");

		try {
			logger.info("JSONObject 보내기 시도");
			res.getWriter().print(jsonObj);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		
		return;	// void
	}

}
