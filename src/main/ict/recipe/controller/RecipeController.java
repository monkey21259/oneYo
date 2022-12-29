package main.ict.recipe.controller;

import java.util.ArrayList;
import java.util.List;

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
import main.ict.common.ChabunUtils;
import main.ict.common.ConstPack;
import main.ict.common.FileUpload;
import main.ict.common.chabun.service.ChabunService;

@Controller
public class RecipeController {

	Logger logger = LogManager.getLogger(RecipeController.class);
	
	@Autowired(required=false)
	public RecipeService recipeService;
	
	@Autowired(required=false)
	public ChabunService chabunService;
	
// I Form
	@GetMapping(value="recipeInsertForm")
	public String recipeInsertForm() {  // 세션 처리 필요
		
		logger.info("recipeInsertForm() 함수 진입");
		
		return "./recipe/recipeInsertForm";
	}
	
// I
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
		
		String rnum = ChabunUtils.getRecipeChabun("D", chabunService.getRecipeChabun().getRnum());
		recipevo.setRnum(rnum);
		
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
		
		recipevo.setRperson(rfu.getParameter("rperson"));
		recipevo.setRdiff(rfu.getParameter("rdiff"));
		recipevo.setRcontent(rfu.getParameter("rcontent"));
		recipevo.setRphoto(rfu.getFileName("rphoto"));
		recipevo.setRhit(rfu.getParameter("rhit"));
		recipevo.setMnum("M202212230011");  // TODO TEMP -----------------------------
		recipevo.setWarning("0");
		
		logger.info(recipevo.toString());

		// INSERT
		int nCnt = recipeService.recipeInsert(recipevo);
		logger.info("nCnt: " + nCnt);
		if (nCnt < 1) {
			logger.info("[FAIL] Recipe INSERT");
			return "#";
		}
		
		List<RecipeVO> recipeList = new ArrayList<RecipeVO>();
		recipeList.add(recipevo);
		
		model.addAttribute("recipeList", recipeList);
		// TODO 추후 좋아요, 싫어요, 신고, 댓글 추가 필요
		return "./recipe/recipeSelectContent";
	}
	
// S_ALL
	@GetMapping(value="recipeSelectAll")
	public String recipeSelectAll(RecipeVO recipevo, Model model) {
		
		logger.info("recipeSelectAll() 함수 진입.");
		
		recipevo.setPageSize(String.valueOf(ConstPack.RECIPE_PAGE_SIZE));
		recipevo.setGroupSize(String.valueOf(ConstPack.RECIPE_GROUP_SIZE));
		if(recipevo.getCurPage() == null) {
			recipevo.setCurPage(String.valueOf(ConstPack.RECIPE_CUR_PAGE));
		}//end of if
		
		// 1. 값 불러와서 model
		List<RecipeVO> recipeList = recipeService.recipeSelectAll(recipevo);
		if (recipeList == null || recipeList.size() < 1) {
			logger.info("[FAIL] Recipe SelectAll");
			return "#";
		}
//		logger.info(recipeList.toString());
		
		model.addAttribute("pagingVO", recipevo);
		model.addAttribute("recipeList", recipeList);
		// TODO 페이징, 조건 검색(?)
		return "./recipe/recipeSelectAll";
	}

// S
	@GetMapping(value="recipeSelectContent")
	public String recipeSelectContent(RecipeVO recipevo, Model model) {
		
		logger.info("recipeSelectContent() 함수 진입");
//		logger.info(recipevo.toString());  // RecipeVO [rnum=R202212210004, ..., mnum=M202212200005]
		
		List<RecipeVO> recipeList = recipeService.recipeSelectContent(recipevo);
		if (recipeList == null || recipeList.size() != 1) {
			logger.info("recipeList is invalid.");
			return "#";
		}
		
		logger.info("[SUCCESS] Recipe");
		model.addAttribute("recipeList", recipeList);
		return "./recipe/recipeSelectContent";
	}
	
// U Form
	@PostMapping(value="recipeUpdateForm")
	public String recipeUpdateForm(RecipeVO recipevo, Model model) {
		
		logger.info("recipeUpdateForm() 함수 진입");
		
		// (O) rnum, rhit, mnum, updatedate, (X) warning, deleteyn, insertdate 
		// (221224) rnum, rhit, mnum, updatedate
		logger.info(recipevo.toString());
		model.addAttribute("recipevo", recipevo);
		return "./recipe/recipeUpdateForm";
	}
	
// U
	@PostMapping(value="recipeUpdate")
	public String recipeUpdate(RecipeVO recipevo, Model model) {
		
		logger.info("recipeUpdate() 함수 진입");
		logger.info(recipevo.toString());
		
		int nCnt = recipeService.recipeUpdate(recipevo);
		logger.info("[Recipe Update] Count: " + nCnt);
		if (nCnt < 1) {  // FAIL
			return "#";
		}
		
		List<RecipeVO> recipeList = new ArrayList<RecipeVO>();
		recipeList.add(recipevo);
		
		model.addAttribute("recipeList", recipeList);
		return "./recipe/recipeSelectContent";
	}
	
// D
	@PostMapping(value="recipeDelete")
	public String recipeDelete(RecipeVO recipevo, Model model) {
		
		logger.info("recipeDelete() 함수 진입");
		
		int nCnt = recipeService.recipeDelete(recipevo);
		logger.info("[Recipe Delete] Count: " + nCnt);
		if (nCnt < 1) {  // FAIL
			return "#";
		}
		
		List<RecipeVO> recipeList = recipeService.recipeSelectAll(recipevo);
		model.addAttribute("recipeList", recipeList);
		return "./recipe/recipeSelectAll";
	}
	
}
