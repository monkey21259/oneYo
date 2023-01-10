<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>

	$(document).ready(function(){
		
		google.charts.load('current', {'packages':['bar']});
		google.load('visualization', '1', {'packages' : ['corechart']});
		google.setOnLoadCallback(drawChart1);
		
		$(document).on("click", "#pieBtn", drawChart1);
		
		$(document).on("click", "#barBtn", drawChart2);
	});

	// 파이차트 그리기 함수
	function drawChart1() {
		//json 데이터 받아로기
		// dataType : "json" 결과값이 json 형식
		// async :false  비동기식 옵션을 끔(동기식)
		// ajax 는 비동기식이다. 즉 기본값이 비동기식 true 이다
		// 즉 차트가 그려지기 전에는 다른 작업은 하지 못한다.
		//responseText  : 서버의 응답 텍스트
		var jsonData = $.ajax({

			url : "pieChartData.ict",

			dataType : "json",

			async : false

		}).responseText;
		alert(jsonData);
		console.log(jsonData);
		//json 데이터를 데이터 테이블로 변환
		var data = new google.visualization.DataTable(jsonData);

		// 차트 그리기 (PieChart, LineChart, ColumnChart)
		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));

		//draw(데이터, 옵션)
		chart.draw(data, {
			width: 800,
			height: 480,
			is3D: true,
			title: 'oneYo(오내요) 게시판별 글 등록 현황',
			titlePosition: 'out'
		});
	}
	
	// 바차트 그리기 함수
	function drawChart2() {
		//json 데이터 받아로기
		// dataType : "json" 결과값이 json 형식
		// async :false  비동기식 옵션을 끔(동기식)
		// ajax 는 비동기식이다. 즉 기본값이 비동기식 true 이다
		// 즉 차트가 그려지기 전에는 다른 작업은 하지 못한다.
		//responseText  : 서버의 응답 텍스트
		var jsonData = $.ajax({

			url : "barChartData.ict",

			dataType : "json",

			async : false

		}).responseText;
		alert(jsonData);
		console.log(jsonData);
		//json 데이터를 데이터 테이블로 변환
		var data = new google.visualization.DataTable(jsonData);

		// 차트 그리기 (PieChart, LineChart, ColumnChart)
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));

		//draw(데이터, 옵션)
		chart.draw(data,{ 
				width:800,
				height:480,
				title: 'oneYo(오내요) 게시판별 총 조회수 현황',
				titlePosition: 'out'
				});

	}
</script>
<title>oneYo(오내요)</title>
</head>
<body>
	<div id="chart_div">차트 영역입니다.</div>
	<button id="pieBtn">pie</button>
	<button id="barBtn">bar</button>
</body>
</html>