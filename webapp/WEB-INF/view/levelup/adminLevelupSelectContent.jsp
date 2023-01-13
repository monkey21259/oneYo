<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="java.util.List" %>

<%@ page import="main.ict.levelup.vo.LevelupVO" %>
<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("adminLevelupSelectContent.jsp 진입 .");	
%>
<%
	//세션부여
	O_Session mSession = O_Session.getInstance();
	String mnum = mSession.getSession(request);
	String mid = (String)mSession.getAttribute(request, "mid");
%>
<%
	List<LevelupVO> list = (List<LevelupVO>)request.getAttribute("list");
	LevelupVO lvo = list.get(0);

	String mnick = (String)request.getAttribute("mnick");
%>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
<!-- jQuery -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<!-- adminLevelupContent.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/levelup/adminLevelupContent.css">
<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>	
<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		<script type="text/javascript">

			$(document).ready(function(){
				
				$("#nopeBtn").click(function(){
					
					let result = confirm('등업을 거부하시겠습니까?');
					if(result == true){
					
					$("#levelupForm").attr({
						"action":"levelupNope.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
					
					alert("등업이 거부되었습니다.");
					
					}else{
						alert("취소되었습니다.");
					}
				});
				
				
				$("#okeyBtn").click(function(){
					
					let result = confirm('등업을 승인하시겠습니까?');
					if(result == true){
					
					$("#levelupForm").attr({
						"action":"levelupOkey.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"		
					}).submit();
						
					alert("등업이 승인되었습니다.");
					
					}else{
						alert("취소되었습니다.");
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

<form name="levelupForm" id="levelupForm">

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
			<input type="hidden" name="lvnum" value="<%= lvo.getLvnum() %>">
			<input type="hidden" name="mnum" value="<%= lvo.getMnum() %>">
			<div class="reqHeader">
				등업신청 승인/거부
			</div>
			<div class="reqHeaderUnderLine">
				-------------------
			</div>
			<div id="viewTable">
				<table id="selectContent">
					<tr class="subjectTr">
						<td>
						<!-- 글 이미지 + 카테고리 -->
						<%
							if (lvo.getLvphoto() == null) {
						%>
							<script>
								
								$(document).ready(function() {
									
									let subjectTr = $(".subjectTr");
									subjectTr.css({
										"display": "flex",
										"justify-content": "center",
										"margin-bottom": "20px"
									});
									
									$(".selectTd").css({
										"width": "100%"
									});
									
								});
							
							</script>
						<%
							} else {
						%>
							<div class="imgSelect" style="margin-bottom: 20px;">
								<img class="levelupImg" src="/oneYo/img/levelup/<%= lvo.getLvphoto() %>">
								<input type="hidden" id="nphoto" name="nphoto" value="<%= lvo.getLvphoto() %>"/> 
							</div>
						<%
							}
						%>
						</td>
						<td class="selectTd subjectTd">
							<p style="text-align:left;word-break:keep-all;overflow:hidden;">
								<%= lvo.getLvsubject() %><br />
							</p>
							<div id="hrDiv"></div>
							<div class="writerDiv" style="text-align:left;margin-top:10px;">
								작성자 :&nbsp;&nbsp;&nbsp; <%= mnick %>
							</div>
							<div class="writerDiv">
								작성일자 : <%= lvo.getInsertdate() %>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="contentBody">
							<%= lvo.getLvcontent() %>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:right;">
							<div class="thirdContents">
								<div class="oneTd">
									<table>
										<tr>
											<td class="nameTd">
												<button type="button" class="btns levelupButton" id="okeyBtn">승인</button>
											</td>
										</tr>
										<tr>
											<td class="valTd">
											</td>
										</tr>
									</table>
								</div>
								<div class="oneTd">
									<table>
										<tr>
											<td class="nameTd">
												<button type="button" class="btns levelupButton" id="nopeBtn">거부</button>
											</td>
										</tr>
										<tr>
											<td class="valTd">
											</td>
										</tr>
									</table>
								</div>
							</div>
						</td>
					</tr>
				</table>	 
<!-- -------------------------------페이지 전용 center------------------------------- -->  
			</div>
			<div style="height:25px;"></div>
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