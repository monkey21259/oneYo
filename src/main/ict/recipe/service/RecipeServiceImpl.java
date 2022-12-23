package main.ict.recipe.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.recipe.dao.RecipeDAO;
import main.ict.recipe.vo.RecipeVO;

@Service
@Transactional
public class RecipeServiceImpl implements RecipeService {

	Logger logger = LogManager.getLogger(RecipeServiceImpl.class);
	
	@Autowired(required=false)
	public RecipeDAO recipeDAO;
	
	@Override
	public int recipeInsert(RecipeVO recipevo) {
		
		logger.info("recipeInsert() 함수 진입");
		
		return recipeDAO.recipeInsert(recipevo);
	}

}
