<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ memGrade.jsp ~~");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memInsertForm.jsp</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<div>
<form id="memInsertForm" name="memInsertForm">
회원 가입 뽐
<table>
<tr>
	<td>
		ID
	</td>
	<td>
		<input type="text" id="mid" name="mid">
	</td>
	<td>
		<input type="button" id="midBtn" name="midBtn" value="아이디 확인">
	</td>
</tr>
<tr>
	<td rowspan='2'>
		PW
	</td>
	<td>
		<input type="text" id="mpw" name="mpw">
	</td>
	<td rowspan='2'>
		<input type="button" id="mpwBtn" name="mpwBtn" value="아이디 확인">
	</td>
</tr>
<tr>
	<td>
		<input type="text" id="mpw_r" name="mpw_r">
	</td>
</tr>
<tr>
	<td>
		이름
	</td>
	<td>
		<input type="text" id="mname" name="mname">
	</td>
	<td>
	</td>
</tr>
<tr>
	<td>
		닉네임
	</td>
	<td>
		<input type="text" id="mnick" name="mnick">
	</td>
	<td>
	</td>
</tr>
<tr>
	<td>
		핸드폰
	</td>
	<td>
		<input type="text" id="mhp" name="mhp">
		- <input type="text" id="mhp1" name="mhp1">
		- <input type="text" id="mhp2" name="mhp2">
	</td>
	<td>
	</td>
</tr>
<tr>
	<td>
		이메일
	</td>
	<td>
		(( 받은 내용 표시만 하기 선택 x ))
	</td>
	<td>
	</td>
</tr>
<tr>
	<td>
		프로필
	</td>
	<td>
		<input type="file" id="mprofile" name="mprofile">
	</td>
	<td>
	</td>
</tr>
<tr>
	<td>
		LIKE
	</td>
	<td>
		<ul>
		<li>
			<input type="checkbox" class="mcategory" value="00">한식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="01">중식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="02">양식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="03">일식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="99">기타
		</li>
		</ul>
	</td>
	<td>
	</td>
</tr>
<tr>
	<td colspan="3">
		<input type="button" id="formBtn" name="formBtn" value="회원가입">
	</td>
</tr>
</table>
</form>
</div>
</body>
</html>