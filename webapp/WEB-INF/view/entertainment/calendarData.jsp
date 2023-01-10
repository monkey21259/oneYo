<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.util.List" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
</head>
<body>
<%
	Object obj = request.getAttribute("jsonCalendar");
	JSONArray jsonCalendar = null;	
	if(obj!=null){
		jsonCalendar = (JSONArray)obj;
		System.out.println("jarr >>> : " + jsonCalendar);
		out.println("jarr >>> : " +jsonCalendar);
	}
	
	Object obj1 = request.getAttribute("nCnt");
	if(obj1!=null){
		int nCnt = ((Integer)obj1).intValue();
		out.println("nCnt >>> : " + nCnt);
	}
	
%>
</body>
</html>
<?xml version='1.0' encoding='UTF-8'?>
<calendar>
	<result><%= jsonCalendar %></result>	
</calendar>
</body>