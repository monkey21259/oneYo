<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="main.ict.common.O_Session" %>
<%@ page import="main.ict.mem.vo.MemVO" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%
	request.setCharacterEncoding("UTF-8");

	Logger logger = LogManager.getLogger(this.getClass());
	
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	
	// 2023-01-11 이성일 추가
	MemVO mvo = null;
	String mgrade = null;
	if(mnum == null || mnum.length() == 0) {
		if(request.getAttribute("mvo") !=null) {
			mvo = (MemVO)request.getAttribute("mvo");
			mnum = mvo.getMnum();
			mgrade = mvo.getMgrade();
			logger.info("mnum + mgrade : " + mnum + ", " + mgrade);
		}
	}
	String mid = (String)oSession.getAttribute(request, "mid");
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
<!-- 칸 나눈 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
	<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(document).on("click", "#insertBtn", function(){
			console.log("insertBtn 버튼 클릭 이벤트 발생");
			
			let mnum = $("#mnum").val();
			let lvsubject = $("#lvsubject").val();
			let lvcontent = $("#lvcontent").val();
			let lvphoto = $("#lvphoto").val();
			
			console.log("mnum : " + mnum);
			console.log("lvsubject : " + lvsubject);
			console.log("lvcontent : " + lvcontent);
			console.log("lvphoto : " + lvphoto);
			
			var lvsubject_chk = !(lvsubject == null || lvsubject == "" || lvsubject.length == 0 || typeof lvsubject == "undefined");
			var lvcontent_chk = !(lvcontent == null || lvcontent == "" || lvcontent.length == 0 || typeof lvcontent == "undefined");
			console.log(lvsubject_chk);
			console.log(lvcontent_chk);
			
			if(lvsubject_chk && lvcontent_chk){
				
				$("#levelupInsertForm").attr({
					'action': 'levelupInsert.ict',
					'method': 'POST',
					'enctype': 'multipart/form-data'
				}).submit();
			}
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
</head>
<body>
<!-- <div id="container" style="text-align:center;"> -->
<form id="levelupInsertForm">
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
	<table style="display:inline-block;">
		<tr>
			<td>
				<input type="hidden" id="mnum" name="mnum" value="<%= mnum %>" />
				<input type="hidden" id="mgrade" name="mgrade" value="<%= mgrade %>" />
				제목
			</td>
			<td>
				<input type="text" id="lvsubject" name="lvsubject" />
			</td>
		</tr>
		<tr>
			<td>
				내용
			</td>
			<td>
				<textarea rows="10" cols="22" id="lvcontent" name="lvcontent"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				사진
			</td>
			<td>
				<input type="file" id="lvphoto" name="lvphoto">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" id="insertBtn" value="등록하기" />
				<input type="reset"  value="다시쓰기" />
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
<!-- </div> -->
</body>
</html>