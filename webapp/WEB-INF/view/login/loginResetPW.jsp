<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="main.ict.mem.vo.MemVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	Object obj = request.getAttribute("pwFindVO");
	MemVO pwFindVO = (MemVO)obj;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 변경하기</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$(document).on('click', '#resetPWBtn', function(){
					let mpw = $('#mpw').val();
					let mpw_r = $('#mpw_r').val();
					
					if(mpw == mpw_r){
						$('#resetPWForm').attr({
							'action':'resetPW.ict',
							'method':'POST',
							'enctype':'application/x-www-form-urlencoded'
						}).submit();//end of submit
					}else{
						alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
						$('#mpw').val('');
						$('#mpw_r').val('');
						$('#mpw').focus();
						return;
					}
				});//end of resetPWBtn click function
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="resetPWForm" name="resetPWForm">
			<table border="1">
				<tr>
					<td>로고 자리</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="mid" name="mid" value="<%=pwFindVO.getMid() %>">
						<input type="password" id="mpw" name="mpw" placeholder="새 비밀번호">
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" id="mpw_r" name="mpw_r" placeholder="새 비밀번호  확인">
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" id="resetPWBtn">비밀번호 수정</button>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>