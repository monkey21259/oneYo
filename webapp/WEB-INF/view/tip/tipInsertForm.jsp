<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("tipInsertForm.jsp 페이지 진입");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		console.log("tipInsertForm.jsp 페이지 스크립트 블럭");
		
	});

</script>
<title>오내요(oneYo)</title>
</head>
<body>
<h3>전문가 팁 게시판 글 쓰기</h3>
<hr>
<form id="tipInsertForm">
<table>
	<tr>
		<td>글제목</td>
		<td><input type="text" name="tsubject" placeholder="글 제목" size="50"></td>
	</tr>
	<tr>
		<td>팁 분야</td>
		<td>
		<select name="tcategory">
			<option value="00">요리
			<option value="01">주방관리
			<option value="02">재료정보
			<option value="99">기타
		</select>
		</td>
	</tr>
	<tr>
		<td>글내용</td>
		<td><textarea rows="10" cols="50" name="tcontent" placeholder="글 내용"></textarea></td>
	</tr>
	<tr>
		<td>사진 선택</td>
		<td><input type="file" name="tphoto"></td>
	</tr>
</table>
</form>
</body>
</html>