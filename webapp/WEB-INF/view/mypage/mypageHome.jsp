<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Map" %>    
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="main.ict.common.O_Session" %>
<%@ page import="main.ict.home.vo.HomeVO" %>
<%@ page import="main.ict.mem.vo.MemVO" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
request.setCharacterEncoding("UTF-8"); 
Logger logger = LogManager.getLogger(this.getClass());
logger.info("mypageHome.jsp 페이지 진입");

//세션부여
	O_Session mSession = O_Session.getInstance();
	String mnum = mSession.getSession(request);
	String mid = (String)mSession.getAttribute(request, "mid");
	logger.info("mnum >>> : " + mnum);
	logger.info("mid >>> : " + mid);
%>

<c:set var="RecipeList" value="${ DataMap['RecipeList'] }" />
<c:set var="TipList" value="${ DataMap['TipList'] }" />
<c:set var="CommunityList" value="${ DataMap['CommunityList'] }" />
<c:set var="NoticeList" value="${ DataMap['NoticeList'] }" />
<c:set var="MemList" value="${ DataMap['MemList'] }" />
<c:set var="Count" value="${ DataMap['Count'] }" />

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

<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>

	<script type="text/javascript">

	$(document).ready(function(){
		console.log("mypageHome.jsp 페이지 제이쿼리 ready() 진입");
		
		$(document).on('click', '#levelupBtn', function(){
			
			let mnum = $("#mnum").val();
			console.log("mnum >>> : " + mnum);

			let url = "mgradeChk.ict";
			let reqType = "GET";
			let dataParam ={
				mnum : mnum,
			};
					
			$.ajax({
				url:url,
				type:reqType,
				data:dataParam,
				success:whenSuccess,
				error:whenError		
			}); //ajax
			
			//성공했을때
			function whenSuccess(resData){
				if(resData == '1'){
					alert("이미 등업신청 완료되었습니다.");
				} else{
					location.href = "levelupSelectAll.ict?mnum=" + mnum;
				}
			} //whenSuccess
			
		//실패했을때
			function whenError(e){
				console("등업신청 오류(error) : "  + e.responseText);
			} //whenError	
			
			
		});// levelupBtn
		
		$("#logoutBtn").on("click", function() {
			console.log("[로그아웃] 버튼 클릭");
			$("#logoutForm").attr({
				"action": "/oneYo/logout.ict",
				"method": "GET",
				"enctype": "application/x-www-form-urlencoded"
			}).submit();
		});
		
		
		//로그아웃
		$("#logoutBtn").on("click", function() {
			$("#logoutForm").attr({
				"action": "logout.ict",
				"method": "GET",
				"enctype": "application/x-www-form-urlencoded"
			}).submit();
		});
				
	//all.js 에 있는 모든 함수 연결
	allJavaScript();

		
		
	}); //ready
	
	function profileModify(mnum){
// 		alert("프로필 영역 클릭");
// 		alert("mnum : " + mnum);
		// mnum 현재 상수 : 'M202212260012'
		location.href="mypagePWChk.ict?mnum=" + mnum;
	}
	
// 	function levelup(mnum){
// 		alert("등업 버튼 클릭");
// 		alert("mnum : " + mnum);
// 		location.href = "levelupSelectAll.ict?mnum=" + mnum;
// 	}
	
	function recipeSelect(rnum){
// 		alert("레시피 글 클릭");
// 		alert("rnum : " + rnum);
		location.href = "recipeSelectContent.ict?rnum=" + rnum;
	}
	
	function communitySelect(cnum){
// 		alert("커뮤니티 글 클릭");
// 		alert("cnum : " + cnum);
		location.href = "communitySelectContent.ict?cnum=" + cnum;
	}
	
	function tipSelect(tnum){
// 		alert("전문가 팁 글 클릭");
// 		alert("tnum : " + tnum);
		location.href = "tipSelectContent.ict?tnum=" + tnum;
	}

</script>
</head>
<body>
<form id="myPageHome">
<div id="realAll">

