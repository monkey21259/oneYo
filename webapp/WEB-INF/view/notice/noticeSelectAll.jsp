<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="main.ict.notice.vo.NoticeVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	Object obj = request.getAttribute("sallList");
	if (obj == null) return;
	List<NoticeVO> sallList = (List<NoticeVO>)obj;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			for(int i=0; i<sallList.size(); i++){
				NoticeVO nvo = sallList.get(i);
		%>
		<%=nvo.getNnum() %>, <%=nvo.getNsubject() %>, <%=nvo.getNcontent() %>, <%=nvo.getNphoto() %>, <%=nvo.getUpdatedate() %>, <%=nvo.getNhit() %><br>
		<%
			}//end of for
		%>
	</body>
</html>