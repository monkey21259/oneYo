<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<!-- [221230] 반응형 페이지 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes" />
		<title>home.jsp</title>
		<!-- 칸 나눈 css -->
		
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		<!-- home 페이지 전용 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/home/home.css">
		<!-- jQuery -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
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
				
				$("#logoutBtn").on("click", function() {
					console.log("[로그아웃] 버튼 클릭");
					$("#logoutForm").attr({
						"action": "/oneYo/logout.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
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
				
				//	검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
				//	홈으로 보내주는 all.js 함수
				homeAction();
				//	메뉴바 클릭액션 all.js 함수
				divClickAction();
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

<div id="sideBar">
	
	<div class="homeLink">
	홈으로
	</div>
	
	<div class="searchBarBtn">
	검색
	</div>
	
	<div id="warningForm">
	신고
	</div>
	
	<div class="warningForm">
	신고<br>팝업
	</div>
	
	<div class="searchBarBtn">
	my<br>Page
	</div>
	
	<a href="javascript:window.scrollTo(0,0);">
	<div id="go_top">
	TOP▲
	</div>
	</a>
</div>

<div id="searchBar" class="hidden_X">
<!-- <div id="searchBar" class="hidden_O"> -->
	<div class="searchBarBtn">
		X
	</div>
	검색바 여기에 넣기
	<input type="text" id="searchText" name="serchText">
	<input type="button" id="searchTextBtn" value="검색">
</div>

<div id="singo" class="hidden_X">
	<div class="warningForm">
		X
	</div>
	신고 인클루드 이쪽으로
</div>

<div id="shadow" class="hidden_X"></div>

<div id="all_div">

<div id="header">
	<div id="logoLeft" class="logoSide">
	로고 옆공간 좌측
	</div>
	<div id="logo" class="homeLink">
		<img alt="오내요" src="/oneYo/resource/img/oneYo_logo.png">
		<!-- 379 X 186 -->
	</div>
	<div id="logoRight" class="logoSide">
	로고 옆공간 우측
	 	<div>
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
	 		<button class="Choonsik" id="logoutBtn" name="logoutBtn">로그아웃</button>
	 		<form id="logoutForm">
	 			<input type="hidden" id="mid" name="mid" value="<%= mid %>" />
	 		</form>
	 		<br /><b>임시용 레시피버튼</b>
	 		<input type="button" id="recipeSAllBtn" name="recipeSAllBtn" value="레시피 게시판 가기" /><br />
<% 		
		}
%>
	 	</div>
	</div>
	
	<div class="nav">
	<!-- 상단 메뉴바 -->
		<nav>
		<ul>
			<li>
				<a href="recipeSelectAll.ict" class="menu_link">
				<div>
				레시피
				</div>
				</a>
			</li>
			<li>
				<a href="tipSelectAll.ict" class="menu_link">
				<div>
				Tip
				</div>
				</a>
			</li>
			<li>
				<a href="communitySelectAll.ict" class="menu_link">
				<div>
				커뮤니티
				</div>
				</a>
			</li>
			<li>
				<a href="noticeSelectAll.ict" class="menu_link">
				<div>
				공지사항
				</div>
				</a>
			</li>
			<li>
				<a href="#" class="menu_link">
				<div>
				더보기
				</div>
				</a>
			</li>
		</ul>
		</nav>
	</div>
	
</div>

	<div id="center">
	<!-- 
	1. (후순위) 첫째 라인: 배너
	3. 셋째 라인: 쉐프소개 >> 각 쉐프의 프로필 사진이 노출되어 있고, 클릭 시 쉐프가 작성한 글을 확인할 수 있는 페이지로 이동함.
	4. 넷째 라인: 레시피 분류 >> 한식,중식,양식,일식,디저트, 기타- 00,01,02,03,04,99(기타)
	5. 다섯째 라인: footer >> 사이트 개발자 및 팀소개 / 회원가입 수, 레시피 수, 전문가 팁 수, 커뮤니티 수 표시
	 -->
	 	<div class="banner">
	 	<img src="/oneYo/resource/img/002.png">
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
<%-- 변수 선언 방법 --%>
	<c:set var="RecipeList" value="${DataMap['RecipeList']}" />
	<c:set var="TipList" value="${DataMap['TipList'] }" />
	<c:set var="CommunityList" value="${DataMap['CommunityList']}" />
	<c:set var="NoticeList" value="${DataMap['NoticeList']}" />
	<c:set var="MemberList" value="${DataMap['MemList']}" />
	<c:set var="Count" value="${DataMap['Count'].get(0)}" />
	
	<%-- 글자를 화면에 출력 --%>
	<c:out value="${RecipeList.get(0).rnum}" /><br>
	<c:out value="${TipList.get(0).tnum}" /><br>
	<c:out value="${CommunityList.get(0).cnum}" /><br>
	<c:out value="${NoticeList.get(0).nnum}" /><br><br>
	
	<%-- 회원, 레시피, 팁, 커뮤니티 Total Count  --%>
	<c:out value="총 회원 수 : ${Count.membercnt}명" /><br>
	<c:out value="커뮤니티 글 : ${Count.communitycnt}개" /><br>
	<c:out value="레시피 글 : ${Count.recipecnt}개" /><br>
	<c:out value="전문가팁  : ${Count.tipcnt}개" /><br><br>
	
	<%-- for 문 사용법 1 --%>
	<c:forEach items="${RecipeList}" var="rvo">
		<c:out value="${rvo.rnum}" /><br>
		<c:out value="${rvo.rsubject}" /><br>
		<img src="/oneYo/img/recipe/${rvo.rphoto}" style="width:50px; height:50px;"><br>
		<c:out value="조회수 : ${rvo.rhit}" /> &nbsp;&nbsp;&nbsp;
		<c:out value="추천수 : ${rvo.likecnt}" /><br><br>
	</c:forEach>
	
	<%-- for 문 사용법2 --%>
	<div>
		<table style="border:1px solid black;">
			<c:forEach items="${MemberList}" var="mvo">
				<tr style="border:1px solid black;">
					<td style="border:1px solid black;">
						<c:out value="${mvo.mnum}" />
					</td>
				</tr>
				<tr>
					<td>
						<img src="/oneYo/img/mem/${mvo.mprofile}">
					</td>
				</tr>
				<tr>
					<td>
						<c:out value="${mvo.mnick}" />
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>