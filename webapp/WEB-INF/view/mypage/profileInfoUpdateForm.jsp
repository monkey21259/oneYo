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
	
	logger.info("~~ profileInfoUpdateForm.jsp ~~");
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
<title>profileInfoUpdateForm.jsp</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

profileInfoUpdateForm.jsp
<table>
<tr>
	<td>
	아이디
	</td>
	<td>
	<input type="hidden" id="mnum" name="mnum" value="<%= mvo.getMnum() %>">
	<input type="hidden" id="mkey" name="mkey" value="">
	<%= mvo.getMid() %>
	</td>
	<td rowspan="4">
	<input type="button" class="memBtn" value="개인정보 수정">
	</td>
</tr>
<!-- 기타 -->
<tr>
	<td>
	이름
	</td>
	<td>
	<%= mvo.getMname() %>
	</td>
</tr>
<tr>
	<td>
	전화번호
	</td>
	<td>
	<%= mvo.getMhp() %>
	</td>
</tr>
<tr>
	<td>
	선호하는 요리분야
	</td>
	<td>
	<%= mvo.getMcategory() %>
	</td>
</tr>
</table>

<%
		}
	}
%>
</body>
</html>