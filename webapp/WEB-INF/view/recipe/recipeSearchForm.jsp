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
		
		
	<!-- recipeSerachForm.jsp 전용 -->
	<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipeSearchForm.css">	
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<script type="text/javascript" src="/oneYo/resource/js/home/home.js" charset="UTF-8"></script>
		<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		<script type="text/javascript">
		
			$(document).ready(function() {
				
				
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
				
				$(document).on("click", "#jeryoBtn", function(){
					
					let jeryo = $("#jeryo");
					let jeryoList = $("#jeryoList");
					let jeryoAtag = $("<a>").attr("onclick", "deleteJeryo(this)");
					console.log("입력된 재료 : " + jeryo.val());
					console.log("입력된 재료 문자열 길이 : " + jeryo.val().length);
					
					if(jeryo !=null && jeryo.val().replaceAll(" ", "").length > 0 && typeof jeryo !='undefined') {
						console.log("정상 입력된 재료 : " + jeryo.val());
						console.log("jeryoList text : " + jeryoList.text());
						if (jeryoList.text() == '등록된 재료가 없습니다.') {
							jeryoList.text("");
						}
						console.log(jeryoList.text().split('#').length);
						if(jeryoList.text().split('#').length <= 3) {
							console.log("3개 이하");
							jeryoList.append(jeryoAtag.text("#" + jeryo.val() + " "));
							jeryo.val("");
							jeryo.focus();
						}else {
							alert("재료는 최대 3개까지만 입력 가능합니다!");
						}
					}
				});
				
				$(document).on("click", "#recipeSearchBtn", function(){
					
					
					let jeryoList = $("#jeryoList");
					console.log(jeryoList.text());
					
					if(jeryoList.text() != '등록된 재료가 없습니다.') {
						if(jeryoList.text() !=null && jeryoList.text().length > 0 && typeof jeryoList.text() !='undefined') {
							
							
							let jeryo = jeryoList.text().replaceAll(" ", "");
							jeryo = jeryo.split("#");
							jeryo.shift();
							console.log(jeryo);
							
							if(jeryo !=null) {
								let queryString = "?";
								for(let i=0; i<jeryo.length; i++) {
									if(i != (jeryo.length - 1)) {
										queryString += "rjeryo=" + jeryo[i] + "&";
									}else if(i == (jeryo.length - 1)) {
										queryString += "rjeryo=" + jeryo[i];
									}
								}
								console.log(queryString);
								$("#jeryo").text("");
								$("#jeryoList").text("");
								location.href = "recipeSearch.ict" + queryString;
							}
						}
					}
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
			
			function deleteJeryo(obj) {
				if(confirm("재료를 제거하시겠습니까?")) {
					obj.remove();	
				}
			}
			
		</script>
	</head>
<body>
<form id="recipeSearchForm">
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
			<div>
			<span>
			검색
			</span>
			</div>
		</li>
		<li class="item">
			<div class="warningForm">
			<span>
			신고
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
<!-- 	<div class="searchBarBtn"> -->
<!-- 		X -->
<!-- 	</div> -->
<!-- 	<div> -->
<%-- 		<jsp:include page="/WEB-INF/view/recipe/recipePage.jsp" flush="true"> --%>
<%-- 				<jsp:param value="" name=""/> --%>
<%-- 		</jsp:include>	 --%>
<!-- 	</div> -->
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
	 		<form id="logoutForm">
	 			<input type="hidden" id="mid" name="mid" value="<%= mid %>" />
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
				<div class="menu">
					<a href="recipeSelectAll.ict" class="menu_link">
						<div class="divClick">
							레시피
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="tipSelectAll.ict" class="menu_link">
						<div>
							Tip
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="communitySelectAll.ict" class="menu_link">
						<div>
							커뮤니티
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="noticeSelectAll.ict" class="menu_link">
						<div>
							공지사항
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="pulsMenu">
					<div class="menu">
						<a href="#" class="menu_link">
							<div>
								더보기
							</div>
						</a>
					</div>
					<div class="sub-menu">
					<ul>
						<li>
							<a href="entertainment.ict" class="menu_link">
							<div>
							엔터테인먼트
							</div>
							</a>
						</li>
						<li>
							<a href="chart.ict" class="menu_link">
							<div>
							차트
							</div>
							</a>
						</li>
						<li>
							<a href="goCalendar.ict" class="menu_link">
							<div>
							일정 관리
							</div>
							</a>
						</li>
					</ul>
					</div>
				</div>
			</li>
		</ul>
		</nav>
	</div>
	
</div>

<div id="center">
<!-- -------------------------------페이지 전용 center------------------------------- -->
	
	<div id="anne">
		<p id="subject">재료 검색</p>
		<p id="content">검색하실 재료를 입력하면 해당 재료의 레시피가 검색됩니다.</p>
	</div>
	
	<div>
			<table class="table-fill_recipeSearch">
			
					

	
					<tr>
						<td>
							<input id="jeryo" type="text">
							<input id="jeryoBtn" type="button" value="등록하기">
						</td>
					</tr>
					
					<tr>
							<td id="recipe_info">
							재료 검색은 최대 3개까지  입력 가능합니다.
							</td>
					</tr>
					<tr>
						<td>
							<span id="jeryoList">등록된 재료가 없습니다.</span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" id="recipeSearchBtn" value="검색하기">
						</td>
					</tr>

			</table>
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
</div> <!-- footer -->
</div>

		</form>
	</body>
</html>