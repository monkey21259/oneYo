<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% Logger logger = LogManager.getLogger(this.getClass()); %>
<%
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
	
	logger.info("mnum: " + mnum);
	logger.info("mid: " + mid);
%>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<title>레시피 등록 페이지</title>
		
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- recipeInsertForm.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipe_insertForm.css">
		
		<!-- 제이쿼리cdn -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<script type="text/javascript">	
		
// 			alert("[recipeInsertForm.jsp] JS");
			$(document).ready(function() {
				
// 				alert("[recipeInsertForm.jsp] jQuery");
				$("#recipeInsertBtn").on("click", function() {
					alert("recipeInsertBtn >>> Click");
					
					// validation code area
					
					let bar = $("#rperson").val();
					console.log(bar);
					let time = $("#rhour").val();
					console.log(time);
				
					//
					$("#recipeInsertForm").attr({
						"action": "/oneYo/recipeInsert.ict",
						"method": "POST",
						"enctype": "multipart/form-data"
					}).submit();
				});
				
				let i = "";
				$("#jeryo").click(function(){
					
					let jeryo = $("#jeryoText").val();
					$("#jeryoText").val("");
					$("#jeryocan").append(jeryo + " ");
					let rjeryo = "#" + jeryo;
					console.log("w :" + rjeryo);
					
					i = i + rjeryo;
					console.log("w :" + i);
					
					$("#data").val(i);
					
					let info = $("#data").val();
					console.log("최종 : " + info);
					
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
				
			});
		
		</script>
		<style type="text/css">
		
			.recipeTable tr, .recipeTable td {
				border: 1px solid black;
			}
		
		</style>
	</head>
	<body>
		<section>
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
							<input type="hidden" id="data" name="rjeryo" value="">
							<input type="text" id="jeryoText" name="rjeryoSelect" value="" placeholder="재료를 입력하세요." />
							<input id="jeryo" type="button" value="재료등록"><br>
							<p id="jeryocan"></p>
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
%>							</select>&nbsp;시간&nbsp;
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
								<option value="1인분" selected>1인분</option>
<%  // ---- 몇 인분(max=10)
							String rPerson = null;
							for (int i=2; i<11; i++) {
								rPerson = "";
								
								rPerson += i;
%>
								<option value="<%= rPerson %>인분"><%= i %>인분</option>
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
		
		</section>
	</body>
</html>