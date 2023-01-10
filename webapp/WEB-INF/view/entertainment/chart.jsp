<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 아래 3개 이용하면 <div id="chart_div"> 영역에 동적으로 차트가 그려짐 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://www.google.com/jsapi"></script>
<script src="/oneYo/resource/js/common/common_chart.js"></script>

<title>oneYo(오내요)</title>
</head>
<body>
	<div id="chart_div">차트 영역입니다.</div>
	<button id="pieBtn">pie</button>
	<button id="barBtn">bar</button>
</body>
</html>