<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="main.ict.common.ConstPack" %>

<%
	request.setCharacterEncoding("UTF-8");
	Object obj = request.getAttribute("msg");
	System.out.println("obj >>>>>>> : " + obj);
	
	if(obj != null){
		out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');</script>");
	}//end of if
%>
<!DOCTYPE html>
<html>
	<head> 
		<meta charset="UTF-8">
		<title>oneYo(오내요)</title>
		<!-- 제이쿼리 -->
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		<!-- loginForm.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/login/loginForm.css" />
		<!-- Naver Login -->
		<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
		<!-- Kakao Login -->
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
			    integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous"></script>
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		<script type="text/javascript">
		
			$(document).ready(function(){
				
				Kakao.init('e5b444ec5e807f1a8556e5ac6dd99c83'); // 사용하려는 앱의 JavaScript 키 입력
				
				$(document).on('click', '#loginButton', function(){
					$('#loginForm').attr({
						'action':'login.ict',
						'method':'POST',
						'enctype':'application/x-www-form-urlencoded'
					}).submit(); //end of submit
				}); //end of loginButton click function
				
				$("#kakaoLogin").on("click", function() {
					console.log("카카오 로그인 시작");
					loginWithKakao();
				});
				
				$("#naverLogin").on("click", function() {
					console.log("네이버 로그인 시작");
					loginWithNaver();
				});
				
				
				//all.js 에 있는 모든 함수 연결
				allJavaScript();
				
			}); //end of jQuery & window.onload
			
			// 카카오 로그인
			function loginWithKakao() {
				// 인가 코드 받기 요청
				console.log($(Kakao));
				Kakao.Auth.authorize({
				      redirectUri: 'http://192.168.219.125:8088/oneYo/loginForm.ict'
				});
			}
			
			// 네이버 로그인
			function loginWithNaver() {
				console.log("loginWithNaver() 함수 진입");
				
				// 인증 절차 진행
				// 변수 세팅
				let uri = "https://nid.naver.com/oauth2.0/authorize";
				let responseType = "code";
				let clientId = "<%= ConstPack.M_NAVER_CID %>";
				let redirectURI = "http://192.168.219.125:8088/oneYo/loginForm.ict";
				let state = "<%= ConstPack.M_NAVER_STATE %>";
				
				let apiURL = uri + "?response_type=" + responseType
				  + "&client_id=" + clientId
				  + "&redirect_uri=" + redirectURI
				  + "&state=" + state;
				
				location.href = apiURL;
			}
			
		</script>
	</head>
	<body>
		<form id="loginForm" name="loginForm">
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
			<div class="mypageHome">
			<span>
			마이<br>페이지 
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
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>

	 		<p></p>
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
<div id="login_Form">
			<table>
				<tr>
				<td><img alt="오내요" src="/oneYo/resource/img/oneYo_logo.png" class="logo"></td>
				</tr>
				
				<tr>
					<td>
						<img src="/oneYo/resource/img/login.png" class="loginImg">
						<input type="text" id="mid" name="mid" placeholder="아이디">
						 <hr>
					</td>
				</tr>
				
				<tr>
					<td>
						<img src="/oneYo/resource/img/login_pass.png" class="loginImg">
						<input type="password" id="mpw" name="mpw" placeholder="비밀번호">
						 <hr>
					</td>
				</tr>
				
				<tr>
					<td>
						<button id="loginButton">로그인</button>
					</td>
				</tr>
				<tr>
					<td class="alink">
						<a href="idFindForm.ict" class="alink_btn">아이디 찾기</a>&nbsp;|
						<a href="pwFindForm.ict" class="alink_btn">비밀번호 찾기</a>&nbsp;|
						<a href="memGrade.ict" class="alink_btn">회원가입</a>
					</td>
				</tr>
				<tr>
				<td id="snslogin">-----------------SNS로그인-----------------<br><br></td>
				</tr>
				<tr>
					<td> <!-- 카카오 -->
<!-- 						<img src="/oneYo/img/login/kakao_login.png" -->
							<img src="/oneYo/resource/img/login_kakao.png"
							 alt="NO_IMAGE" class="loginSNS" id="kakaoLogin" />
					<br>
					</td>
				</tr>
				<tr>
					<td> <!-- 네이버 -->
<!-- 						<img src="/oneYo/img/login/naver_login.png" -->
							<img src="/oneYo/resource/img/login_naver.png"
							 alt="NO_IMAGE" class="loginSNS" id="naverLogin" />
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
</div>
		</form>
	</body>
</html>