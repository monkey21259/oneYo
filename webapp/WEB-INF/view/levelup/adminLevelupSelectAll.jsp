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
<title>oneYo(오내요)</title>

<!-- jQuery -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">

<!-- adminLevelupSelectAll.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/levelup/adminLevelupSelectAll.css">	

<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>

<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
	<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>

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


<form id="adminForm" name="adminForm">
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
		String mSNSid = mid;
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
				<div class="divClick">
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
	<p id="subject">등업신청목록</p>
	</div>
		<div>
			<table class="table-fill">
				<thead>
					<tr>
						<th width="5%">NO</th>
						<th width="10%">등업신청번호</th>
						<th width="25%">제목</th>
						<th width="10%">사진</th>
						<th width="15%">신청자</th>
						<th width="20%">신청일</th>
						<th width="15%">처리여부</th>
					</tr>
				</thead>			
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
			
				<tbody>	
					<tr>
						<input type="hidden" value="<%= lvo.getMnick()%>" id="mnick">
						<input type="hidden" value="<%= lvo.getMnum()%>" id="mnum">
						<td><%= i+1 %></td>
						<td><%= lvo.getLvnum()%></td>
						<td class="content table_subject"><%= lvo.getLvsubject()%></td>
						<td><img src="oneYo/img/levelup/<%= lvo.getLvphoto()%>"></td>
						<td><%= lvo.getMnick()%></td> <!-- 닉네임 -->
						<td><%= lvo.getInsertdate()%></td>
						<td><%= process%></td>
					</tr>
				</tbody>
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