<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.ict.mem.vo.MemVO" %>
<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ profilePhotoUpdateForm.jsp ~~");
%>

<%
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
	
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
<meta name="viewport" content="width=device-width, initial-scale=1.0
					maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	
<title>oneYo(오내요)</title>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
	
<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">

<!-- profilePhotoUpdateForm.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/mypage/profilePhotoUpdateForm.css">	

<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
	
<script type="text/javascript">
$(document).ready(function(){
	alert("profilePhotoUpdateForm.jsp");
	
	//	처음 로딩시에는 기존 닉네임이 입력되어 있으나 클릭하면 사라지게 하는 함수
	$(document).on('click', '#mnick', function(){
		if ($('#mnick').prop('readonly')) {
			
			$('#mnick').val('');
			$('#mnick').prop('readonly', false);
			$('#mnick').focus();
		}
	});
	
	//	가린 input대신 지금 넣은 파일 이름 보이게 하는 함수
	$(document).on('input', '#mprofile', function(){
		if(!$('#mprofile').val()) {
			$("#fileName").html('');
		}else {
			alert("입력o >>> : " + $('#mprofile').val());
			
			var fileValue = $("#mprofile").val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명
			$("#fileName").html(fileName);
		}
	});
	
	//	정보 보내기
	$(document).on('click', '.mprBtn', function(){

		alert("mkey >>> : " + $('#mkey').val());
		$('#profileUpdateForm').attr({
			 "action"	: "memUpdate.ict"
			,"method"	: "POST"
			,"enctype"	: "multipart/form-data"
		}).submit();
	});
	
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
});
</script>
</head>
<body>

<form id="profileUpdateForm">
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
<!-- 		<li class="item"> -->
<!-- 			<div id="warningForm"> -->
<!-- 			<span> -->
<!-- 			신고 -->
<!-- 			</span> -->
<!-- 			</div> -->
<!-- 		</li> -->
		<li class="item">
			<div class="warningForm">
			<span>
			신고<br>팝업
			</span>
			</div>
		</li>
		
		<li class="item">
	<%
		if(mid == null || !mid.equals("admin")){
	%>
			<div class="mypageHome">
			<span>
			마이<br>페이지 
			</span>
			</div>
			<%
		} else if(mid.equals("admin")){
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
				<span class="Choonsik" id="#" onclick="javascript:alert('준비중입니다.');">마이페이지</span>
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

profilePhotoUpdateForm.jsp
<input type="hidden" id="mnum" name="mnum" value="<%= mvo.getMnum() %>">
<input type="hidden" id="mkey" name="mkey" value="<%= mkey %>">
<table>
<tr>
	<td rowspan="2">
	프로필 사진
	</td>
	<td>
	<label class="mphtoBtn" for="mprofile">
	<img src="/oneYo/img/mem/<%= mvo.getMprofile() %>" width="150" height="150" alt="image">
	</label>
	</td>
</tr>
<tr>
	<td>
	<label class="mphtoBtn" for="mprofile">사진 선택</label>
	<br><span id="fileName"></span>
	<input type="file" id="mprofile" name="mprofile" hidden="true">
	</td>
</tr>
<tr>
	<td>
	닉네임
	</td>
	<td>
	<input type="text" id="mnick" name="mnick" value="<%= mvo.getMnick() %>" readonly>
	</td>
</tr>
</table>

<input type="button" class="mprBtn" value="사진 및 닉네임 변경">

<%
	}
}
%>
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
	</body>
</html>