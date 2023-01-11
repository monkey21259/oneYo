<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<% request.setCharacterEncoding("UTF-8"); %>

<% 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("expertLevelup.jsp 페이지");
	
	String mnum = "";
	String mgrade = "";
	
	if(request.getAttribute("mnum") !=null)
		mnum = (String)request.getAttribute("mnum");
	
	if(request.getAttribute("mgrade") !=null)
		mgrade = (String)request.getAttribute("mgrade");
	
	logger.info("모델로 넘겨받은 data : mnum > " + mnum);
	logger.info("모델로 넘겨받은 data : mgrade > " + mgrade);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	location.href = "levelupInsertForm.ict?mnum=" + "<%= mnum %>" + "&mgrade=" + "<%= mgrade %>";
</script>
</body>
</html>