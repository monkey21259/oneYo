<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="org.apache.log4j.LogManager"%>

<%@ page import="main.ict.common.O_Session"%>

<%
	Logger logger = LogManager.getLogger(this.getClass());
%>

<%
	O_Session oSession = O_Session.getInstance();
String mnum = oSession.getSession(request);
String mid = (String) oSession.getAttribute(request, "mid");

logger.info("mid: " + mid);
logger.info("mnum: " + mnum);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 칸 나눈 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<link rel="stylesheet" href="/oneYo/resource/css/mypage/myPageHome.css">
<style type="text/css">

	#chart_div > div {
		display: inline-block;
	}
	
	#chart_div > canvas {
		display: inline-block;
	}
	
	#chart_btn > button {
		display: inline-block;
	}

</style>

<!-- 아래 5개 이용하면 <div id="chart_div"> 영역에 동적으로 차트가 그려짐 -->
<!-- 구글 차트는 div에 직접 그려지고 chart.js는 div > canvas에 그려짐 	 -->
<script src="https://www.google.com/jsapi"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script>
<script src="/oneYo/resource/js/common/common_chart.js" charset="UTF-8"></script>
<script src="/oneYo/resource/js/common/common_count.js" charset="UTF-8"></script>

<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js"
	charset="UTF-8"></script>

<script type="text/javascript">
	$(document).ready(function() {

		//all.js 에 있는 모든 함수 연결
		allJavaScript();

	});
</script>

<title>oneYo(오내요)</title>
</head>
<body>





	<div id="realAll">

		<div id="backMenu"></div>
		<input type="checkbox" id="sideMenu" name="sideMenu" hidden> <label
			for="sideMenu" id="sideLabel">&lt;&lt;&nbsp;&nbsp;&nbsp;</label>
		<div class="sidebar">
			<ul>
				<li class="item">
					<div class="homeLink">
						<span> 홈으로 </span>
					</div>
				</li>
				<li class="item">
					<div class="searchBarBtn">
						<span> 검색 </span>
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
						<span> 신고 </span>
					</div>
				</li>
				<li class="item">
					<%
						logger.info("mid>>>>>>>>>>>>>" + mid);
					if (mid == null || !mid.equals("admin")) {
					%>
					<div class="mypageHome">
						<span> 마이<br>페이지
						</span>
					</div> <%
 	} else if (mid.equals("admin")) {
 %>
					<div class="adminHome">
						<span> 관리자<br>페이지
						</span>
					</div> <%
 	}
 %>
				</li>
				<li class="item"><a href="javascript:window.scrollTo(0,0);">
						<div id="go_top">
							<span> TOP▲ </span>
						</div>
				</a></li>
			</ul>
		</div>

		<div id="searchBar" class="hidden_X">
			<!-- <div id="searchBar" class="hidden_O"> -->
			<div class="searchBarBtn">X</div>
			검색바 여기에 넣기 <input type="text" id="searchText" name="serchText">
			<input type="button" id="searchTextBtn" value="검색">
		</div>

		<div id="singo" class="hidden_X">
			<div class="warningForm">X</div>
			<jsp:include page="/WEB-INF/view/warning/warningPage.jsp"
				flush="true">
				<jsp:param value="" name="" />
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
							<span class="Choonsik" id="newMemBtn">회원가입</span> <span
								class="Choonsik">|</span> <span class="Choonsik" id="loginBtn">로그인</span>
						</div>
						<%
							} else {
						%>
						<div class="loginBtnDiv">
							<%
								if (mid.equals("admin")) {
							%>
							<span class="Choonsik adminHome">관리자페이지</span>
							<%
								} else {
							%>
							<span class="Choonsik mypageHome">마이페이지</span>
							<%
								}
							%>
							<span class="Choonsik">|</span> <span class="Choonsik"
								id="logoutBtn">로그아웃</span>
							<%
								String mSNSid = mid; // M22...
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
							<p><%=mSNSid%>
								<span>님 환영합니다.</span>
							</p>
						</div>
						<p></p>
						<form id="logoutForm">
							<input type="hidden" id="mid" name="mid" value="<%=mid%>" />
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
										<div>레시피</div>
									</a>
								</div>
							</li>
							<li>
								<div class="menu">
									<a href="tipSelectAll.ict" class="menu_link">
										<div>Tip</div>
									</a>
								</div>
							</li>
							<li>
								<div class="menu">
									<a href="communitySelectAll.ict" class="menu_link">
										<div>커뮤니티</div>
									</a>
								</div>
							</li>
							<li>
								<div class="menu">
									<a href="noticeSelectAll.ict" class="menu_link">
										<div>공지사항</div>
									</a>
								</div>
							</li>
							<li>
								<div class="pulsMenu">
									<div class="menu">
										<a href="entertainment.ict" class="menu_link">
											<div>더보기</div>
										</a>
									</div>
									<div class="sub-menu">
										<ul>
											<li><a href="entertainment.ict" class="menu_link">
													<div>엔터테이먼트</div>
											</a></li>
											<li><a href="chart.ict" class="menu_link">
													<div>차트</div>
											</a></li>
											<li><a href="goCalendar.ict" class="menu_link">
													<div>일정 관리</div>
											</a></li>
										</ul>
									</div>
								</div>
							</li>
						</ul>
					</nav>
				</div>

			</div>

			<div id="center">
				<div id="chart_div" style="text-align: center;"></div>
				<div id="chart_btn" style="text-align: center;">
					<button id="googlePieBtn" class="centerBtn">구글 파이차트</button>
					<button id="googleBarBtn" class="centerBtn">구글 바차트</button>
					<button id="chartjsPieBtn" class="centerBtn">chart.js 파이차트</button>
					<button id="chartjsBarBtn" class="centerBtn">chart.js 바차트</button>
				</div>
			</div>

			<!-- common_count.js 자바스크립트 임포트하면 span태그에 값이 바인딩 됨. -->
			<div id="footer">
				<div>
					<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
				</div>
				<div>
					<span></span> / <span></span><br /> <span></span> / <span></span><br />
				</div>
			</div>

		</div>
	</div>
</body>
</html>