package main.ict.recipe.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.ict.recipe.service.RecipeService;
import main.ict.recipe.vo.RecipeVO;
import main.ict.common.ConstPack;
import main.ict.common.FileUpload;

@Controller
public class RecipeController {

	Logger logger = LogManager.getLogger(RecipeController.class);
	
	@Autowired(required=false)
	public RecipeService recipeService;
	
	// RecipeDAO
	
	@GetMapping(value="recipeInsertForm")
	public String recipeInsertForm() {  // 세션 처리 필요
		
		logger.info("recipeInsertForm() 함수 진입");
		
		return "./recipe/recipeInsertForm";
	}
	
	@PostMapping(value="recipeInsert")
	public String recipeInsert(HttpServletRequest req, Model model) {
		
		logger.info("recipeInsert() 함수 진입");
		
		FileUpload rfu = new FileUpload(ConstPack.RECIPE_IMG_PATH,
										ConstPack.RECIPE_IMG_SIZE,
										ConstPack.RECIPE_ENC_TYPE);

		boolean bool = rfu.imgFileUpload(req);
		String rphoto = "";
		if (!bool) {
			logger.info("[FAIL] POST Request.");
			return "#";
		}
		
		// VO setting
		RecipeVO recipevo = new RecipeVO();
		
		// 채번
		recipevo.setRnum("R202212230001");
		//
		
		recipevo.setRsubject(rfu.getParameter("rsubject"));
		recipevo.setRcategory(rfu.getParameter("rcategory"));
		recipevo.setRjeryo(rfu.getParameter("rjeryo"));
		
		String rhour = rfu.getParameter("rhour");
		String rminute = rfu.getParameter("rminute");
		StringBuffer sb = new StringBuffer();
		sb.append(rhour);
		sb.append("시 ");
		sb.append(rminute);
		sb.append("분");
		recipevo.setRtime(sb.toString());
		sb = null;
		
		recipevo.setRperson(rfu.getParameter("rperson"));
		recipevo.setRdiff(rfu.getParameter("rdiff"));
		recipevo.setRcontent(rfu.getParameter("rcontent"));
		recipevo.setRphoto(rfu.getFileName("rphoto"));
		recipevo.setRhit(rfu.getParameter("rhit"));
		recipevo.setMnum("M202212230001");  // TODO TEMP -----------------------------
		recipevo.setWarning("0");
		
		logger.info(recipevo.toString());

		// INSERT
		int nCnt = recipeService.recipeInsert(recipevo);
		logger.info("nCnt: " + nCnt);
		if (nCnt < 1) {
			logger.info("[FAIL] Recipe INSERT");
			return "#";
		}
		
		return "recipe/recipeSelectAll";
	}
	
	
	
	
}
