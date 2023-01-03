<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<% Logger logger = LogManager.getLogger(this.getClass()); %>

<%
	String client_id = ""; 
	if (request.getAttribute("client_id") != null) {
		client_id = (String)request.getAttribute("client_id");
		logger.info("client_id: " + client_id);
	}
	String client_secret = ""; 
	if (request.getAttribute("client_secret") != null) {
		client_secret = (String)request.getAttribute("client_secret");
		logger.info("client_secret: " + client_secret);
	}
%>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		
			$(document).ready(function() {
<%
			if (!(client_id.equals("")) && !(client_secret.equals(""))) {
				logger.info("폼태그 이동");
%>
				$("#homeForm").attr({
					"action": "/oneYo/home.ict",
					"method": "GET",
					"enctype": "application/x-www-form-urlencoded"
				}).submit();
<%
			} else {
				logger.info("location.href 이동");
%>
				location.href="home.ict";
<%
			}
%>
			}); // $(document).ready({})
			
		</script>
	</head>
	<body>
		<form id="homeForm">
			<input type="hidden" name="client_id" value="<%= client_id %>" />
			<input type="hidden" name="client_secret" value="<%= client_secret %>" />
		</form>
	</body>
</html>