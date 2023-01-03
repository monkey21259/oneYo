<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.ict.mem.vo.MemVO" %>
<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ profileSelect.jsp ~~");
%>

<%
O_Session oSession = O_Session.getInstance();
String mnum = oSession.getSession(request);
String mid = (String)oSession.getAttribute(request, "mid");

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
<title>oneYo(오내요)</title>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		
<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">

<!-- profileSelect.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/mypage/profileSelect.css">

<script type="text/javascript">

$(document).ready(function(){
	alert("profileSelect.jsp");
	
	$(document).on('click', '.mprBtn', function(){
		alert("mprBtn");
		
		$('#mkey').val("MPROFILE");
		

		$('#profileSelect').attr({
			 'action'	: "profileSelect.ict"
			,'method'	: "POST"
			,"enctype"	: "application/x-www-form-urlencoded"
		}).submit();
		
	});	//	.mprBtn 프로필 버튼
	
	$(document).on('click', '.mgrBtn', function(){
		alert("mgrBtn");
		
		$('#mkey').val("MGRADE");


// 		$('#profileSelect').attr({
// 			 'action'	: "profileSelect.ict"
// 			,'method'	: "POST"
// 			,"enctype"	: "application/x-www-form-urlencoded"
// 		}).submit();
		
	});	//	.mgrBtn 등업 버튼
	
	$(document).on('click', '.mpwBtn', function(){
		alert("mpwBtn");
		
		$('#mkey').val("MPW");


		$('#profileSelect').attr({
			 'action'	: "profileSelect.ict"
			,'method'	: "POST"
			,"enctype"	: "application/x-www-form-urlencoded"
		}).submit();
		
	});	//	.mpwBtn 비번 변경 버튼
	
	$(document).on('click', '.memailBtn', function(){
		alert("memailBtn");
		
		$('#mkey').val("MEMAIL");


		$('#profileSelect').attr({
			 'action'	: "profileSelect.ict"
			,'method'	: "POST"
			,"enctype"	: "application/x-www-form-urlencoded"
		}).submit();
		
	});	//	.memailBtn 이메일 버튼
	
	$(document).on('click', '.memBtn', function(){
		alert("memBtn");
		
		$('#mkey').val("MEM");

		$('#profileSelect').attr({
			 'action'	: "profileSelect.ict"
			,'method'	: "POST"
			,"enctype"	: "application/x-www-form-urlencoded"
		}).submit();
		
	});	//	.memBtn 기타 버튼
	
	$(document).on('click', '.delBtn', function(){
		alert("delBtn");

		$('#profileSelect').attr({
			 'action'	: "memDelete.ict"
			,'method'	: "GET"
			,"enctype"	: "application/x-www-form-urlencoded"
		}).submit();
		
	});	//	.memBtn 기타 버튼
	
	//	검색 바 없어졌다 생기기 액션주는 all.js 함수
	hiddenAction();
	//	홈으로 보내주는 all.js 함수
	homeAction();
	//	메뉴바 클릭액션 all.js 함수
	divClickAction();
	
});
</script>
</head>
<body>


<form id="profileSelect">

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
		if (mid == null || mid.equals("")) {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">:</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
<%
		} else {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="#" onclick="javascript:alert('준비중입니다.');">마이페이지</span>
				<span class="Choonsik">:</span>
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
		프로필 수정
<hr>

<table>
<!-- 프로필 -->
<tr>
	<td>
	닉네임
	</td>
	<td>
	<%= mvo.getMnick() %>
	</td>
	<td rowspan="2">
	<input type="button" class="mprBtn" value="사진 및 닉네임 변경">
	</td>
</tr>
<tr>
	<td>
	프로필 사진
	</td>
	<td>
	<img src="/oneYo/img/mem/<%= mvo.getMprofile() %>" width="150" height="150" alt="image">
	<br><%= mvo.getMprofile() %>
	</td>
</tr>
<tr>
	<td>
	등급
	</td>
	<td>
	<%= CodeUtils.getMgradeVal(mvo.getMgrade()) %>
	</td>
	<td>
	<input type="button" class="mgrBtn" value="등업 신청">
	</td>
</tr>
<!-- 인증절차? 필요?? -->
<tr>
	<td>
	비밀번호
	</td>
	<td>
	<%= mvo.getMpw() %>
	</td>
	<td>
	<input type="button" class="mpwBtn" value="비밀번호 변경">
	</td>
</tr>
<tr>
	<td>
	이메일
	</td>
	<td>
	<%= mvo.getMemail() %>
	</td>
	<td>
	<input type="button" class="memailBtn" value="이메일 변경">
	</td>
</tr>

<!-- 고정값 -->
<tr>
	<td>
	아이디
	</td>
	<td>
	<input type="hidden" id="mnum" name="mnum" value="<%= mvo.getMnum() %>">
	<input type="hidden" id="mkey" name="mkey" value="">
	<%= mvo.getMid() %>
	</td>
	<td rowspan="4">
	<input type="button" class="memBtn" value="개인정보 수정">
	</td>
</tr>
<!-- 기타 -->
<tr>
	<td>
	이름
	</td>
	<td>
	<%= mvo.getMname() %>
	</td>
</tr>
<tr>
	<td>
	전화번호
	</td>
	<td>
	<%= mvo.getMhp() %>
	</td>
</tr>
<tr>
	<td>
	선호하는 요리분야
	</td>
	<td>
	<%= CodeUtils.getMCategorys(mvo.getMcategory()) %>
	</td>
</tr>

<!-- 유저 변경 불가능 -->
<tr>
	<td>
	경고 누적 횟수
	</td>
	<td>
	<%= mvo.getMwarning() %> 회
	</td>
</tr>
<tr>
	<td>
	가입일
	</td>
	<td>
	<%= mvo.getInsertdate() %>
	</td>
</tr>
<tr>
	<td>
	수정일
	</td>
	<td>
	<%= mvo.getUpdatedate() %>
	</td>
</tr>
</table>
<input type="button" class="delBtn" value="회원탈퇴">

</div>

<hr>
 MNUM<br>
<%= mvo.getMnum() %>
<hr>
,DELETEYN<br>
<%= mvo.getDeleteyn() %>
<hr>

<%
	}
}
%>
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
		</div>
	</body>
</html>