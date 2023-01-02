<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="main.ict.common.O_Session" %>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.tip.vo.TipVO" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>
<%@ page import="main.ict.notice.vo.NoticeVO" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% Logger logger = LogManager.getLogger(this.getClass()); %>
<% logger.info(".jsp 진입"); %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	O_Session	oSession = O_Session.getInstance();
	String		mid = oSession.getSession(request);
	
	logger.info("mid: " + mid);
%>
<%
	//. ★ NULL일 때, HomeController에서 값을 안받아오므로 Validation 때 처리 필요 ★
// 	Map<String, Object> dataMap = (Map<String, Object>)request.getAttribute("DataMap");
	
// 	List<RecipeVO> recipeList = (List<RecipeVO>)dataMap.get("RecipeList");
// 	List<TipVO> tipList = (List<TipVO>)dataMap.get("TipList");
// 	List<CommunityVO> communityList = (List<CommunityVO>)dataMap.get("CommunityList");
// 	List<NoticeVO> noticeList = (List<NoticeVO>)dataMap.get("NoticeList");
// 	logger.info(recipeList.size());		// 4
// 	logger.info(tipList.size());		// 4
// 	logger.info(communityList.size());	// 8
// 	logger.info(noticeList.size());		// 1
%>

<c:set var="RecipeList" value="${ DataMap['RecipeList'] }" />
<c:set var="TipList" value="${ DataMap['TipList'] }" />
<c:set var="CommunityList" value="${ DataMap['CommunityList'] }" />
<c:set var="NoticeList" value="${ DataMap['NoticeList'] }" />

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

				// 게시글 관련 ---------------------------------
				$(".favorPostTitle").on("click", function() {  // 타이틀 클릭
					postClick($(this));
				});
				
				$('.pa').on("click", function() {  // 게시글 클릭 시
// 					alert($(this).attr('data-value'));  // 게시글의 고유번호
					
				});
				// ------------------------------------------
				
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
				});
				// ------------------------------------------
				
				//	검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
				
			});
			
			function postClick(obj) {  // favorPostTitle
				
				let before_num = $(".postTitles").attr('data-num');
				let after_num = obj.attr("data-num");  // 1 ~ 4
				
				if (before_num == after_num) {
					console.log("동일한 카테고리입니다.");
					return false;
				}
				
				// 값 갱신
				$(".postTitles").attr('data-num', after_num);

				// 클릭한 것에 해당하는 게시판 글 z-index 변경하기.
				$(".favorPost").each(function(i, elem) {
// 					console.log($(elem).attr("data-value"));
// 					console.log($(obj).attr("data-value"));
					if ($(elem).attr("data-value") == $(obj).attr("data-value")) {
						$(elem).css("z-index", 1);
					} else {
						$(elem).css("z-index", 0);
					}
				});
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
	<div id="warningForm">
	신고
	</div>
	
	<div class="searchBarBtn">
	검색
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

<div id="all_div">

<div id="header">
	<div id="logoLeft" class="logoSide">
	로고 옆공간 좌측
	</div>
	<div id="logoCenter">
		<a href="home.ict">
			<div id="logo">
			<img alt="오내요" src="/oneYo/resource/img/oneYo_logo.png">
			<!-- 379 X 186 -->
			</div>
		</a>
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
	
	<hr>
	
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
	
	<hr>
</div>

<div id="left">
좌측
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
	 		<div class="postTitles" data-num="1">
			 	<div class="favorPostTitle" data-value="recipe" data-num="1">
			 		<span>레시피</span>
			 	</div>
			 	<div class="favorPostTitle" data-value="expert" data-num="2">
			 		<span>전문가</span>
			 	</div>
			 	<div class="favorPostTitle" data-value="community" data-num="3">
			 		<span>커뮤니티</span>
			 	</div>
			 	<div class="favorPostTitle" data-value="notice" data-num="4">
			 		<span>공지사항</span>
			 	</div>
		 	</div>
	 		<div class="favorPost favorPost1" data-value="recipe">
	 			<c:forEach items="${ RecipeList }" var="rvo">
					<a class="pa" data-value="${ rvo.rnum }">
						<div class="p1">
							<img class="p11" src="/oneYo/img/recipe/${ rvo.rphoto }" />
							<div class="psubj pcom">${ rvo.rsubject }</div><br />
							<div class="pcom">조회수: ${ rvo.rhit }</div>
							<div class="pcom">추천수: ${ rvo.likecnt }</div>				
						</div>
					</a>
				</c:forEach>
	 		</div>
	 		<div class="favorPost favorPost2" data-value="expert">
	 			<c:forEach items="${ TipList }" var="tvo">
					<a class="pa" data-value="${ tvo.tnum }">
						<div class="p1">
							<img class="p11" src="/oneYo/img/tip/${ tvo.tphoto }" />
							<div class="psubj pcom">${ tvo.tsubject }</div><br />
							<div class="pcom">조회수: ${ tvo.thit }</div>
							<div class="pcom">추천수: ${ tvo.likecnt }</div>				
						</div>
					</a>
				</c:forEach>
	 		</div>
	 		<div class="favorPost favorPost3" data-value="community">
	 			<c:forEach items="${ CommunityList }" var="cvo">
					<a class="pa" data-value="${ cvo.cnum }">
						<div class="p2">
							<%-- 테이블로 구성하는게 나을듯 --%>
							<div class="psubj2">글제목: ${ cvo.csubject }</div>
							<div class="psubj2 pcont">글내용: ${ cvo.ccontent }</div>
							<div class="psubj2">조회수: ${ cvo.chit }</div>
							<div class="psubj2">추천수: ${ cvo.likecnt }</div>				
							<div class="psubj2 pins">등록일: ${ cvo.insertdate }</div>				
						</div>
					</a>
				</c:forEach>
	 		</div>
	 		<div class="favorPost favorPost4" data-value="notice">
	 			<c:forEach items="${ NoticeList }" var="nvo">
					<a class="pa" data-value="${ nvo.nnum }">
						<div class="p2">
							<%-- 테이블로 구성하는게 나을듯 --%>
							<div class="psubj2">글제목: ${ nvo.nsubject }</div>
							<div class="psubj2 pcont">글내용: ${ nvo.ncontent }</div>
							<div class="psubj2">조회수: ${ nvo.nhit }</div>
							<div class="psubj2">추천수: ${ nvo.likecnt }</div>				
							<div class="psubj2 pins">등록일: ${ nvo.insertdate }</div>		
						</div>
					</a>
				</c:forEach>
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