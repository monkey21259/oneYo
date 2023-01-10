<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.ict.mem.vo.MemVO" %>

<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
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
<title>oneYo(오내요)</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<!-- memGrade.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/mem/memGrade.css">

<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
	<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
//	일반/전문가 등급 정하기				=====
	$(document).on('click', '.btn', function(){
		let grade = $(this).find('input').val();
		
		if (grade == '0') {
			$('#mgrade').val('0');
			$('#gradeChk').html("[일반]등급으로 회원가입합니다.");
		}
		if (grade == '1') {
			$('#mgrade').val('1');
			alert("전문가 등급으로 회원가입 시 관리자의 승인이 필요합니다.");
			$('#gradeChk').html("[전문가]등급으로 회원가입합니다.");
		}
		
	});	//	$('.btn').click()		=====
	
	//	이메일 선택 박스 변경시 text변경되는 함수		=====
	$(document).on('change', '#memail2', function(){
				
		let emails = ["", "gmail.com", "naver.com", "kakao.com", ""];
		let emailKey = parseInt($('#memail2').val());
				
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
		console.log("#memailBtn >>> : "
				+ $('#memail0').val() + "@" + $('#memail1').val()
				+ "/" + $('#mgrade').val());
		
		let cnt = 0;
		
		$('.memail').each(function(){
			
			if ($(this).val() == "" || $(this).val() == null) {
				cnt += 1;
				
				alert("이메일을 작성 해주세요.");
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
				
	//all.js 에 있는 모든 함수 연결
	allJavaScript();
	
});  // document.ready
</script>
</head>
<body>

<form id="memGradeForm">

<div id="realAll">

<div id="backMenu"></div>

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
			<div class="mypageHome">
			<span>
			마이<br>페이지
			</span>
			</div>
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
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
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
	<p id="subject">회원가입</p>
		<p id="content">가입할 등급을 클릭하고 이메일을 적어주세요</p>
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
	</div>
	
<div class="gradetable">

<table>
<tr>
<td colspan="2" id="gradeChk">&nbsp;</td> <!-- 버튼클릭하면 일반.전문가 표시됨 -->
</tr>

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
<td colspan="2" id="buttontable">
	<button type="button" id="memailBtn" name="memailBtn">이메일 인증</button>
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
</div>
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

</form>
<form id="logoutForm">
	 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
	 		</form>
</body>
</html>