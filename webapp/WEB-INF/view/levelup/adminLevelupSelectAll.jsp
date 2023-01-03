<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.levelup.vo.LevelupVO" %>
<%@ page import="main.ict.common.O_Session" %>
<%
	request.setCharacterEncoding("UTF-8");
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0
						maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>

<!-- jQuery -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">

<!-- adminWarningSelectAll.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/levelup/adminLevelupSelectAll.css">		


<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		$(".content").click(function(){
			
			
			let info = $(this).siblings();
			console.log(info);
			
			let mnum = info.get(1).value;
			let mnick = info.get(0).value;
			
			console.log(mnum);
			console.log(mnick);
			
			location.href="adminLevelupSelectContent.ict?mnick="+mnick+"&mnum="+mnum;
		});
		
		//	검색 바 없어졌다 생기기 액션주는 all.js 함수
		hiddenAction();
		
		//	홈으로 보내주는 all.js 함수
		homeAction();
		
		//	메뉴바 클릭액션 all.js 함수
		divClickAction();
		
		// 마이페이지로 보내주는 all.js 함수
		mypageHomeAction();
				
		//회원가입 으로 보내주는 all.js 함수
		joinAction();
		
		//로그인으로 보내주는 all.js 함수
		loginAction();
	});
</script>

</head>
<body>
<form id="adminForm" name="adminForm">
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
			<div class="mypageHome">
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

<!-- 등업  -->	

	<h3>등업</h3>
		<hr>
			<table border="1 solid">
			
					<tr>
						<td>NO</td>
						<td>등업번호</td>
						<td>등업제목</td>
						<td>등업사진</td>
						<td>등업신청자</td>
						<td>등업신청일</td> <!-- 작성일 -->
						<td>등업처리여부</td>						
					</tr>					
				
<%
 			
				List<LevelupVO> list = (List<LevelupVO>)request.getAttribute("list");

				String process = null;
				if(list.size() > 0){
				for(int i=0; i<list.size(); i++){
					LevelupVO lvo = list.get(i);
					
					
					if(lvo.getProcessyn().equals("0")){
						process = "대기 중";
					};
%>
			
						
					<tr>
						<input type="hidden" value="<%= lvo.getMnick()%>" id="mnick">
						<input type="hidden" value="<%= lvo.getMnum()%>" id="mnum">
						<td><%= i+1 %></td>
						<td><%= lvo.getLvnum()%></td>
						<td class="content"><%= lvo.getLvsubject()%></td>
						<td><img src="oneYo/img/levelup/<%= lvo.getLvphoto()%>"></td>
						<td><%= lvo.getMnick()%></td> <!-- 닉네임 -->
						<td><%= lvo.getInsertdate()%></td>
						<td><%= process%></td>
					</tr>
				
				<%
				} //for
 			} //if				
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