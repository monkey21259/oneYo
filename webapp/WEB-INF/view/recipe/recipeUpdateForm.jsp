<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.common.CodeUtils" %>

<% Logger logger = LogManager.getLogger(this.getClass()); %>
<%
		Object recipeObj = request.getAttribute("recipevo");
		if (recipeObj == null) {
			logger.info("[FAIL] getAttribute -> recipeObj is null");
		}
		RecipeVO recipevo = (RecipeVO)recipeObj;
		logger.info(recipevo.toString());
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
				
				// Setting --------------------------------------------------------------
				
				/* 음식 카테고리 */ // 기타
				var rcategory = "<%= CodeUtils.getRcategoryVal(recipevo.getRcategory()) %>";
				$("#rcategory option[value='" + rcategory + "']").prop('selected', true);
				
				/* 조리 시간 */ // 00시 10분
				var rhour, rminute;
				if ("<%= recipevo.getRtime() %>".includes("시")) {  /* 시간이 포함된 경우 */
					rhour = "<%= recipevo.getRtime() %>".split('시')[0];
					$("#rhour option[value='" + rhour + "']").prop('selected', true);
				}
				if (rhour === undefined) {
					rminute = "<%= recipevo.getRtime() %>".split('분')[0].trim();
				} else {
					rminute = "<%= recipevo.getRtime() %>".split('시')[1]
														  .split('분')[0]
														  .trim();
				}
				$("#rminute option[value='" + rminute + "']").prop('selected', true);
				
				/* 인분 */ // 2인분
				var rperson = "<%= recipevo.getRperson() %>".split("인분")[0];
				if (rperson != "10") {
					rperson = "0" + rperson;
				}
				$("#rperson option[value='" + rperson + "']").prop('selected', true);
				
				/* 난이도 */
				var rdiff = "<%= CodeUtils.getRdiffVal(recipevo.getRdiff()) %>";
				$("#rdiff option[value='" + rdiff + "']").prop('selected', true);
				
				// Setting END ---------------------------------------------------------
				
				// Update
				$("#recipeUpdateBtn").on("click", function() {
					
					console.log("[Click] UpdateForm Button");
					
					// rtime Setting
// 					console.log($("#rhour option:selected").val());
// 					console.log($("#rminute option:selected").val());
					let rtime = "";
					rtime += $("#rhour option:selected").val();
					rtime += "시 "
					rtime += $("#rminute option:selected").val();
					rtime += "분"
					$("#rtime").val(rtime);
					
					// 사진 변경 여부에 따른 분기 처리
					// 일단은 POST로 전달하는걸로 (기존 rphoto 보내는쪽으로)
					$("#recipeUpdateForm").attr({
						"action": "/oneYo/recipeUpdate.ict",
						"method": "POST",
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
		<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipe_updateForm.css">
	</head>
	<body>
	<% logger.info("[recipeUpdateForm.jsp] .jsp 진입"); %>
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
				<span class="t">레시피(Recipe) 글 수정 페이지</span>
			</div>
			<form id="recipeUpdateForm">
				<table class="recipeTable">
					<tr>
						<td colspan="2" style="text-align:center;">
							<span>레시피 글 수정하기</span>
						</td>
					</tr>
<%  // 글 제목 %>
					<tr>
						<td>글 제목</td>
						<td>
							<input type="text" id="rsubject" name="rsubject"
								   value="<%= recipevo.getRsubject() %>" />
						</td>
					</tr>
<%  // 요리 분야 %>
					<tr>
						<td>요리 분야</td>
						<td>
							<select class="rcategory" id="rcategory" name="rcategory">
								<option value="00">한식</option>
								<option value="01">중식</option>
								<option value="02">양식</option>
								<option value="03">일식</option>
								<option value="04">디저트</option>
								<option value="99">기타</option>
							</select>
						</td>
					</tr>
<%  // 음식 재료 %>
					<tr>
						<td id="rjeryo">재료</td>
						<td>
							<!-- input_text => 값을 담는 방식과 재료 종류를 설정해야함. -->
							<input type="text" id="rjeryo" name="rjeryo"
								   value="<%= recipevo.getRjeryo() %>" />
						</td>
					</tr>
<%  // 조리 시간 %>
					<tr>
						<td>시간</td>
						<td>
							<select id="rhour" name="rhour">
								<option value="00">00</option>
<%	// ---- 시(0 ~ 23)
							String hour = null;
							for (int i=1; i<24; i++) {
								hour = "";
								if (i < 10) { hour += "0"; }
								hour += i;
%>
								<option value=<%= hour %>><%= hour %></option>
<%
							}
%>							</select>&nbsp;시&nbsp;
							<select id="rminute" name="rminute">
								<option value="00">00</option>
<%	// ---- 분(0 ~ 59)
							String minute = null;
							for (int i=1; i<60; i++) {
								minute = "";
								if (i < 10) { minute += "0"; }
								minute += i;
%>								
								<option value=<%= minute %>><%= minute %></option>
<%							
							}
%>							</select>&nbsp;분&nbsp;
						</td>
					</tr>
					<tr>
						<td>인분</td>
						<td>
							<select id="rperson" name="rperson">
								<option value="01">1인분</option>
<%  // ---- 몇 인분(max=10)
							String rPerson = null;
							for (int i=2; i<11; i++) {
								rPerson = "";
								if (i < 10) { rPerson += "0"; }
								rPerson += i;
%>
								<option value=<%= rPerson %>><%= i %>인분</option>
<%
							}
%>							</select>
						</td>
					</tr>
<%  // 난이도: 쉬움(0), 보통(1), 어려움(2) %>
					<tr>
						<td>난이도</td>
						<td>
							<select id="rdiff" name="rdiff">
								<option value="0">쉬움</option>
								<option value="1">보통</option>
								<option value="2">어려움</option>
							</select>
						</td>
					</tr>
<%  // 글 내용 %>
					<tr>
						<td>글 내용</td>
						<td>
							<textarea id="rcontent" name="rcontent" cols="10" rows="5"><%= recipevo.getRcontent() %></textarea><br />
<%  // 음식 사진 %>
							<img src="/oneYo/img/recipe/<%= recipevo.getRphoto() %>" id="recipeImg" name="recipeImg" onerror="this.src='/oneYo/img/recipe/잔망루피.jpg'" />
						<!-- 사진 변경 시 Ajax(+ 태그 값 변경) >>> input type="file" 추가해서 로직 작성 필요 -->
							<input type="hidden" id="rphoto" name="rphoto" value="<%= recipevo.getRphoto() %>" />
						</td>
					</tr>
<%  // 글쓰기 버튼 %>
					<tr>
						<td colspan="2" style="text-align:right;">
							<a class="btn" id="recipeUpdateBtn">수정완료</a>
						</td>
					</tr>
				</table>
<% // Other Settings %>
				<input type="hidden" id="rnum" name="rnum" value="<%= recipevo.getRnum() %>" />
				<input type="hidden" id="rtime" name="rtime" value="" />
				<input type="hidden" id="mnum" name="mnum" value="<%= recipevo.getMnum() %>" />
			</form>
		</section>
	</body>
</html>