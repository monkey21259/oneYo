package main.ict.recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import main.ict.recipe.vo.RecipeVO;
import main.ict.warning.vo.WarningVO;

public class RecipeDAOImpl implements RecipeDAO {

	@Autowired(required=false)
	SqlSession sqlSession;
	
	@Override
	public int recipeInsert(RecipeVO recipevo) {
		
		return sqlSession.insert("recipeInsert", recipevo);
	}
	
	@Override
	public List<RecipeVO> recipeSelectAll(RecipeVO recipevo) {
		
		return sqlSession.selectList("recipeSelectAll", recipevo);
	}

	@Override
	public List<RecipeVO> recipeSelectContent(RecipeVO recipevo) {
		
		return sqlSession.selectList("recipeSelectContent", recipevo);
	}
	
	@Override
	public int recipeUpdate(RecipeVO recipevo) {
		
		return sqlSession.update("recipeUpdate", recipevo);
	}
	
	@Override
	public int recipeDelete(RecipeVO recipevo) {
		
		return sqlSession.update("recipeDelete", recipevo);
	}

	// recipeSearch 2022-12-29 이성일 추가
	@Override
	public List<RecipeVO> recipeSearch(List<String> rList) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("recipeSearch", rList);
	}

	@Override
	public int recipeWarningInsert(WarningVO wvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recipeWarningInsert", wvo);
	}

	@Override
	public List<RecipeVO> recipeCategorySelectAll(RecipeVO recipevo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recipeCategorySelectAll", recipevo);
	}
	
}
