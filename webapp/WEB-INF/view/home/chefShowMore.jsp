<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="java.util.List" %>

<%@ page import="main.ict.common.O_Session" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.tip.vo.TipVO" %>
<%@ page import="main.ict.home.vo.HomeVO" %>

<% Logger logger = LogManager.getLogger(this.getClass()); %>
<% logger.info(".jsp 진입"); %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
	List<HomeVO> list = null;
	HomeVO hvo = null;
	
	// 2023-01-05 쉐프 목록
	
	if (request.getAttribute("list") !=null) {
		list = (List<HomeVO>)request.getAttribute("list");
	}

	logger.info("mid: " + mid);
	logger.info("mnum: " + mnum);
%>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<!-- [221230] 반응형 페이지 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes" />
		<title>oneYo(오내요)</title>
		<!-- jQuery -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- 칸 나눈 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		<!-- chefShowMore 페이지 전용 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/home/chefShowMore.css">
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<script type="text/javascript" src="/oneYo/resource/js/home/home.js" charset="UTF-8"></script>
		<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		<script type="text/javascript">
		
			console.log("[home.jsp] JS");
			
			$(document).ready(function() {
				
				console.log("[home.jsp] jQuery");
				
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
				
				//카테고리 버튼 클릭했을 때 

// 						$(document).on('click', '.btn_1', function(){
// 							$('.category').find('div').removeClass('btn_2');
// 							$(this).find('div').addClass('btn_1');
// 						});
						
			

				//all.js 에 있는 모든 함수 연결
				allJavaScript();
				
			});
			
			function sortProccess(sortType) {
				if(sortType !=null && sortType !="" && typeof sortType !="undefined") {
					console.log(sortType);
					location.href = "chefListShowMore.ict?sortCondition=" + sortType;
				}
				
			}
			
		</script>
	</head>
<body>
<form>
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
		<li class="item">
			<div class="warningForm">
			<span>
			신고
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
	<div>
		<jsp:include page="/WEB-INF/view/recipe/recipePage.jsp" flush="true">
				<jsp:param value="" name=""/>
		</jsp:include>	
	</div>	
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
<%
			if(mid.equals("admin")){
%>
				<span class="Choonsik adminHome">관리자페이지</span>
<%
			}else{
%>
				<span class="Choonsik mypageHome">마이페이지</span>
<%
			}
%>
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
<!--
2023-01-05
쉐프 더 보기 작업할 공간
2023-01-05
쉐프 더 보기 작업할 공간
2023-01-05
쉐프 더 보기 작업할 공간
2023-01-05
쉐프 더 보기 작업할 공간
2023-01-05
쉐프 더 보기 작업할 공간
2023-01-05
쉐프 더 보기 작업할 공간
-->

	<div id="anne">
	<p id="subject">오내요 쉐프 목록</p>
	</div>
	
<!-- 카테고리 -->
	<div class="category_fillContainer">
		<div class="category">
			<div class="divClick">
				<button type="button" class="category_btn btn_1" onclick="sortProccess('totalrecipe')">레시피 작성순</button>
			 </div>
			 <div class="divClick">
				<button type="button" class="category_btn btn_2" onclick="sortProccess('totalrecipehit')">레시피 조회수순</button>
			 </div>
			 <div class="divClick">
				<button type="button" class="category_btn btn_3" class="category_btn" onclick="sortProccess('totaltip')">전문가 팁 작성순</button>
			</div>
			 <div class="divClick">
				<button type="button" class="category_btn btn_4" onclick="sortProccess('totaltiphit')">전문가 팁 조회수순</button>
			</div>
			 <div class="divClick">
			 	<button type="button" class="category_btn btn_5" onclick="sortProccess('subscription')">활동기간순</button>
			</div>
		</div>
	</div>
<%
	if (list !=null && list.size() > 0) {
		for (int i=0; i < list.size(); i++) {
			hvo = list.get(i);
%> 
	<a href="chefIntroduce.ict?mnum=<%= hvo.getMnum() %>">
		<table class="chef_table-fill">
			<thead>
				<tr>
					<th width="15%">닉네임</th>
					<th width="10%">프로필</th>
					<th width="15%">레시피 작성</th>
					<th width="15%">레시피 조회수</th>
					<th width="15%">전문가팁 작성</th>
					<th width="15%">전문가팁 조회수</th>
					<th width="15%">활동기간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><span><%= hvo.getMnick() %></span></td>
					<td><img src="/oneYo/img/mem/<%= hvo.getMprofile() %>" onerror="this.src='/oneYo/resource/img/grade0.png'"></td>
					<td><span><%= hvo.getTotalrecipe() %></span></td>
					<td><span><%= hvo.getTotalrecipehitcnt() %></span></td>
					<td><span><%= hvo.getTotaltip() %></span></td>
					<td><span><%= hvo.getTotaltiphitcnt() %></span></td>
					<td><span><%= hvo.getSubscription() %>일</span></td>
				</tr>
			</tbody>
		</table>
	</a>
<%
		}
	}
%>

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