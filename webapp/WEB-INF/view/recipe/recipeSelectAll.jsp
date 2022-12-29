<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="java.util.List" %>

<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% Logger logger = LogManager.getLogger(this.getClass()); %>

<%
	O_Session oSession = O_Session.getInstance();
	String mid = oSession.getSession(request);
	logger.info("mid: " + mid);
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>recipeSelectAll.jsp</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		
			console.log("[recipeSelectAll.jsp] JS");
			$(document).ready(function() {
				
				console.log("[recipeSelectAll.jsp] jQuery");
				$(".recipes").on("click", function() {
					
					console.log("[click] recipes");
					
					var recipeInfos = $(this).siblings();
					var rnum = recipeInfos[0].value;
					var mnum = recipeInfos[1].value;
					
					$("#rnum").val(rnum);
					$("#mnum").val(mnum);
					
					$("#recipeInsertForm").attr({
						"action": "/oneYo/recipeSelectContent.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
			});
		
		</script>
		<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipe_selectAll.css">
	</head>
	<body>
		<% logger.info("[recipeSelectAll.jsp] .jsp 진입"); %>
<!--  -->
		<header></header>
<!--  -->
		<nav></nav>
<!--  -->
		<aside></aside>
<!-- Section -->		
		<section>
			<div class="recipeSectionHeader">
				<span class="t">레시피(Recipe) 게시판</span>
			</div>
			<div class="recipeCategory">
				<!-- (조건 검색) 카테고리 넣는 공간 -->
				카테고리 넣는 공간
			</div>
			<div class="recipeSearchBtnDiv">
				<!-- 카테고리 조건 검색 -->
				<a class="recipeSearchBtn" href="javascript:void(0);">검색</a>
			</div>
			<div class="recipeSearchPeriodContainer">
				<div class="t">
					<a href="javascript:void(0);">
						<span>&nbsp;일간&nbsp;</span>
					</a>/
				</div>
				<div class="t">
					<a href="javascript:void(0);">
						<span>&nbsp;주간&nbsp;</span>
					</a>/
				</div>
				<div class="t">
					<a href="javascript:void(0);">
						<span>&nbsp;월간&nbsp;</span>
					</a>/
				</div>
				<div class="t">&nbsp;인기글</div>
				<div class="tright">
					<a href="/oneYo/recipeInsertForm.ict">
						<span>글 등록 버튼</span>
					</a>
				</div>
			</div>
<%
			Object pagingObj = request.getAttribute("pagingVO");
			if (pagingObj == null) {
				logger.info("[FAIL] getAttribute -> pagingObj is null");
			}
			RecipeVO pagingVO = (RecipeVO)pagingObj;
			int pageSize = Integer.parseInt(pagingVO.getPageSize());
			int groupSize = Integer.parseInt(pagingVO.getGroupSize());
			int curPage = Integer.parseInt(pagingVO.getCurPage());
			int totalCount = 0;
			
			Object recipeObj = request.getAttribute("recipeList");
			if (recipeObj == null) {
				logger.info("[FAIL] getAttribute -> recipeObj is null");
			}
			
			List<RecipeVO> recipeList = (List<RecipeVO>)recipeObj;
			if (recipeList.size() < 1) {
				logger.info("[FAIL] Type Casting -> recipeList.size() < 1");
			}
			
			int rTotalHeight = 308 * (recipeList.size() / 4 + 1);
// 			logger.info(recipeList.size());
%>
				<form id="recipeInsertForm">
					<div class="recipeSection" style="height:<%= rTotalHeight %>px"> <!-- loop -->
<%
					RecipeVO recipevo = null;
	 				for (int i=0; i<recipeList.size(); i++) {
	 					recipevo = recipeList.get(i);
	 					
	 					totalCount = Integer.parseInt(recipevo.getTotalCount());
%>
						<a href="javascript:void(0);">  <!-- 클릭 시 해당 내용이 있는 Content로 이동 -->
							<div class="recipes">
								<div style="margin:10%;height:77%;">
									<%= recipevo.getRsubject() %>
								</div>
							</div>
							<input type="hidden" class="rnum" value="<%= recipevo.getRnum() %>" />
							<input type="hidden" class="mnum" value="<%= recipevo.getMnum() %>" />
						</a>
<%
						if (i % 4 == 0 && i > 0) {
%>
							<br />
<%
						}
	 				}
%>
						<input type="hidden" id="rnum" name="rnum" value="<%= recipevo.getRnum() %>" />
						<input type="hidden" id="mnum" name="mnum" value="<%= recipevo.getMnum() %>" />
					</div>
					<jsp:include page="/WEB-INF/view/paging/paging.jsp" flush="true">
							<jsp:param value="recipeSelectAll.ict" name="url"/>
								<jsp:param value="" name="str"/>
								<jsp:param value="<%=pageSize %>" name="pageSize"/>
								<jsp:param value="<%=groupSize %>" name="groupSize"/>
								<jsp:param value="<%=curPage %>" name="curPage"/>
								<jsp:param value="<%=totalCount %>" name="totalCount"/>
						</jsp:include>
				</form>
		</section>
	</body>
</html>