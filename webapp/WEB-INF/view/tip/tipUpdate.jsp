<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	location.href="tipSelectContent.ict?tnum=<%= request.getAttribute("tnum") %>";
</script>
</head>
<body>
</body>
</html>