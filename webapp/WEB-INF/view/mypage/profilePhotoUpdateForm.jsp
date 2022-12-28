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
	
	logger.info("~~ profilePhotoUpdateForm.jsp ~~");
%>

<%
	String mkey = "";
	mkey = request.getParameter("mkey");
	
	logger.info("mkey >>> : " + mkey);
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
<title>profilePhotoUpdateForm.jsp</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
profilePhotoUpdateForm.jsp
<table>
<tr>
	<td>
	닉네임
	</td>
	<td>
	<%= mvo.getMnick() %>
	</td>
	<td rowspan="2">
	<input type="button" class="mprBtn" value="사진 및 닉네임 변경">
	</td>
</tr>
<tr>
	<td>
	프로필 사진
	</td>
	<td>
	<img src="/oneYo/img/mem/<%= mvo.getMprofile() %>" width="150" height="150" alt="image">
	<br><%= mvo.getMprofile() %>
	</td>
</tr>
</table>
<%
	}
}
%>
</body>
</html>