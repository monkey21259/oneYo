<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="main.ict.tip.vo.TipVO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("tipSelectContent.jsp 페이지 진입");
	TipVO tvo = null;
	
	if(request.getAttribute("tvo") !=null) {
		tvo = (TipVO)request.getAttribute("tvo");
		logger.info("tvo.toString() \n" + tvo.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>
</head>
<body>

</body>
</html>