<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$(document).on('click', '#emailBtn', function(){
					$('#idFindForm').attr({
						'action':'idFind.ict',
						'method':'GET'
					}).submit();//end of submit
				});//end of emailBtn click function
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="idFindForm" name="idFindForm">
			<table border="1">
				<tr>
					<td>로고 자리</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="mname" name="mname" placeholder="이름">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="memail" name="memail" placeholder="이메일 주소">
					</td>
				</tr>
				<tr>
					<td>
						<button id="emailBtn">인증메일 받기</button>
					</td>
				</tr>
				<tr>
					<td>
						<a href="loginForm.ict">로그인</a>&nbsp;|&nbsp;
						<a href="pwFindForm.ict">비밀번호 찾기</a>&nbsp;|&nbsp;
						<a href="memGrade.ict">회원가입</a>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>