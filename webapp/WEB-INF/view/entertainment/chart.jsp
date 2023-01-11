<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 아래 5개 이용하면 <div id="chart_div"> 영역에 동적으로 차트가 그려짐 -->
<!-- 구글 차트는 div에 직접 그려지고 chart.js는 div > canvas에 그려짐 	 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://www.google.com/jsapi"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script>
<script src="/oneYo/resource/js/common/common_chart.js"></script>

<title>oneYo(오내요)</title>
</head>
<body>
	<div id="chart_div">차트</div>
	<button id="googlePieBtn">구글 파이차트</button>
	<button id="googleBarBtn">구글 바차트</button>
	<button id="chartjsPieBtn">chart.js 파이차트</button>
	<button id="chartjsBarBtn">chart.js 바차트</button>
</body>
</html>