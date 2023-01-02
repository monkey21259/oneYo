package main.ict.home.controller;

import java.util.List;

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
import main.ict.home.service.HomeService;

@RestController
public class HomeRestController {
	Logger logger = LogManager.getLogger(HomeRestController.class);
	
	@Autowired(required=false)
	private HomeService homeService;
	
	@GetMapping(value="/mem/{mem_num}", produces = "text/json; charset=UTF-8")
	public String homeRestSelectMem(@PathVariable String mem_num) {
		logger.info("homeRestSelectMem() 함수 진입");
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
			JSONObject json_recipe_obj = null;
			JSONArray json_recipe_array = new JSONArray();
			
			for(int i=0; i < rList.size(); i++) {
				rvo = rList.get(i);
				logger.info("레시피 정보 : " + rvo.toString());
				
				json_recipe_obj = new JSONObject();
				json_recipe_obj.put("rnum", rvo.getRnum());
				json_recipe_obj.put("rsubject", rvo.getRsubject());
				json_recipe_obj.put("rphoto", rvo.getRphoto());
				json_recipe_obj.put("rsubject", rvo.getRsubject());
				json_recipe_array.add(json_recipe_obj);
			} // end of for
			json_output.put("recipe", json_recipe_array);
		} // end of if
		
		return json_output.toJSONString();
	} // end of homeRestSelectMem()

}
