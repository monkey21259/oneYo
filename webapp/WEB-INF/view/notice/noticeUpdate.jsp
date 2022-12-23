<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="main.ict.notice.vo.NoticeVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	Object obj = request.getAttribute("nvo");
	if (obj == null) return;
	NoticeVO nvo = (NoticeVO)obj;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<script>
			alert("게시글이 수정되었습니다.");
			location.href="noticeSelectContent.ict?nnum=<%=nvo.getNnum()%>";
		</script>
	</body>
</html>