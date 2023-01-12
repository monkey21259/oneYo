<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %><!-- 식품안전나라 RSS -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
	String mnick = (String)oSession.getAttribute(request, "mnick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes" />
<title>oneYo(오내요)</title>

<!-- jQuery -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css" charset="UTF-8">

<!-- entertainment.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/entertainment/entertainment.css" charset="UTF-8">	

<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>

<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"  charset="UTF-8"></script>
	
<!-- 네이버 지도 AIP -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9grmlwqclh"></script>

<!-- 채팅 css -->
<link rel="stylesheet" href="/oneYo/resource/css/common/chat.css"  charset="UTF-8">
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
		
		
		
		//식품나라 더보기 버튼
		$(document).on("click", "#more_btn", function(){
			window.open("https://www.foodsafetykorea.go.kr/portal/board/board.do?menu_grp=MENU_NEW01&menu_no=3120");
			
		}); //more_btn
		
		//all.js 에 있는 모든 함수 연결
		allJavaScript();
		
		
	});//ready


</script>
	
</head>
	<body>
		<div id="realAll">

<div id="backMenu"></div>

<div id="sideBar">
	<input type="checkbox" id="sideMenu" name="sideMenu" hidden>
	<label for="sideMenu" id="sideLabel">&lt;&lt;&nbsp;&nbsp;&nbsp;</label>
	<div class="sidebar">
	<ul>
		<li class="item">
			<div class="homeLink">
			<span>
			홈으로
			</span>
			</div>
		</li>
		<li class="item">
			<div class="searchBarBtn">
			<span>
			검색
			</span>
			</div>
		</li>

		<li class="item">
			<div class="warningForm">
			<span>
				신고
			</span>
			</div>
		</li>
		<li class="item">
<%
      if (mid == null || !(mid.equals("admin"))) {
%>
	         <div class="mypageHome">
	         <span>
	         	마이<br>페이지 
	         </span>
	         </div>
<%
      } else if (mid.equals("admin")) {
%>
	         <div class="adminHome">
	         <span>
		         	관리자<br>페이지 
	         </span>
	         </div>
<%
      }
%>
      	</li>
		<li class="item">
			<a href="javascript:window.scrollTo(0,0);">
			<div id="go_top">
			<span>
			TOP▲
			</span>
			</div>
			</a>
		</li>
	</ul>
	</div>

<div id="searchBar" class="hidden_X">
<!-- <div id="searchBar" class="hidden_O"> -->
	<div class="searchBarBtn">
		X
	</div>
	<div>
		<jsp:include page="/WEB-INF/view/recipe/recipePage.jsp" flush="true">
				<jsp:param value="" name=""/>
		</jsp:include>	
	</div>
</div>

<div id="singo" class="hidden_X">
	<div class="warningForm">
		X
	</div>
	<jsp:include page="/WEB-INF/view/warning/warningPage.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>	
</div>

<div id="shadow" class="hidden_X"></div>

<div id="all_div">

<div id="header">
	<div id="logoLeft" class="logoSide">
<!-- 	로고 옆공간 좌측 -->
	</div>
	<div id="logo" class="homeLink">
		<img alt="오내요" src="/oneYo/resource/img/oneYo_logo.png">
		<!-- 379 X 186 -->
	</div>
	<div id="logoRight" class="logoSide">
<!-- 	로고 옆공간 우측 -->
	 	<div id="loginDiv">
<%
		if (mid == null || mid.equals("")) {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
<%
		} else {
%>
			<div class="loginBtnDiv">
<%
			if(mid.equals("admin")){
%>
				<span class="Choonsik adminHome">관리자페이지</span>
<%
			}else{
%>
				<span class="Choonsik mypageHome">마이페이지</span>
<%
			}
%>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="logoutBtn">로그아웃</span>
<%
			String mSNSid = mid;  // M22...
			if (mid != null && !(mid.equals(""))) {
				if (mid.length() > 5) {
					String checkSNS = mid.substring(0, 6);
					if (checkSNS.equals("naver_")) {
						mSNSid = "naver"; 
					}
					if (checkSNS.equals("kakao_")) {
						mSNSid = "kakao";
					}
				}
			}
%>
				<p><%= mSNSid %> <span>님 환영합니다.</span></p>
	 		</div>
	 		<p></p>
	 		<form id="logoutForm">
	 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
	 		</form>
<% 		
		}
%>
	 	</div>
	</div>
	
