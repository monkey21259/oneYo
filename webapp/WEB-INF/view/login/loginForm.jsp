<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="main.ict.common.ConstPack" %>

<%
	request.setCharacterEncoding("UTF-8");
	Object obj = request.getAttribute("msg");
	if(obj != null){
		out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');</script>");
	}//end of if
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<link rel="stylesheet" href="/oneYo/resource/css/login/loginForm.css" />
		<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
			    integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
		
			$(document).ready(function(){
				
				Kakao.init('e5b444ec5e807f1a8556e5ac6dd99c83'); // 사용하려는 앱의 JavaScript 키 입력
				
				$(document).on('click', '#loginBtn', function(){
					$('#loginForm').attr({
						'action':'login.ict',
						'method':'POST',
						'enctype':'application/x-www-form-urlencoded'
					}).submit(); //end of submit
				}); //end of loginBtn click function
				
				$("#kakaoLogin").on("click", function() {
					console.log("카카오 로그인 시작");
					loginWithKakao();
				});
				
				$("#naverLogin").on("click", function() {
					console.log("네이버 로그인 시작");
					loginWithNaver();
				});
				
			}); //end of jQuery & window.onload
			
			// 카카오 로그인
			function loginWithKakao() {
				// 인가 코드 받기 요청
				console.log($(Kakao));
				Kakao.Auth.authorize({
				      redirectUri: 'http://localhost:8088/oneYo/loginForm.ict'
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
				let redirectURI = "http://localhost:8088/oneYo/loginForm.ict";
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
			<table border="1">
				<tr>
					<td>로고 들어올 자리</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="mid" name="mid" placeholder="아이디">
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" id="mpw" name="mpw" placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td>
						<button id="loginBtn">로그인</button>
					</td>
				</tr>
				<tr>
					<td>
						<a href="idFindForm.ict">아이디 찾기</a>&nbsp;|
						<a href="pwFindForm.ict">비밀번호 찾기</a>&nbsp;|
						<a href="memGrade.ict">회원가입</a>
					</td>
				</tr>
				<tr>
					<td> <!-- 카카오 -->
						<img src="/oneYo/img/login/kakao_login.png"
							 alt="NO_IMAGE" class="loginSNS" id="kakaoLogin" />
					</td>
				</tr>
				<tr>
					<td> <!-- 네이버 -->
						<img src="/oneYo/img/login/naver_login.png"
							 alt="NO_IMAGE" class="loginSNS" id="naverLogin" />
					</td>
				</tr>
				<tr>
					<td>구글 로그인 자리</td>
				</tr>
			</table>
		</form>
	</body>
</html>