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
<%
	String mnum = "";
	mnum = request.getParameter("mnum");
	
	logger.info("mnum >>> : " + mnum);
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
		
		$('#mkey').val("PWCHECK");
		
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
회원 번호 = <%= mnum %> ((관리자는 접속시 비밀번호 확인하세용))
<form id="pwCheckForm">
<input type="text" id="mpw" name="mpw">
<input type="button" id="mpwBtn" value="비밀번호 확인">
<input type="hidden" id="mnum" name="mnum" value="<%= mnum %>">
<input type="hidden" id="mkey" name="mkey" value="">
</form>

</body>
</html>