<div class="nav">
	<!-- 상단 메뉴바 -->
		<nav>
		<ul>
			<li>
				<div class="menu">
					<a href="recipeSelectAll.ict" class="menu_link">
						<div>
							레시피
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="tipSelectAll.ict" class="menu_link">
						<div>
							Tip
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="communitySelectAll.ict" class="menu_link">
						<div>
							커뮤니티
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="noticeSelectAll.ict" class="menu_link">
						<div>
							공지사항
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="pulsMenu">
					<div class="menu">
						<a href="entertainment.ict" class="menu_link">
							<div>
								더보기
							</div>
						</a>
					</div>
					<div class="sub-menu">
					<ul>
						<li>
							<a href="entertainment.ict" class="menu_link">
							<div>
							엔터테이먼트
							</div>
							</a>
						</li>
						<li>
							<a href="chart.ict" class="menu_link">
							<div>
							차트
							</div>
							</a>
						</li>
						<li>
							<a href="goCalendar.ict" class="menu_link">
							<div>
							일정 관리
							</div>
							</a>
						</li>
					</ul>
					</div>
				</div>
			</li>
		</ul>
		</nav>
	</div>
</div>

<div id="center_e">
<!-- -------------------------------페이지 전용 center------------------------------- -->

<!-- 식품안전나라 rss -->
<div class="line"></div>
<div class="anne_e">
	<p class="subject_e">식품안전지식</p>
</div>
<div id="food_container">
	
	<c:import var="foodInfo" url="https://www.foodsafetykorea.go.kr/rss/rss.do?bbs_no=bbs001&menu_no=3120&menu_grp=MENU_NEW01"/>
	<x:parse var="foodInfo" xml="${foodInfo}"></x:parse>

	<ul>
	    <x:forEach select="$foodInfo/rss/channel/item" begin="0" end="10">
		<div id="food_box">	   
	       <a href="https://www.foodsafetykorea.go.kr/<x:out select="./link"/>" class="food_alink" target="_blank">
	        <li>
            	<span id="arrow">⤷ &nbsp;</span><x:out select="./title"/>
	        </li>
	       </a>
	  	</div>
	    </x:forEach>
	</ul>
	<div id="m_btn">
		<div id="more_btn">더보기</div>
	</div>
</div>
<!-- =============================================================== -->
<div class="line"></div>
<!-- 날씨 -->

<div class="anne_e">
	<p class="subject_e">현재 내 위치 날씨 예보</p>
</div>

	<div id="weather_container">
					
					<table id="weathertable">
						<thead>
							<tr>
								<th>발표일자</th>
								<th>발표시각</th>
								<th>기온</th>
								<th>습도</th>
								<th>날씨 상태</th>
							</tr>
							</thead>
							<tr>
								<td id="date"></td>
								<td id="time"></td>
								<td id="temp"></td>
								<td id="reh"></td>
								<td id="icon"></td>
							</tr>
					</table>
	</div>
		<hr>
<!-- =============================================================== -->
<div id="enter_block">   </div>
<div class="line"></div>
<!-- 지도-->

<!-- 37.478853, 126.879367 -->
 <div class="anne_em">
	<p class="subject_e">오내요 개발자 센터</p>
</div>
<table class="map_table">
		<thead>
		<tr>
			<th>[네이버 지도]</th>
			<th>[다음 카카오 지도]</th>
		</tr>
		</thead>
		<tbody>
<div class="map_container">
	<tr>
		<td>
			<div id="naver_map" >
			
				<div id="wrap" class="section">	
				    <div id="map"></div>
				    <code id="snippet" class="snippet"></code>
				</div>
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
			        '       <div id="m_logo_img"><img src="http://localhost:8088/oneYo/resource/img/oneYo_logo.png" alt="오내요" class="thumb" /></div>',
			        '   <p>서울특별시 금천구 가산동 426-5</p>',
			        '       <p>가산디지털단지역 5번출구 5분거리</p>',
			        '       <a href="http://localhost:8088/oneYo/home.ict" target="_blank" id="m_home_link">오내요 홈페이지 가기</a>',
			        '   </p>',
			        '</div>'
			    ].join('');
			
	// 정보창
			var infowindow = new naver.maps.InfoWindow({
			    content: contentString,
			    maxWidth: 300,
			    backgroundColor: "white",
			    borderColor: "#93A603",
			    borderWidth: 1,
			    borderradius:15,
			    /*말꼬리*/
			    anchorSize: new naver.maps.Size(20, 20), 
			    anchorSkew: true,
			    anchorColor: "white",
			    pixelOffset: new naver.maps.Point(0, 0)
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
			</td>
			<td>
			<%@ include file="./kakao_map.jsp" %>
			</td>
			</tr>
			</div> <!-- map_containe -->
		</tbody>
	</table>



<!-- 채팅 -->
<jsp:include page="./chat.jsp">
	<jsp:param value="<%=mnick %>" name="mnick"/>
</jsp:include>
<!-- -------------------------------페이지 전용 center------------------------------- -->
</div>

<!-- common_count.js 자바스크립트 임포트하면 span태그에 값이 바인딩 됨. -->
<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
	</div>
	<div>
		<span></span> / <span></span><br />
		<span></span> / <span></span><br />
	</div>
</div>

</div>
</div>