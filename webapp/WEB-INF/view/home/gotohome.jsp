<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mid = (String)request.getAttribute("mid");
	String mnick = (String)request.getAttribute("mnick");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

	location.href="home.ict?mid=<%=mid%>&mnick=<%=mnick%>";
	

</script>
</body>
</html>