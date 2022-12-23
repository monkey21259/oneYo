package main.ict.recipe.dao;

import java.util.List;

import main.ict.recipe.vo.RecipeVO;

public interface RecipeDAO {
	
	public int recipeInsert(RecipeVO recipevo);
	public List<RecipeVO> recipeSelectAll();

}
