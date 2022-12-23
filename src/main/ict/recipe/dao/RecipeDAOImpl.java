package main.ict.recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import main.ict.recipe.vo.RecipeVO;

public class RecipeDAOImpl implements RecipeDAO {

	@Autowired(required=false)
	SqlSession sqlSession;
	
	@Override
	public int recipeInsert(RecipeVO recipevo) {
		
		return sqlSession.insert("recipeInsert", recipevo);
	}
	
	@Override
	public List<RecipeVO> recipeSelectAll() {
		
		return sqlSession.selectList("recipeSelectAll");
	}

}