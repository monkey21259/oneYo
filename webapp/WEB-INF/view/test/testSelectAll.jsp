<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.List" %>
<%@ page import="main.ict.test.vo.TestVO" %>
<%
	Object obj = request.getAttribute("list");
	List<TestVO> list = (List<TestVO>)obj;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	for(int i=0; i<list.size(); i++){
		TestVO tvo = list.get(i);
%>
<%= tvo.getEmpno() %>, <%=tvo.getEname() %><br>
<%
	}
%>
</body>
</html>