<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$(document).on('click', '#loginBtn', function(){
					$('#loginForm').attr({
						'action':'login.ict',
						'method':'POST',
						'enctype':'application/x-www-form-urlencoded'
					}).submit();//end of submit
				});//end of loginBtn click function
			});//end of jQuery
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
						<a href="idFindForm.ict">아이디 찾기</a>&nbsp;|&nbsp;
						<a href="pwFindForm.ict">비밀번호 찾기</a>&nbsp;|&nbsp;
						<a href="memGrade.ict">회원가입</a>
					</td>
				</tr>
				<tr>
					<td>카카오로그인 자리</td>
				</tr>
				<tr>
					<td>네이버로그인 자리</td>
				</tr>
				<tr>
					<td>구글 로그인 자리</td>
				</tr>
			</table>
		</form>
	</body>
</html>