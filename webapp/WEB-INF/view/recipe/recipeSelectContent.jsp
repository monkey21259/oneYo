<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="java.util.List" %>

<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.common.CodeUtils" %>

<% Logger logger = LogManager.getLogger(this.getClass()); %>
<%
		Object recipeObj = request.getAttribute("recipeList");
		if (recipeObj == null) {
			logger.info("[FAIL] getAttribute -> recipeObj is null");
		}
		
		List<RecipeVO> recipeList = (List<RecipeVO>)recipeObj;
		if (recipeList.size() != 1) {
			logger.info("[FAIL] recipeList.size() != 1");
		}
		logger.info(recipeList.toString());
		
		RecipeVO recipevo = recipeList.get(0);
%>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<title>recipeSelectContent.jsp</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			
			console.log("[recipeSelectContent.jsp] JS");
			$(document).ready(function() {
				
				console.log("[recipeSelectContent.jsp] jQuery");
				
				// UpdateForm, Delete
				$("#recipeUpdateFormBtn").on("click", function() {
					
					console.log("[Click] UpdateForm Button");
					$("#recipeSelectForm").attr({
						"action": "/oneYo/recipeUpdateForm.ict",
						"method": "POST",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				
				$("#recipeDeleteBtn").on("click", function() {
					
					console.log("[Click] Delete Button");
					$("#recipeSelectForm").attr({
						"action": "/oneYo/recipeDelete.ict",
						"method": "POST",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				
				$("#warningBtn").click(function(){
					
					$("#recipeSelectForm").attr({
						"action": "recipeWarningForm.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
					
				});
				
				
			});
		
		</script>
		<style type="text/css">
		
			.recipeTable tr, .recipeTable td {
				border: 1px solid black;			
			}
		
		</style>
		<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipe_select.css">
	</head>
	<body>
	<% logger.info("[recipeSelectContent.jsp] .jsp 진입"); %>
	<% request.setCharacterEncoding("UTF-8"); %>
<!--  -->
		<header></header>
<!--  -->
		<nav></nav>
<!--  -->
		<aside></aside>
<!-- Section -->
		<section>
			<div class="recipeSectionHeader">
				<span class="t">레시피(Recipe) 글보기</span>
			</div>
			<form id="recipeSelectForm">
				<input id="tnum" name="tnum" type="hidden" value="<%= recipevo.getRnum() %>">
				<input id="tsubject" name="tsubject" type="hidden" value="<%= recipevo.getRsubject() %>">
				<table class="recipeTable">
					<tr>
						<td colspan="2" style="text-align:center;">
							<span>레시피 글쓰기</span>
						</td>
					</tr>
					<tr> <%  // 글 제목 %>
						<td>글 제목</td>
						<td>
							<input type="text" id="rsubject" name="rsubject"
								   value="<%= recipevo.getRsubject() %>" readonly />
						</td>
					</tr>
					<tr> <%  // 요리 분야 %>
						<td>요리 분야</td>
						<td>
							<input type="text" id="rcategory" name="rcategory"
								   value="<%= CodeUtils.getRcategory(recipevo.getRcategory()) %>" readonly />
						</td>
					</tr>
					<tr> <%  // 음식 재료 %>
						<td id="rjeryo">재료</td>
						<td>
							<!-- input_text => 값을 담는 방식과 재료 종류를 설정해야함. -->
							<input type="text" id="rjeryo" name="rjeryo"
								   value="<%= recipevo.getRjeryo() %>" readonly />
						</td>
					</tr>
					<tr> <%  // 조리 시간 %>
						<td>시간</td>
						<td>
							<input type="text" id="rtime" name="rtime" 
								   value="<%= recipevo.getRtime() %>" readonly />
						</td>
					</tr>
					<tr> <%  // 인분 %>
						<td>인분</td>
						<td>
							<input type="text" id="rperson" name="rperson" 
								   value="<%= CodeUtils.getRperson(recipevo.getRperson()) %>" readonly />
						</td>
					</tr>
					<tr> <%  // 난이도: 쉬움(0), 보통(1), 어려움(2) %>
						<td>난이도</td>
						<td>
							<input type="text" id="rdiff" name="rdiff"
								   value="<%= CodeUtils.getRdiff(recipevo.getRdiff()) %>" readonly />
						</td>
					</tr>
<%  // 글 내용 %>
					<tr>
						<td>글 내용</td>
						<td>
							<textarea id="rcontent" name="rcontent" cols="10" rows="5" readonly><%= recipevo.getRcontent() %></textarea><br />
<%  // 음식 사진 %>
							<img src="/oneYo/img/recipe/<%= recipevo.getRphoto() %>" id="recipeImg" name="recipeImg" onerror="this.src='/oneYo/img/recipe/잔망루피.jpg'" />
							<input type="hidden" id="rphoto" name="rphoto" value="<%= recipevo.getRphoto() %>" />
						</td>
					</tr>
<%  // 글쓰기 버튼 %>
					<tr>
						<td colspan="2" style="text-align:right;">
							<input type="button" id="warningBtn" value="신고">
							<a class="btn" id="recipeUpdateFormBtn">수정</a>
							<a class="btn" id="recipeDeleteBtn">삭제</a>
						</td>
					</tr>
				</table>
				!!! <%= recipevo.getLikecnt() %> !!!
<% // rnum, rhit, mnum, warning, deleteyn, insertdate, updatedate %>
				<input type="hidden" id="rnum" name="rnum" value="<%= recipevo.getRnum() %>" />
				<input type="hidden" id="mnum" name="mnum" value="<%= recipevo.getMnum() %>" />
	<!-- 데이터 사용여부 검토 필요 -->
				<input type="hidden" id="rhit" name="rhit" value="<%= recipevo.getRhit() %>" />	<!-- 조회수 -->
				<!-- <input type="hidden" id="warning" name="warning" value="" /> -->	<!-- 경고 -->
				<!-- deleteyn 삭제 -->
				<!-- <input type="hidden" id="insertdate" name="insertdate" value="<%= recipevo.getInsertdate() %>" /> -->	<!-- 일간/주간/월간 -->
				<input type="hidden" id="updatedate" name="updatedate" value="<%= recipevo.getUpdatedate() %>" />	<!-- 작성(수정) 시간 -->
			</form>
			<jsp:include page="/WEB-INF/view/comment/commentForm.jsp" flush="true">
				<jsp:param name="cotnum" value="<%=recipevo.getRnum() %>"/>
			</jsp:include>
		</section>
	</body>
</html>