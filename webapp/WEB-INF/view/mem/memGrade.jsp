<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	String mid = "";
	String mpw = "";
	String mname = "";
	String mnick = "";
	String memail = "";
	String mhp = "";
	String mkey = "";
	String access_token = "";
%>
<%  // 추가: 김기영 - SNS 로그인 시 회원가입일 경우 (221227)
	MemVO mvo = (MemVO)request.getAttribute("mvoSNS");
	if (mvo != null) {
		access_token = mvo.getAccess_token();	
	}
	boolean snsFlag = false;
	if (mvo != null && access_token != null) {
		logger.info("SNS 로그인 후 넘어온 등급 선택창 << snsFlag = true >>");
		snsFlag = true;
		
		// DTO 세팅
		mid = mvo.getMid();
		mpw = mvo.getMpw();
		mname = mvo.getMname();
		mnick = mvo.getMnick();
		memail = mvo.getMemail();
		mhp = mvo.getMhp();
		mkey = mvo.getMkey();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memGrade.jsp</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<!-- memGrade.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/mem/memGrade.css">
<script type="text/javascript">

alert("test3");
$(document).ready(function(){
	alert("test4");
	
	//	일반/전문가 등급 정하기				=====
	$(document).on('click', '.btn', function(){
		alert("plz 한글 주시오");
		let grade = $(this).find('input').val();
		
		if (grade == '0') {
			$('#mgrade').val('0');
			$('#testtest').html("일반");
		}
		if (grade == '1') {
			$('#mgrade').val('1');
			$('#testtest').html("전문가");
		}
		
		
	});	//	$('.btn').click()		=====
	
	//	이메일 선택 박스 변경시 text변경되는 함수		=====
	$(document).on('change', '#memail2', function(){
		alert("memail2 >>> : " + $('#memail2').val());
		
		let emails = ["", "gmail.com", "naver.com", "kakao.com", ""];
		let emailKey = parseInt($('#memail2').val());
		alert("email2 >>> : " + emails[emailKey]);
		
		$('#memail1').val(emails[emailKey]);
		if (emailKey == '4') {
			$('#memail1').attr("readonly", false);
			$('#memail1').focus();
		} else {
			$('#memail1').attr("readonly", true);
		}
	});	//	$('#memail2').change()		=====
	
	
	//	form 전송하기						=====
	$(document).on('click', '#memailBtn', function(){
		alert("#memailBtn >>> : "
				+ $('#memail0').val() + "@" + $('#memail1').val()
				+ "/" + $('#mgrade').val());
		
		let cnt = 0;
		
		$('.memail').each(function(){
			
			if ($(this).val() == "" || $(this).val() == null) {
				cnt += 1;
				
				alert("이메일을 마저 작성 해주세요.");
				$("#memail0").focus();
				
				return false;
			}
		});
		
		if (cnt == 0) {
			
			let memail = $('#memail0').val() + "@" + $('#memail1').val();
			
			$('#memail').val(memail);
			
			console.log("#memail >>> : " + $('#memail').val());
			
			let link = "/oneYo/memInsertEmail.ict"
								+ "?mgrade=" + $('#mgrade').val()
								+ "&memail=" + $('#memail').val();
			
			alert(link);
		
			location.href = link;
		}
		
	});	//	$('#memailBtn').click()		=====
	
	$("#insertFormBtn").on("click", function() {
		
		console.log("[SNS] 다음 버튼 클릭");
		console.log("SNS > 일반/전문가 > INSERT_FORM");
		$("#memGradeForm").attr({
			"action" : "/oneYo/memInsertForm.ict",
			"method" : "GET",
			"enctype": "application/x-www-form-urlencoded"
		}).submit();

	});
	
	//	검색 바 없어졌다 생기기 액션주는 all.js 함수
	hiddenAction();
	//	홈으로 보내주는 all.js 함수
	homeAction();
	//	메뉴바 클릭액션 all.js 함수
	divClickAction();
	
	//로그아웃
	$("#logoutBtn").on("click", function() {
		$("#logoutForm").attr({
			"action": "logout.ict",
			"method": "GET",
			"enctype": "application/x-www-form-urlencoded"
		}).submit();
	});
			
	//all.js 에 있는 모든 함수 연결
	allJavaScript();
	
});  // document.ready
</script>
</head>
<body>

<form id="memGradeForm">

<div id="realAll">

<div id="backMenu"></div>

<div id="sideBar">
	<label for="sideMenu"><div>▼<br>▽<br>▼</div></label>
	<input type="checkbox" id="sideMenu" name="sideMenu" hidden>
	<ul>
		<li class="item">
			<div class="homeLink">
			홈으로
			</div>
		</li>
		<li class="item">
			<div class="searchBarBtn">
			검색
			</div>
		</li>
		<li class="item">
			<div id="warningForm">
			신고
			</div>
		</li>
		<li class="item">
			<div class="warningForm">
			신고<br>팝업
			</div>
		</li>
		<li class="item">
			<div class="searchBarBtn">
			my<br>Page
			</div>
		</li>
		<li class="item">
			<a href="javascript:window.scrollTo(0,0);">
			<div id="go_top">
			TOP▲
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
	검색바 여기에 넣기
	<input type="text" id="searchText" name="serchText">
	<input type="button" id="searchTextBtn" value="검색">
</div>

<div id="singo" class="hidden_X">
	<div class="warningForm">
		X
	</div>
	신고 인클루드 이쪽으로
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
// 		if (mnick == null || mnick.equals("")) {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
<%
// 		} else {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik mypageHome">마이페이지</span>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="logoutBtn">로그아웃</span>
<%-- 				<p><%= mnick %> <span>님 환영합니다.</span></p> --%>
	 		</div>
	 		<p></p>
	 		<form id="logoutForm">
<%-- 	 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" /> --%>
	 		</form>
<% 		
// 		}
%>
	 	</div>
	</div>
	
	<div class="nav">
	<!-- 상단 메뉴바 -->
		<nav>
		<ul>
			<li>
				<a href="recipeSelectAll.ict" class="menu_link">
				<div>
				레시피
				</div>
				</a>
			</li>
			<li>
				<a href="tipSelectAll.ict" class="menu_link">
				<div>
				Tip
				</div>
				</a>
			</li>
			<li>
				<a href="communitySelectAll.ict" class="menu_link">
				<div>
				커뮤니티
				</div>
				</a>
			</li>
			<li>
				<a href="noticeSelectAll.ict" class="menu_link">
				<div>
				공지사항
				</div>
				</a>
			</li>
			<li>
				<a href="#" class="menu_link">
				<div>
				더보기
				</div>
				</a>
			</li>
		</ul>
		</nav>
	</div>
	
</div>

<div id="center">
<!-- -------------------------------페이지 전용 center------------------------------- -->
<div id="anne">
회원 가입 등급
</div>

<div class="grade_btn">
	<div class="gradeTitle">
		<table>
			<tr>
			<td>
				<span>
					일반 회원
				</span>
			</td>
			<td class="between"></td>
			<td class="between"></td>
			<td>
				<span>
					전문가 회원
				</span>
			</td>
			</tr>
		</table>
	</div>
	<div class="gradeImg">
		<table>
			<tr>
			<td>
				<div class="btn">
				<img alt="일반" src="/oneYo/resource/img/grade0.png">
		<!-- 		<img alt="일반" src="/oneYo/resource/img/grade0_1_1.png"> -->
		<!-- 		<img alt="일반" src="/oneYo/resource/img/grade0_1_2.png"> -->
				<input type="hidden" value="0">
				</div>
			</td>
			<td class="between"><div id="beLeft"></div></td>
			<td class="between"></td>
			<td>
				<div class="btn">
				<img alt="전문가" src="/oneYo/resource/img/grade1.png">
				<input type="hidden" value="1">
				</div>
			</td>
			</tr>
		</table>
	</div>
	<input type="hidden" id="mgrade" name="mgrade" value="0">
	<p id="testtest">
	일반
	</p>
</div>

<table>
<%  // 추가 kgy
	if (snsFlag == false) {
%>
<tr>
<td>
	<input type="text" id="memail0" name="memail0">
	@ <input type="text" id="memail1" name="memail1" readonly>
	<select id="memail2">
		<option value="0">선택해주세요.</option>
		<option value="1">gmail.com</option>
		<option value="2">naver.com</option>
		<option value="3">kakao.com</option>
		<option value="4">직접 입력</option>
	</select>
	<input type="hidden" id="memail" name="memail" value="">
</td>
</tr>
<tr>
<td>
	<input type="button" id="memailBtn" name="memailBtn" value="이메일 인증">
</td>
</tr>
<%	// 추가 kgy
	} else {
%>
	<tr>
		<td>
			<input type="button" name="insertFormBtn" id="insertFormBtn" value="다음" />
			<input type="hidden" name="mid" value="<%= mid %>" />
			<input type="hidden" name="mpw" value="<%= mpw %>" />
			<input type="hidden" name="mname" value="<%= mname %>" />
			<input type="hidden" name="mnick" value="<%= mnick %>" />
			<input type="hidden" name="memail" value="<%= memail %>" />
			<input type="hidden" name="mhp" value="<%= mhp %>" />
			<input type="hidden" name="access_token" value="<%= access_token %>" />
			<input type="hidden" name="mkey" value="<%= mkey %>" />
		</td>
	</tr>
<%
	}
%>
</table>
<!-- -------------------------------페이지 전용 center------------------------------- -->
</div>

<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
		<span>팀 소개: ~~~</span>
	</div>
	<div>
		<span>회원 수: ${ Count.get(0).membercnt }명</span> / <span>레시피글 수: ${ Count.get(0).recipecnt }개</span><br />
		<span>전문가팁글 수: ${ Count.get(0).tipcnt }개</span> / <span>커뮤니티글 수: ${ Count.get(0).communitycnt }개</span><br />
	</div>
</div>

</div>
</div>

</form>
</body>
</html>