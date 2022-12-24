<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<title>레시피 등록 페이지</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		
// 			alert("[recipeInsertForm.jsp] JS");
			$(document).ready(function() {
				
// 				alert("[recipeInsertForm.jsp] jQuery");
				$("#recipeInsertBtn").on("click", function() {
					alert("recipeInsertBtn >>> Click");
					
					// validation code area
					
					//
					$("#recipeInsertForm").attr({
						"action": "/oneYo/recipeInsert.ict",
						"method": "POST",
						"enctype": "multipart/form-data"
					}).submit();
				});
			});
		
		</script>
		<style type="text/css">
		
			.recipeTable tr, .recipeTable td {
				border: 1px solid black;
			}
		
		</style>
	</head>
	<body>
		<header>
			<!-- 로고 / 로그아웃 / 마이페이지 -->
		</header>
		<nav>
			<!-- 붙박이검색란(좀 더 디테일한 정의가 필요할듯) -->
		</nav>
		<aside>
			<!-- 우상단에 sticky 달릴 링크들 -->
		</aside>
		<section>
			<form id="recipeInsertForm">
				<table class="recipeTable">
					<tr>
						<td colspan="2">
							<span>레시피 글쓰기</span>
						</td>
					</tr>
<%  // 글 제목 %>
					<tr>
						<td>글 제목</td>
						<td>
							<input type="text" id="rsubject" name="rsubject" value="" placeholder="제목 입력란" />
						</td>
					</tr>
<%  // 요리 분야 %>
					<tr>
						<td>요리 분야</td>
						<td>
							<select id="rcategory" name="rcategory">
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
							<input type="text" id="rjeryo" name="rjeryo" value="" placeholder="재료를 입력하세요." />
						</td>
					</tr>
<%  // 조리 시간 %>
					<tr>
						<td>시간</td>
						<td>
							<select id="rhour" name="rhour" >
								<option value="00" selected>00</option>
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
							<select id="rminute" name="rminute" >
								<option value="00" selected>00</option>
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
								<option value="01" selected>1인분</option>
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
							<textarea id="rcontent" name="rcontent" cols="10" rows="5">내용을 입력하세요.
							</textarea><br />
<%  // 음식 사진 %>
							<input type="file" id="rphoto" name="rphoto" />
						</td>
					</tr>
<%  // 글쓰기 버튼 %>
					<tr>
						<td colspan="2" style="text-align:right;">
							<a id="recipeInsertBtn">글쓰기</a>
						</td>
					</tr>
				</table>
			</form>
		</section>
		<footer>
			<!-- 하단바 -->
		</footer>
	</body>
</html>