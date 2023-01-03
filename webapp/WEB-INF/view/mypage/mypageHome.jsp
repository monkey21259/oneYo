<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="main.ict.common.O_Session" %>

<%
request.setCharacterEncoding("UTF-8"); 
Logger logger = LogManager.getLogger(this.getClass());
logger.info("mypageHome.jsp 페이지 진입");

//세션부여
	O_Session mSession = O_Session.getInstance();
	String mnum = mSession.getSession(request);
	logger.info("mnum >>> : " + mnum);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>

<!-- jQuery -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>

<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">

<!-- myPageHome.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/mypage/myPageHome.css">

	<script type="text/javascript">

	$(document).ready(function(){
		console.log("mypageHome.jsp 페이지 제이쿼리 ready() 진입");
		
		//	검색 바 없어졌다 생기기 액션주는 all.js 함수
		hiddenAction();
		//	홈으로 보내주는 all.js 함수
		homeAction();
		//	메뉴바 클릭액션 all.js 함수
		divClickAction();
		
	});
	
	function profileModify(mnum){
		alert("프로필 영역 클릭");
		alert("mnum : " + mnum);
		// mnum 현재 상수 : 'M202212260012'
		location.href="mypagePWChk.ict?mnum=" + mnum;
	}
	
	function levelup(mnum){
		alert("등업 버튼 클릭");
		alert("mnum : " + mnum);
		location.href = "levelupSelectAll.ict?mnum=" + mnum;
	}
	
	function recipeSelect(rnum){
		alert("레시피 글 클릭");
		alert("rnum : " + rnum);
		location.href = "recipeSelectContent.ict?rnum=" + rnum;
	}
	
	function communitySelect(cnum){
		alert("커뮤니티 글 클릭");
		alert("cnum : " + cnum);
		location.href = "communitySelectContent.ict?cnum=" + cnum;
	}
	
	function tipSelect(tnum){
		alert("전문가 팁 글 클릭");
		alert("tnum : " + tnum);
		location.href = "tipSelectContent.ict?tnum=" + tnum;
	}

</script>
</head>
<body>
<form id="myPageHome">
<div id="realAll">

<div id="backMenu"></div>

<div id="sideBar">
	<label for="sideMenu"><div>▼<br>▽<br>▼</div></label>
	<input type="checkbox" id="sideMenu" name="sideMenu" hidden>
	<ul>
		<li class="item">
			<div class="homeLink">
			홈으로
			</div>
		</li>
		<li class="item">
			<div class="searchBarBtn">
			검색
			</div>
		</li>
		<li class="item">
			<div id="warningForm">
			신고
			</div>
		</li>
		<li class="item">
			<div class="warningForm">
			신고<br>팝업
			</div>
		</li>
		<li class="item">
			<div class="searchBarBtn">
			my<br>Page
			</div>
		</li>
		<li class="item">
			<a href="javascript:window.scrollTo(0,0);">
			<div id="go_top">
			TOP▲
			</div>
			</a>
		</li>
	</ul>
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
<!-- 	로고 옆공간 좌측 -->
	</div>
	<div id="logo" class="homeLink">
		<img alt="오내요" src="/oneYo/resource/img/oneYo_logo.png">
		<!-- 379 X 186 -->
	</div>
	<div id="logoRight" class="logoSide">
<!-- 	로고 옆공간 우측 -->
	 	<div id="loginDiv">
<%
// 		if (mnick == null || mnick.equals("")) {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">:</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
<%
// 		} else {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="#" onclick="javascript:alert('준비중입니다.');">마이페이지</span>
				<span class="Choonsik">:</span>
		 		<span class="Choonsik" id="logoutBtn">로그아웃</span>
<%-- 				<p><%= mnick %> <span>님 환영합니다.</span></p> --%>
	 		</div>
	 		<p></p>
	 		<form id="logoutForm">
<%-- 	 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" /> --%>
	 		</form>
<% 		
// 		}
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
<!-- -------------------------------페이지 전용 center------------------------------- -->

	<div id="container" style="text-align:center;">
	<c:set var="mnum" value="${mList.get(0).getMnum()}" />
		<div id="profile_div" onclick="profileModify('${mnum}')" style="border:1px solid black; float:left;">
			<c:forEach items="${mList}" var="mvo">
				<span id="mnum" style="display:none">
				${mvo.mnum}
				</span>
				<br />
				<span id="mnick" style="border:1px solid black;">
				${mvo.mnick}
				</span>
				<br />
				<img src="/oneYo/img/mem/${mvo.mprofile}" style="width:50px; height:50px; margin-top:3px;">
				<br />
				<c:choose>
					<c:when test="${mvo.mgrade eq '0'}"> 
						<span id="mgrade" style="border:1px solid black;">
						일반 등급
						</span>
					</c:when>
					<c:when test="${mvo.mgrade eq '1'}"> 
						<span id="mgrade" style="border:1px solid black;">
						전문가 등급
						</span>
					</c:when>
				</c:choose>
				<!-- 관리자 등급 추가하기!!!!!!! -->
				<br />
			</c:forEach>
		</div>
		<div id="community_div" style="display:inline-block; float:left; margin-left:10px; border:1px solid black;">
			<c:forEach items="${cList}" var="cvo">
				<div style="border:1px solid black;" onclick="communitySelect('${cvo.cnum}')">
					<br />
					${cvo.cnum}
					<br />
					${cvo.csubject}
					<br />
					${cvo.ccontent}
					<br />
					${cvo.chit}
					<br />
					${cvo.insertdate}
					<br />
				</div>
			</c:forEach>
		</div>
		<div id="recipe_div" style="display:inline-block; float:left; margin-left:10px; border:1px solid black;">
			<c:forEach items="${rList}" var="rvo">
				<div style="border:1px solid black;" onclick="recipeSelect('${rvo.rnum}')">
					<br />
					${rvo.rnum}
					<br />
					${rvo.rsubject}
					<br />
					${rvo.rcontent}
					<br />
					${rvo.insertdate}
					<br />
				</div>
			</c:forEach>
		</div>
		<div id="tip_div" style="display:inline-block; float:left; margin-left:10px; border:1px solid black;">
			<c:forEach items="${tList}" var="tvo">
				<div style="border:1px solid black;" onclick="tipSelect('${tvo.tnum}')">
					<br />
					${tvo.tnum}
					<br />
					${tvo.tsubject}
					<br />
					${tvo.tcontent}
					<br />
					${tvo.insertdate}
					<br />
				</div>
			</c:forEach>
		</div>
		<div>
			<button type="button" onclick="levelup('${mnum}')">등업 목록</button>
		</div>
	</div>	

<!-- -------------------------------페이지 전용 center------------------------------- -->
</div>

 <div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
		<span>팀 소개: ~~~</span>
	</div>
	<div>
		<span>회원 수: ${ Count.get(0).membercnt }명</span> / <span>레시피글 수: ${ Count.get(0).recipecnt }개</span><br />
		<span>전문가팁글 수: ${ Count.get(0).tipcnt }개</span> / <span>커뮤니티글 수: ${ Count.get(0).communitycnt }개</span><br />
	</div>
</div>

</div>
</div>
		</form>
	</body>
</html>	