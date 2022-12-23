package main.ict.recipe.service;

import java.util.List;

import main.ict.recipe.vo.RecipeVO;

public interface RecipeService {

	public int recipeInsert(RecipeVO recipevo);
	public List<RecipeVO> recipeSelectAll();
	
	
	
}
