package main.ict.recipe.dao;

import java.util.List;

import main.ict.recipe.vo.RecipeVO;

public interface RecipeDAO {
	
	public int recipeInsert(RecipeVO recipevo);
	public List<RecipeVO> recipeSelectAll();
	public List<RecipeVO> recipeSelectContent(RecipeVO recipevo);
	public int recipeUpdate(RecipeVO recipevo);
	public int recipeDelete(RecipeVO recipevo);

}
