<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %><!-- 식품안전나라 RSS -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9grmlwqclh"></script>
<script type="text/javascript">



	$(document).ready(function(){
		
		let date = new Date();
		let ymd = "" + date.getFullYear() + (('0' + (date.getMonth() +1)).slice(-2)) + (('0' + (date.getDate())).slice(-2));
		console.log(ymd);
		
		let hm = baseTime();
		console.log(baseTime());
		
		
		let url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=hwNs%2FusueAUixJQYpKUbBkL7fqiFsSR%2Bco9h8thIFzsiLorGrzadUQ9Ng7qCoJSGcIogT3BSXWX1mfpF5%2Bv24g%3D%3D&numOfRows=10&pageNo=1&base_date="
				+ ymd + "&base_time=" + hm + "&nx=58&ny=125&dataType=JSON";
		
		// 단기예보 문서 참고 : 강수 코드값
		let weather_icon = {
	    		'0' : 'http://www.weather.go.kr/images/icon/NW/NB01.png',
	    		'1' : 'http://www.weather.go.kr/images/icon/NW/NB08.png',
	    		'2' : 'http://www.weather.go.kr/images/icon/NW/NB12.png',
	    		'3' : 'http://www.weather.go.kr/images/icon/NW/NB11.png',
	    		'5' : 'http://www.weather.go.kr/images/icon/NW/NB20.png',
	    		'6' : 'http://www.weather.go.kr/images/icon/NW/NB22.png',
	    		'7' : 'http://www.weather.go.kr/images/icon/NW/NB21.png'
	    	};
		
		// 단기예보 문서 참고 : 강수 코드값
		let weather_stat = {
				'0' : '맑음',
				'1' : '비',
				'2' : '비 또는 눈',
				'3' : '눈',
				'5' : '가끔 비',
				'6' : '가끔 비 또는 눈',
				'7' : '가끔 눈'
				
		};
		
		$.ajax({
			url: url,
			type: "GET",
			dataType: "json",
			success: function(data){
				
				console.log(data);
				
				// 발표 시간
				let base_date = data['response']['body']['items']['item'][0]['baseDate'];
				let base_time = data['response']['body']['items']['item'][0]['baseTime'];
				
				// 강수형태 없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7) 
				let pty_category = data['response']['body']['items']['item'][0]['category'];
				let pty_obsrValue = data['response']['body']['items']['item'][0]['obsrValue'];
				
				// 습도 단위  %
				let reh_category = data['response']['body']['items']['item'][1]['category'];
				let reh_obsrValue = data['response']['body']['items']['item'][1]['obsrValue'];
				
				// 기온 단위 ℃
				let t1h_category = data['response']['body']['items']['item'][3]['category'];
				let t1h_obsrValue = data['response']['body']['items']['item'][3]['obsrValue'];
				
				
				let date_div = document.querySelector("#date");
				date_div.innerText = dateFormat(base_date);
				
				let time_div = document.querySelector("#time");
				time_div.innerText = timeFormat(base_time);
				
				let icon_div = document.querySelector("#icon");
				icon_div.innerHTML = "<img id='imgtemp' src='" + weather_icon[pty_obsrValue] + "'>" + weather_stat[pty_obsrValue];
				
				let temp_div = document.querySelector("#temp");
				temp_div.innerText = t1h_obsrValue + " ℃";
				
				let reh_div = document.querySelector("#reh");
				reh_div.innerText = reh_obsrValue + "%";
				
			}
		
		});
		
		function dateFormat(yyyymmdd){
			let mmdd = yyyymmdd.substr(4);
			let mm = mmdd.substr(0,2);
			let dd = mmdd.substr(2);
			mmdd = mm + "월" + dd + "일";
			return mmdd;
		}
		
		function timeFormat(hhmm){
			let hh = hhmm.substr(0,2);
			let mm = hhmm.substr(2);
			hhmm = hh + "시" + mm + "분";
			return hhmm;
		}
		
		// base_time : API에서 매시 40분 이후로 최신 정보가 갱신됨.
		function baseTime(){
			let hm = "";
			if (date.getMinutes() > 40){
				hm = ('0' + date.getHours()).slice(-2) + '00';
			}else{
				hm = ('0' + (date.getHours() - 1)).slice(-2) + '00';
			}
			return hm;
		}
		
		
		function numpad(date){
			date = date.toString();	
			
			if(date.length == 1){
				
				date = "0" + date;
			}else {
				date = date;
			}	
			return date;
		}
	});


</script>
<style>
	.iw_inner{
	width:400px;
	}


</style>		
</head>
<body>
<c:import var="foodInfo" url="https://www.foodsafetykorea.go.kr/rss/rss.do?bbs_no=bbs001&menu_no=3120&menu_grp=MENU_NEW01"/>
<x:parse var="foodInfo" xml="${foodInfo}"></x:parse>
<ul>
    <x:forEach select="$foodInfo/rss/channel/item" begin="0" end="10">
        <li>
            <a href="https://www.foodsafetykorea.go.kr/<x:out select="./link"/>" target="_blank">
                <x:out select="./title"/>
            </a>
        </li>
    </x:forEach>
</ul>
<br>
<div class="container">
					
					
					<table id="weathertable" align="center" width="80%">
							<tr>
							<td colspan="5"><h3>현재 내 위치 날씨 예보</h3>
							</td>
							</tr>
							<tr>
								<td align="center">발표일자</td>
								<td align="center">발표시각</td>
								<td align="center">기온</td>
								<td align="center">습도</td>
								<td align="center">날씨 상태</td>
							</tr>
							<tr style="height:100;">
								<td align="center" id="date" height="50px"></td>
								<td align="center" id="time"></td>
								<td align="center" id="temp"></td>
								<td align="center" id="reh"></td>
								<td align="center" id="icon"></td>
							</tr>
					</table>
				</div>


<!-- 37.478853, 126.879367 -->
 
 <div id="wrap" class="section">
    <h2>오내요 개발자 센터</h2>
    <div id="map" style="width:70%;height:600px;"></div>
    <code id="snippet" class="snippet"></code>
</div>
<script id="code">
var HOME_PATH = window.HOME_PATH || '.';

var cityhall = new naver.maps.LatLng(37.478853, 126.879367),
    map = new naver.maps.Map('map', {
        center: cityhall.destinationPoint(0, 500),
        zoom: 15
    }),
    marker = new naver.maps.Marker({
        map: map,
        position: cityhall
    });

var contentString = [
        '<div class="iw_inner" id="nmap">',
        '   <h3>오내요 개발자 센터</h3>',
        '   <p>서울특별시 금천구 가산동 426-5<br />',
        '       <img src="http://localhost:8088/oneYo/resource/img/oneyo_logo.png" width="55" height="55" alt="오내요" class="thumb" /><br />',
        '       가산디지털단지역 5번출구 5분거리<br />',
        '       <a href="http://localhost:8088/oneYo/home.ict" target="_blank">오내요 홈페이지 가기/</a>',
        '   </p>',
        '</div>'
    ].join('');


var infowindow = new naver.maps.InfoWindow({
    content: contentString
});

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});

infowindow.open(map, marker);
</script>
</body>
</html>