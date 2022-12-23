<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="java.util.List" %>

<%@ page import="main.ict.recipe.vo.RecipeVO" %>

<% Logger logger = LogManager.getLogger(this.getClass()); %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>recipeSelectAll.jsp</title>
	</head>
	<body>
		<% logger.info("[recipeSelectAll.jsp] .jsp 진입"); %>
		<%
			Object recipeObj = request.getAttribute("recipeList");
			if (recipeObj == null) {
				logger.info("[FAIL] getAttribute -> recipeObj is null");
			}
			@SuppressWarnings("unchecked")
			List<RecipeVO> recipeList = (List<RecipeVO>)recipeObj;
			if (recipeList.size() < 1) {
				logger.info("[FAIL] Type Casting -> recipeList.size() < 1");
			}
		
			out.println("<h3> Recipe Select All </h3>");
			for (RecipeVO recipevo: recipeList) {
				out.println(recipevo.toString() + "<br /><br />");
			}
		%>
	</body>
</html>