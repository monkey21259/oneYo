package main.ict.recipe.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.recipe.dao.RecipeDAO;
import main.ict.recipe.vo.RecipeVO;
import main.ict.warning.vo.WarningVO;

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
	
	@Override
	public List<RecipeVO> recipeSelectAll(RecipeVO recipevo) {
		
		logger.info("recipeSelectAll() 함수 진입");
		
		return recipeDAO.recipeSelectAll(recipevo);
	}
	
	@Override
	public List<RecipeVO> recipeSelectContent(RecipeVO recipevo) {
		
		logger.info("recipeSelectContent() 함수 진입");
		
		return recipeDAO.recipeSelectContent(recipevo);
	}

	@Override
	public int recipeUpdate(RecipeVO recipevo) {
		
		logger.info("recipeUpdate() 함수 진입");
		
		return recipeDAO.recipeUpdate(recipevo);
	}
	
	@Override
	public int recipeDelete(RecipeVO recipevo) {
		
		logger.info("recipeDelete() 함수 진입");
		
		return recipeDAO.recipeDelete(recipevo);
	}

	// recipeSearch 2022-12-29 이성일 추가
	@Override
	public List<RecipeVO> recipeSearch(List<String> rList) {
		// TODO Auto-generated method stub
		
		logger.info("recipeSearch() 함수 진입");
		
		return recipeDAO.recipeSearch(rList);
	}

	@Override
	public int recipeWarningInsert(WarningVO wvo) {
		// TODO Auto-generated method stub
		return recipeDAO.recipeWarningInsert(wvo);
	}

	@Override
	public List<RecipeVO> recipeCategorySelectAll(RecipeVO recipevo) {
		// TODO Auto-generated method stub
		
		logger.info("recipeCategorySelectAll() 함수 진입");
		return recipeDAO.recipeCategorySelectAll(recipevo);
	}

	@Override
	public List<RecipeVO> recipeSelectOne(RecipeVO recipevo) {
		// TODO Auto-generated method stub
		return recipeDAO.recipeSelectOne(recipevo);
	}
	
}
