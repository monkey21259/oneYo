<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ memGrade.jsp ~~");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memGrade.jsp</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/oneYo/content/js/mem/memGrade.js" charset="UTF-8"></script>
<script type="text/javascript">
alert("test3");
$(document).ready(function(){
	alert("test4");
	
	$('#btn').click(function(){
		alert("plz 한글 주시오");
		testOut();
	});
	
	
});
</script>
</head>
<body>

	test 두둥 등장
	ict_mem.xml
<div>
<form id="memGradeForm">
이거 다른건디 일단 쓰던거 마저 쓰기 ㅎㅎ;;

<p id="testtest">

</p>
<button type="button" id="btn">테스틍</button>

<table>
<tr>
<td>
<input type="text" id="memail" name="memail">
@ <input type="text" id="memail" name="memail">
<select>
<option value="0">선택해주세요.</option>
<option value="1">gmail.com</option>
<option value="2">naver.com</option>
<option value="3">kakao.com</option>
<option value="4">직접 입력</option>
</select>
</td>
</tr>
<tr>
<td>
<input type="button" id="memailBtn" name="memailBtn" value="이메일 인증">
</td>
</tr>
</table>
</form>
</div>
</body>
</html>