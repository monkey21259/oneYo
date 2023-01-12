<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.ict.common.O_Session" %>

<%
	String cnum = (String)request.getAttribute("cnum");
	String csubject = (String)request.getAttribute("csubject");
	String mnum = (String)request.getAttribute("mnum");
	
	//세션부여
		O_Session oSession = O_Session.getInstance();
		String mid = (String)oSession.getAttribute(request, "mid");

 %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>oneYo(오내요)</title>
	<!-- jQuery -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

	<!-- 전체 css -->
	<link rel="stylesheet" href="/oneYo/resource/css/all.css">
	
	<!-- communityWarningForm.jsp 전용 -->
	<link rel="stylesheet" href="/oneYo/resource/css/community/communityWarningForm.css">
	
	<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
	<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
	
	<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
	<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
	
	<script type="text/javascript">
	
		$(document).ready(function(){
		
			$("#datain").click(function(){
				
				let box = $("#box").val();
				
				if(box != '50'){
				
				$("#submit").attr({
					"action":"communityWarningInsert.ict",
					"method":"GET",
					"enctype":"application/x-www-form-urlencoded"
				}).submit();
				
				alert("신고 되었습니다");
			
				}else{
					alert("신고할 카테고리를 선택해주세요");
					return false;
				}
			});
			
			$("#content").click(function(){
				
				$("#content").text("");
				$("#content").prop("readonly", false);
	
			});
			
			$("#logoutBtn").on("click", function() {
				$("#logoutForm").attr({
					"action": "/oneYo/logout.ict",
					"method": "GET",
					"enctype": "application/x-www-form-urlencoded"
				}).submit();
			});
			
			//all.js 에 있는 모든 함수 연결
			allJavaScript();
			
		}); //ready
		
	</script>
	</head>
	<body>
		<form id="submit" name="submit">
		
		<div id="realAll">

<div id="backMenu"></div>

<div id="sideBar">
	
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
		String mSNSid = mid;
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
				<div class="menu">
					<a href="recipeSelectAll.ict" class="menu_link">
						<div>
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
							엔터테이먼트
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
			<input type="hidden" name="mnum" value="<%= mnum %>">
			<input type="hidden" name="wtnum" value="<%= cnum %>">
			
			<table border="1">
			<tr>
				<td  colspan="2">
				<h3 align="center">신고하기</h3>
				</td>
			</tr>
			<tr>
			<td>신고분야</td>
				<td>
					<select id="box" name="wcategory">
					<option value="50">선택하세요 </option>
					<option value="00">욕설 및 비방 </option>
					<option value="01">음란물</option>
					<option value="02">불법광고</option>
					<option value="03">도배성</option>
					<option value="04">주제와 맞지 않음 </option>
					<option value="99">기타</option>
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>커뮤니티</td>
			</tr>
			<tr>
				<td>제목</td> 
				<td><%= csubject %></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea id="content" rows="30" cols="80" name="wcontent" readonly>신고할 내용을 작성해주세요</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id="datain" value="신고">
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
			</table>
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