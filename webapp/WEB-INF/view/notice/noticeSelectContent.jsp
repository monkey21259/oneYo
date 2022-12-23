<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="main.ict.notice.vo.NoticeVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	Object obj = request.getAttribute("scontList");
	if (obj == null) return;
	List<NoticeVO> scontList = (List<NoticeVO>)obj;
	NoticeVO nvo = scontList.get(0);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지글</title>
	</head>
	<body>
		<%=nvo.getNsubject() %>
	</body>
</html>