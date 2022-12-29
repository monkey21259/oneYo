<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="main.ict.common.O_Session" %>

<% Logger logger = LogManager.getLogger(this.getClass()); %>
<% logger.info(".jsp 진입"); %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	O_Session	oSession = O_Session.getInstance();
	String		mid = oSession.getSession(request);
	
	logger.info("mid: " + mid);
%>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<title>home.jsp</title>
		<!-- 칸 나눈 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/home/home.css">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		
			alert("[home.jsp] JS");
			$(document).ready(function() {
				
				alert("[home.jsp] jQuery");
				$(".favorPostTitle").on("click", function() {  // 타이틀 클릭
					postClick($(this));
				});
				
				$("#warningForm").click(function(){
					location.href="warningForm.ict";
				});
				
				// 로그인 / 로그아웃 / 회원가입 / 마이페이지 ----------
				$("#newMemBtn").on("click", function() {
					console.log("[회원가입] 버튼 클릭");
					location.href="/oneYo/memGrade.ict";
				});
				
				$("#loginBtn").on("click", function() {
					console.log("[로그인] 버튼 클릭");
					location.href="/oneYo/loginForm.ict";
				});
				
				// ------------------------------------------
				// 레시피 게시판 이동 (테스트) ---------------------
				$("#recipeSAllBtn").on("click", function() {
					console.log("[테스트] 레시피 게시판 이동");
					location.href="/oneYo/recipeSelectAll.ict";
// 					$("#recipeSAllForm").attr({
// 						"action": "/oneYo/recipeSelectAll.ict",
// 						"method": "GET",
// 						"enctype": "application/x-www-form-urlencoded"
// 					}).submit();
				});
				// ------------------------------------------
				
				
			});
			
			function postClick(obj) {
				
				// 동적으로 div 태그를 생성해야 함. >> 여기서 분기가 필요.
				let beforeV = $(".favorPost").attr("data-value");
				let afterV  = obj.attr("data-value");
				// data-value가 같을 경우 변화 없음.
				if (beforeV == afterV) {
					console.log("[SAME] " + beforeV);
					return false;
				}
				
				// data-value가 다른 경우 기존의 div 태그를 삭제하고,
				$(".p1").detach();
				$(".p2").detach();
				$(".favorPost").attr("data-value", afterV);
								
				let dataNum = obj.attr("data-num");  // 4 || 8
				if (dataNum == 4) {  // p1 -> 그림
					for (let i=0; i<dataNum; i++) {
						let $div = $("<div>");
						$div.attr("class", "p1");
						$div.text(i);
						$(".favorPost").append($div);
					}
				} else if (dataNum == 8) {  // p2 -> 글
					for (let i=0; i<dataNum; i++) {
						let $div = $("<div>");
						$div.attr("class", "p2");
						$div.text(i);
						$(".favorPost").append($div);
					}
				}
				
				
			}
		
		</script>
	</head>
<body>
<button id="warningForm">신고</button>
<!--			all_div		-->
<!--	┌─────────────────┐	-->
<!--	│      header 	  │	-->
<!--	├─────┬─────┬─────┤	-->
<!--	│  l  │  c  │  r  │	-->
<!--	│  e  │  e  │  i  │	-->
<!--	│  f  │  n  │  g  │	-->
<!--	│  t  │  t  │  h  │	-->
<!--	│     │  e  │  t  │	-->
<!--	│     │  r  │ 	  │	-->
<!--	├─────┴─────┴─────┤	-->
<!--	│    footer	 	  │	-->
<!--	└─────────────────┘	-->

<div id="all_div">

<div id="header">
머리부분
</div>

