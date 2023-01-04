package main.ict.recipe.dao;

import java.util.List;

import main.ict.recipe.vo.RecipeVO;
import main.ict.warning.vo.WarningVO;

public interface RecipeDAO {
	
	public int recipeInsert(RecipeVO recipevo);
	public List<RecipeVO> recipeSelectAll(RecipeVO recipevo);
	public List<RecipeVO> recipeSelectContent(RecipeVO recipevo);
	public int recipeUpdate(RecipeVO recipevo);
	public int recipeDelete(RecipeVO recipevo);
	// recipeSearch 2022-12-29 이성일 추가
	public List<RecipeVO> recipeSearch(List<String> rList);

	//신고
	public int recipeWarningInsert(WarningVO wvo);
	
	// 레시피 카테고리별 SelectAll
	public List<RecipeVO> recipeCategorySelectAll(RecipeVO recipevo);
	
	List<RecipeVO> recipeSelectOne(RecipeVO recipevo);
	
}
