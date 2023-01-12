<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	Object obj = request.getAttribute("recipeList");
	List<RecipeVO> recipeList = (List<RecipeVO>)obj;
	RecipeVO rvo = recipeList.get(0);
	String rnum = rvo.getRnum();
%>
<script>
	alert("수정되었습니다.");
	location.href="recipeSelectContent.ict?rnum=<%=rnum%>";
</script>
</body>
</html>