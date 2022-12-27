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
	
	logger.info("~~ memGrade.jsp ~~");
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
<title>profileSelect.jsp</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert("profileSelect.jsp");
});
</script>
</head>
<body>
profileSelect.jsp
<hr>
 MNUM<br>
<%= mvo.getMnum() %>
<hr>
,MID<br>
<%= mvo.getMid() %>
<hr>
,MPW<br>
<%= mvo.getMpw() %>
<hr>
,MNAME<br>
<%= mvo.getMname() %>
<hr>
,MNICK<br>
<%= mvo.getMnick() %>
<hr>
,MHP<br>
<%= mvo.getMhp() %>
<hr>
,MEMAIL<br>
<%= mvo.getMemail() %>
<hr>
,MGRADE<br>
<%= mvo.getMgrade() %>
<hr>
,MPROFILE<br>
<img src="/oneYo/img/mem/<%= mvo.getMprofile() %>" width="150" height="150" alt="image">
<%= mvo.getMprofile() %>
<hr>
,MCATEGORY<br>
<%= mvo.getMcategory() %>
<hr>
,MWARNING<br>
<%= mvo.getMwarning() %>
<hr>
,DELETEYN<br>
<%= mvo.getDeleteyn() %>
<hr>
,INSERTDATE<br>
<%= mvo.getInsertdate() %>
<hr>
,UPDATEDATE<br>
<%= mvo.getUpdatedate() %>
<%
	}
}
%>
</body>
</html>