<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="main.ict.mem.vo.MemVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	Object obj = request.getAttribute("idShowVO");
	MemVO idShowVO = (MemVO)obj;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>가입한 아이디</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<form id="idShowForm" name="idShowForm">
			<table border="1">
				<tr>
					<td colspan="2">로고 자리</td>
				</tr>
				<tr>
					<td><%=idShowVO.getMid() %></td>
					<td><%=idShowVO.getInsertdate() %></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="loginForm.ict">로그인</a>&nbsp;|
						<a href="pwFindForm.ict">비밀번호 찾기</a>&nbsp;|
						<a href="memGrade.ict">회원가입</a>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>