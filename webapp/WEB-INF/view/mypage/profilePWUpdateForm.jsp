<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.ict.mem.vo.MemVO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ profilePWUpdateForm.jsp ~~");
%>

<%
	Object obj = null;
	obj = request.getAttribute("list");
	
	if (obj == null) return;
	
	List<MemVO> list = null;
	list = (List<MemVO>)obj;
	
	if (list != null && list.size() > 0) {
		logger.info("list.size() >>> : " + list.size());
		
		for (int i = 0; i < list.size(); i++) {
			
			MemVO mvo = list.get(i);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profilePWUpdateForm.jsp</title>
</head>
<body>
profilePWUpdateForm.jsp
<table>
<tr>
	<td>
	비밀번호
	</td>
	<td>
	<%= mvo.getMpw() %>
	</td>
	<td>
	<input type="button" class="mpwBtn" value="비밀번호 변경">
	</td>
</tr>
</table>

<%
		}
	}
%>
</body>
</html>