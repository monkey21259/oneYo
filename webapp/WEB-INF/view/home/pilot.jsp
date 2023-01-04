<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="java.util.List" %>

<%@ page import="main.ict.common.O_Session" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.tip.vo.TipVO" %>

<% Logger logger = LogManager.getLogger(this.getClass()); %>
<% logger.info(".jsp 진입"); %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
	
	// 2023-01-04 이성일 추가 : 현재 쉐프 mnum
	String chefMnum = "";
	
	CommunityVO cvo = null;
	RecipeVO rvo = null;
	TipVO tvo = null;
	List<CommunityVO> communityList = null;
	List<RecipeVO> recipeList = null;
	List<TipVO> tipList = null;
	
	if (request.getAttribute("chefMnum") !=null) {
		chefMnum = (String)request.getAttribute("chefMnum");
	}
	
	if (request.getAttribute("communityList") !=null) {
		communityList = (List<CommunityVO>)request.getAttribute("communityList");
		logger.info("");
		for (int i=0; i < communityList.size(); i++) {
			cvo = communityList.get(i);
			logger.info("커뮤니티 게시판 PK[" + i + "] : " + cvo.getCnum());
		}
	}
	
	if (request.getAttribute("recipeList") !=null) {
		recipeList = (List<RecipeVO>)request.getAttribute("recipeList");
		for (int i=0; i < recipeList.size(); i++) {
			rvo = recipeList.get(i);
			logger.info("레시피 게시판 PK[" + i + "] : " + rvo.getRnum());
		}
	}
	
	if (request.getAttribute("tipList") !=null) {
		tipList = (List<TipVO>)request.getAttribute("tipList");
		for (int i=0; i < tipList.size(); i++) {
			tvo = tipList.get(i);
			logger.info("전문가팁 게시판 PK[" + i + "] : " + tvo.getTnum());
		}
	}
	
	
	logger.info("mid: " + mid);
	logger.info("mnum: " + mnum);
	logger.info("chefMnum : " + chefMnum);
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
		<!-- home 페이지 전용 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/home/home.css">
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<script type="text/javascript" src="/oneYo/resource/js/home/home.js" charset="UTF-8"></script>
		<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		<script type="text/javascript">
		
			alert("[home.jsp] JS");
			
			$(document).ready(function() {
				
				alert("[home.jsp] jQuery");

				// 게시글 관련 ---------------------------------
				$(".favorPostTitle").on("click", function() {  // 타이틀 클릭
					postClick($(this));
				});
				
				$('.pa').on("click", function() {				// 게시글 클릭 시
// 					console.log($(this).attr('data-value'));	// 게시글의 고유번호
					$('#num').val($(this).attr('data-value'));	// 보낼 내용 지정하기
					$("#goSelectForm").attr({					// hidden 태그 받아서 사용하기
						"action": "/oneYo/goSelectContent.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
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
		
				//all.js 에 있는 모든 함수 연결
				allJavaScript();
				
				// 더보기 게시판 버튼(레시피, 전문가팁, 커뮤니티)
//				<button id="recipeBtn" style="width:200px;">레시피</button>
//				<button id="tipBtn" style="width:200px;">전문가 팁</button>
//				<button id="communitytBtn" style="width:200px;">커뮤니티</button>

				$(document).on("click","#recipeBtn", function(){
					alert("recipeBtn 버튼 클릭");
					location.href = "chefRecipeShowMore.ict?mnum=<%= chefMnum %>";
					
				});
				
				$(document).on("click","#tipBtn", function(){
					alert("tipBtn 버튼 클릭");
					location.href = "chefTipShowMore.ict?mnum=<%= chefMnum %>";
					
				});
				
				$(document).on("click","#communitytBtn", function(){
					alert("communitytBtn 버튼 클릭");
					location.href = "chefCommunityShowMore.ict?mnum=<%= chefMnum %>";
					
				});
				
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
			
			function recipeSelectContent(rnum) {
				alert(rnum);
				location.href = "recipeSelectContent.ict?rnum=" + rnum;
			}
			
		</script>
	</head>
<body>

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
			<div class="mypageHome">
			<span>
			my<br>Page 
			</span>
			</div>
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
		if (mid == null || mid.equals("")) {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">:</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
<%
		} else {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik mypageHome">마이페이지</span>
				<span class="Choonsik">:</span>
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
	 		<form id="logoutForm">
	 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
	 		</form>
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

<div id="center" style="text-align:center;">
<!--
 
2023-01-04 쉐프소개 더 보기 작업 할 부분
2023-01-04 쉐프소개 더 보기 작업 할 부분 
2023-01-04 쉐프소개 더 보기 작업 할 부분 
2023-01-04 쉐프소개 더 보기 작업 할 부분 
2023-01-04 쉐프소개 더 보기 작업 할 부분 
2023-01-04 쉐프소개 더 보기 작업 할 부분  
communityList
recipeList
tipList

-->
	<div id="btnarea" style="display:inline-block;">
		<button id="recipeBtn" style="width:200px;">레시피</button>
		<button id="tipBtn" style="width:200px;">전문가 팁</button>
		<button id="communitytBtn" style="width:200px;">커뮤니티</button>
	</div>
<%
	// 커뮤니티 글이 조회된 경우
	if (communityList !=null && communityList.size() > 0) {
		for (int i=0; i < communityList.size(); i++) {
			cvo = communityList.get(i);
%>
		<div class="communityTemp">
			<img src="/oneYo/img/community/<%= cvo.getCphoto() %>" style="wdith:100px; height:100px;">
			<span><%= cvo.getCsubject() %></span>
		</div>
<%		
		}
	}
%>

<%
	// 커뮤니티 글이 조회된 경우
	if (recipeList !=null && recipeList.size() > 0) {
		for (int i=0; i < recipeList.size(); i++) {
			rvo = recipeList.get(i);
%>
		<div class="recipeTemp" onclick="recipeSelectContent('<%= rvo.getRnum() %>')">
			<img src="/oneYo/img/recipe/<%= rvo.getRphoto() %>" style="wdith:100px; height:100px;">
			<span><%= rvo.getRsubject() %></span><br/>
		</div>
<%					
		}
	}
%>

<%
	// 커뮤니티 글이 조회된 경우
	if (tipList !=null && tipList.size() > 0) {
		for (int i=0; i < tipList.size(); i++) {
			tvo = tipList.get(i);
%>
		<div class="tipTemp">
			<img src="/oneYo/img/tip/<%= tvo.getTphoto() %>" style="wdith:100px; height:100px;">
			<span><%= tvo.getTsubject() %></span>
		</div>
<%					
		}
	}
%>

</div>

<!-- common_count.js 자바스크립트 임포트하면 span태그에 값이 바인딩 됨. -->
<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
		<span>팀 소개: ~~~</span>
	</div>
	<div>
		<span></span> / <span></span><br />
		<span></span> / <span></span><br />
	</div>
</div>

</div>
</div>
</body>
</html>