<div id="left">
좌측
</div>

	<div id="center">
	<!-- 
	1. (후순위) 첫째 라인: 배너
	2. 둘째 라인: 레시피 / 전문가 / 커뮤니티 / 공지사항 >> 클릭 시 각 인기글을 확인 할 수 있도록 UI 구성
	3. 셋째 라인: 쉐프소개 >> 각 쉐프의 프로필 사진이 노출되어 있고, 클릭 시 쉐프가 작성한 글을 확인할 수 있는 페이지로 이동함.
	4. 넷째 라인: 레시피 분류 >> 한식,중식,양식,일식,디저트, 기타- 00,01,02,03,04,99(기타)
	5. 다섯째 라인: footer >> 사이트 개발자 및 팀소개 / 회원가입 수, 레시피 수, 전문가 팁 수, 커뮤니티 수 표시
	 -->
	 	<div class="banner">
	 	배너 영역. (실례합니다. 로그인 테스트좀...)
<%
		if (mid == null || mid.equals("")) {
%>
			<button class="Choonsik" id="newMemBtn" name="newMemBtn">회원가입</button>
	 		<button class="Choonsik" id="loginBtn" name="loginBtn">로그인</button>
<%
		} else {
%>
			<span><%= mid %>님 환영합니다.</span>
			<button class="Choonsik" id="#" name="#" onclick="javascript:alert('준비중입니다.');">마이페이지</button>
	 		<button class="Choonsik" id="#" name="#" onclick="javascript:alert('준비중입니다.');">로그아웃</button>
	 		<br /><b>임시용 레시피버튼</b>
<!-- 	 		<form id="recipeSAllForm"> -->
<%-- 	 			<input type="hidden" id="mid" name="mid" value="<%= mid %>" /> --%>
<!-- 	 		</form> -->
	 		<input type="button" id="recipeSAllBtn" name="recipeSAllBtn" value="레시피 게시판 가기" /><br />
<% 		
		}
%>
	 	</div>
	 	<div class="favorContainer">
	 		<div class="postTitles">
			 	<div class="favorPostTitle" data-value="recipe" data-num="4">
			 		<span>레시피</span>
			 	</div>
			 	<div class="favorPostTitle" data-value="expert" data-num="4">
			 		<span>전문가</span>
			 	</div>
			 	<div class="favorPostTitle" data-value="community" data-num="8">
			 		<span>커뮤니티</span>
			 	</div>
			 	<div class="favorPostTitle" data-value="notice" data-num="8">
			 		<span>공지사항</span>
			 	</div>
		 	</div>
	 		<div class="favorPost" data-value="recipe">
	 			<!-- 초기값 : recipe 4개 화면 -->
	 			<!-- 동적으로 변화하는 값 : 누른 값에 따라 개수가 달라짐 >> 4개 or 8개 -->
	 			<div class="p1">
	 				A (초기값)
	 			</div>
	 			<div class="p1">
	 				B (초기값)
	 			</div>
	 			<div class="p1">
	 				C (초기값)
	 			</div>
	 			<div class="p1">
	 				D (초기값)
	 			</div>
	 		</div>
		 </div>
		 <div class="chefInfo">
		 	<div class="chefTop">
		 		<span style="position:relative;left:5%;">쉐프 소개</span>
		 		<span style="position:relative;left:75%;">더 보기</span>
		 	</div>
		 	<div class="chefBody">
		 	<%
		 		for (int i=0; i<10; i++) {
		 	%>
		 		<div class="chefIcon"></div>
		 	<%	
		 		}
		 	%>
		 	</div>
		 </div>
		 <div class="recipeInfo">
			<div class="recipeTop">
		 		<span style="position:relative;left:5%;">레시피 분류</span>
		 		<span style="position:relative;left:73%;">더 보기</span>
			</div>
			<div class="recipeBody">
		 	<%
		 		for (int i=0; i<10; i++) {
		 	%>
		 		<div class="recipeIcon"></div>
		 	<%	
		 		}
		 	%>
		 </div>
	</div>
</div>

<div id="right">
우측
</div>

<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
		<span>팀 소개: ~~~</span>
	</div>
	<div>
		<span>회원 수: </span> / <span>레시피글 수: </span><br />
		<span>전문가팁글 수: </span> / <span>커뮤니티글 수: </span><br />
	</div>
</div>

</div>
</body>
</html>