<div id="backMenu"></div>
<input type="checkbox" id="sideMenu" name="sideMenu" hidden>
	<label for="sideMenu" id="sideLabel">&lt;&lt;&nbsp;&nbsp;&nbsp;</label>
	<div class="sidebar">
	<ul>
		<li class="item">
			<div class="homeLink">
			<span>
			홈으로
			</span>
			</div>
		</li>
		<li class="item">
			<div class="searchBarBtn">
			<span>
			검색
			</span>
			</div>
		</li>
<!-- 		<li class="item"> -->
<!-- 			<div id="warningForm"> -->
<!-- 			<span> -->
<!-- 			신고 -->
<!-- 			</span> -->
<!-- 			</div> -->
<!-- 		</li> -->
		<li class="item">
			<div class="warningForm">
			<span>
			신고<br>팝업
			</span>
			</div>
		</li>
		
		<li class="item">
	<%
		if(mid == null || !mid.equals("admin")){
	%>
			<div class="mypageHome">
			<span>
			마이<br>페이지 
			</span>
			</div>
			<%
		} else if(mid.equals("admin")){
			%>
			<div class="adminHome">
			<span>
			관리자<br>페이지 
			</span>
			</div>
			<%
		}
		%>
		</li>

		<li class="item">
			<a href="javascript:window.scrollTo(0,0);">
			<div id="go_top">
			<span>
			TOP▲
			</span>
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
	<jsp:include page="/WEB-INF/view/warning/warningPage.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>	
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
		if (mid == null || mid.equals("")) {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
<%
		} else {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik mypageHome">마이페이지</span>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="logoutBtn">로그아웃</span>
<%
			String mSNSid = mid;  // M22...
			if (mid != null && !(mid.equals(""))) {
				if (mid.length() > 5) {
					String checkSNS = mid.substring(0, 6);
					if (checkSNS.equals("naver_")) {
						mSNSid = "naver"; 
					}
					if (checkSNS.equals("kakao_")) {
						mSNSid = "kakao";
					}
				}
			}
%>
				<p><%= mSNSid %> <span>님 환영합니다.</span></p>
	 		</div>
	 		<p></p>
	 	
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
<!-- -------------------------------페이지 전용 center------------------------------- -->

	<div id="container" style="text-align:center;">
	<c:set var="mnum" value="${mList.get(0).getMnum()}" />
	<input type="hidden" id="mnum" value="${mList.get(0).getMnum()}" />
		<div id="profile_div" style="display:table; margin:auto; width:80%;">
			<div style="display:flex; align-items:center; line-height:80%;">
				<c:forEach items="${mList}" var="mvo">
					<span id="mnum" style="display:none">
						${mvo.mnum}
					</span>
					<div style="display:inline-block; text-align:center;">
						<img src="/oneYo/img/mem/${mvo.mprofile}" onclick="profileModify('${mnum}')" onerror="this.src='/oneYo/resource/img/grade0.png'" >
					</div>
					<div style="display:inline-block; text-align:left; width: 360px;">
						<div style="display:inline-block; padding-left:15px;">
							<b>닉네임</b><br><br>
							<b>등&nbsp;&nbsp;&nbsp;급</b><br><br>
							<b>가입일</b>
						</div>
						<div style="display:inline-block; padding-left:8px;">
							<span id="mnick">
								${mvo.mnick}
							</span>
							<br><br>
							<c:choose>
								<c:when test="${mvo.mgrade eq '0'}"> 
									<span id="mgrade">
									일반 회원
									</span>
								</c:when>
								<c:when test="${mvo.mgrade eq '1'}"> 
									<span id="mgrade">
									전문가 회원
									</span>
								</c:when>
								<c:when test="${mvo.mgrade eq '9'}"> 
									<span id="mgrade">
									관리자
								</span>
								</c:when>
							</c:choose>
							<br><br>
							<span id="insertdate">
								${mvo.insertdate}
							</span>
						</div>
					</div>
				</c:forEach>
				<div style="display:inline-block; text-align:left; width: 500px; text-align:right;">
					<button type="button" class="centerBtn" onclick="profileModify('${mnum}')">프로필 수정</button>&nbsp;&nbsp;
					<button type="button" id="levelupBtn" class="centerBtn">등업 목록</button>
				</div>
			</div>
		</div>
		<br>
		<div class="neyongContainer">
		<div class="gubunDiv">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b class="gubun">레시피</b>
			<br><br>
			<hr>
			<br><br>
		</div>
		<div id="recipe_div">
			<c:choose>
				<c:when test="${fn:length(rList) eq 0}">
					<b>작성한 글이 없습니다</b>
				</c:when>
				<c:when test="${fn:length(rList) gt 0}">
					<div class="neyong" style="border-top:0">
						<div class="neyong_left"><b>&nbsp;&nbsp;&nbsp;&nbsp;제목</b></div>
						<div class="neyong_right"><b>작성일&nbsp;&nbsp;&nbsp;&nbsp;</b></div>
					</div>
					<c:forEach items="${rList}" var="rvo">
						<div class="neyong" onclick="recipeSelect('${rvo.rnum}')">
							<div class="neyong_left">
								<span style="display:none">${rvo.rnum}</span>
								${rvo.rsubject}
							</div>
							<div class="neyong_right">
								<span style="display:none">${rvo.rcontent}</span>
								${rvo.insertdate}
							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
		<div class="gubunDiv">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b class="gubun">전문가 팁</b>
			<br><br>
			<hr>
			<br><br>
		</div>
		<div id="tip_div">
			<c:choose>
				<c:when test="${fn:length(tList) eq 0}">
					<b>작성한 글이 없습니다</b>
				</c:when>
				<c:when test="${fn:length(tList) gt 0}">
					<div class="neyong" style="border-top:0">
						<div class="neyong_left"><b>&nbsp;&nbsp;&nbsp;&nbsp;제목</b></div>
						<div class="neyong_right"><b>작성일&nbsp;&nbsp;&nbsp;&nbsp;</b></div>
					</div>
					<c:forEach items="${tList}" var="tvo">
						<div class="neyong" onclick="tipSelect('${tvo.tnum}')">
							<div class="neyong_left">
								<span style="display:none">${tvo.tnum}</span>
								${tvo.tsubject}
							</div>
							<div class="neyong_right">
								<span style="display:none">${tvo.tcontent}</span>
								${tvo.insertdate}
							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
		<div class="gubunDiv">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b class="gubun">커뮤니티</b>
			<br><br>
			<hr>
			<br><br>
		</div>
		
		<div id="community_div">
			<c:choose>
				<c:when test="${fn:length(cList) eq 0}">
					<b>작성한 글이 없습니다</b>
				</c:when>
				<c:when test="${fn:length(cList) gt 0}">
					<div class="neyong" style="border-top:0">
						<div class="neyong_left"><b>&nbsp;&nbsp;&nbsp;&nbsp;제목</b></div>
						<div class="neyong_right"><b>작성일&nbsp;&nbsp;&nbsp;&nbsp;</b></div>
					</div>
					<c:forEach items="${cList}" var="cvo">
						<div class="neyong" onclick="communitySelect('${cvo.cnum}')">
							<div class="neyong_left">
								<span style="display:none">${cvo.cnum}</span>
								${cvo.csubject}
							</div>
							<div class="neyong_right">
								<span style="display:none">${cvo.ccontent}</span>
								<span style="display:none">${cvo.chit}</span>
								${cvo.insertdate}
							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
		</div>
	</div>	

<!-- -------------------------------페이지 전용 center------------------------------- -->
</div>

<!-- common_count.js 자바스크립트 임포트하면 span태그에 값이 바인딩 됨. -->
<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
	</div>
	<div>
		<span></span> / <span></span><br />
		<span></span> / <span></span><br />
	</div>
</div>

</div>
</div>
		</form>
		<form id="logoutForm">
 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
 		</form>
	</body>
</html>	