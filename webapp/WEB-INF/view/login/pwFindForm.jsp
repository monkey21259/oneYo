<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$(document).on('click', '#emailBtn', function(){
					
					let urlVal = "pwFind.ict"
					let typeVal = "POST";
					let midVal = $('#mid').val();
					let memailVal = $('#memail').val();
					let dataVal = { mid:midVal,
									memail:memailVal};
					
					$.ajax({
						url: urlVal,
						type: typeVal,
						data: dataVal,
						success: whenSuccess,
						error: whenError
					});//end of ajax
					
					function whenSuccess(resData){
						if(resData == "FIND_YES"){
							alert("입력하신 이메일 주소로 송부된 URL을 클릭해주세요.");
						}else{
							alert("아이디 또는 이메일 주소가 일치하지 않습니다.");
							$('#mid').val('');
							$('#memail').val('');
							$('#mname').focus();
						}//end of if-else
						
					}//end of whenSuccess() function
					
					function whenError(e){
						alert("예기치 못한 에러가 발생했습니다. 잠시 후 다시 시도해주세요.");
					}//end of whenError() function
					
				});//end of emailBtn click function
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="pwFindForm" name="pwFindForm">
			<table border="1">
				<tr>
					<td>로고 자리</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="mid" name="mid" placeholder="아이디">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="memail" name="memail" placeholder="이메일 주소">
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" id="emailBtn">인증메일 받기</button>
					</td>
				</tr>
				<tr>
					<td>
						<a href="loginForm.ict">로그인</a>&nbsp;|
						<a href="idFindForm.ict">아이디 찾기</a>&nbsp;|
						<a href="memGrade.ict">회원가입</a>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>