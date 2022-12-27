<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ memInsertEmail.jsp ~~");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memInsertEmail.jsp</title>
</head>
<body>
이메일이 전송되었습니다.
<a href="home.ict">돌아가기</a><br>
<a href="memGrade.ict">다시 인증하기</a>
</body>
</html>