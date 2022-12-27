<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ mypagePWChk.jsp ~~");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypagePWChk.jsp</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert("mypagePWChk.jsp");
	
	$(document).on('click', '#mpwBtn', function(){
		alert("#mpwBtn");
		
		$('#pwCheckForm').attr({
			 'action'	: "profileSelect.ict"
			,'method'	: "POST"
			,"enctype"	: "application/x-www-form-urlencoded"
		}).submit();
		
	});
});
</script>
</head>
<body>
하나도 안건드렸어요!!!!
<form id="pwCheckForm">
<input type="text" id="mpw" name="mpw">
<input type="button" id="mpwBtn" value="비밀번호 확인">
<!-- 임의 -->
<input type="hidden" id="mnum" name="mnum" value="M202212260012">
<input type="hidden" id="mkey" name="mkey" value="PWCHECK">
</form>

</body>
</html>