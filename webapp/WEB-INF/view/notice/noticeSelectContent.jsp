<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="main.ict.notice.vo.NoticeVO" %>
<%@ page import="main.ict.common.O_Session" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	Object obj = request.getAttribute("scontList");
	if (obj == null) return;
	List<NoticeVO> scontList = (List<NoticeVO>)obj;
	NoticeVO nvo = scontList.get(0);
	
	//세션부여
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
	

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지글</title>
		
		<!-- jQuery -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		<!-- noticeSelectContent.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/notice/noticeSelectContent.css">
		<!-- 댓글 기능 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/common/commentForm.css">
		
		<script type="text/javascript">
			$(document).ready(function(){
				
				$(document).on('click', '#updateBtn', function(){
					$('#selectContentForm').attr({
						'action':'noticeUpdateForm.ict',
						'method':'GET'
					}).submit();//end of submit
				});//end of updateBtn click function
				
				$(document).on('click', '#deleteBtn', function(){
					$('#selectContentForm').attr({
						'action':'noticeDelete.ict',
						'method':'GET'
					}).submit();//end of submit
				});//end of deleteBtn click function
				
				//로그아웃
				$("#logoutBtn").on("click", function() {
					$("#logoutForm").attr({
						"action": "logout.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				
				//all.js 모든함수(회원가입,로그인,메뉴바,사이드바 등)
				allJavaScript();
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="selectContentForm" name="selectContentForm">
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
			<div class="mypageHome">
			<span>
			my<br>Page 
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
				<span class="Choonsik mypageHome">마이페이지</span>
				<span class="Choonsik">:</span>
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
			
			<input type="hidden" id="nnum" name="nnum" value="<%=nvo.getNnum() %>">
			<table>
				<tr>
					<td>제목</td>
					<td><%=nvo.getNsubject() %></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=nvo.getInsertdate() %></td>
				</tr>
				<tr>
				<td>내용</td>
				</tr>
				<tr>
				<td><%=nvo.getNcontent() %></td>
				</tr>
				<tr>
					<td colspan="2">
						<img src="/oneYo/img/notice/<%=nvo.getNphoto()%>" style="width:200px; height:200px;"><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<%
							Object likeObj = request.getAttribute("likeList");
							String likeyn = "Y";
							if(likeObj == null) likeyn = "N";
						
						%>
						<jsp:include page="/WEB-INF/view/like/likeForm.jsp" flush="true">
							<jsp:param name="mnum" value="<%=mnum %>"/>
							<jsp:param name="likethis" value="<%=nvo.getNnum() %>"/>
							<jsp:param name="likeyn" value="<%=likeyn %>"/>
						</jsp:include>
					</td>
				</tr>
				<% 
				if(mnum.equals("M000000000000")){
				%>
				<td colspan="2">
						<button id="updateBtn">수정</button>
						<button id="deleteBtn">삭제</button>
					</td>
				<%
				}
				%>	
				</tr>
			</table>
		<jsp:include page="/WEB-INF/view/comment/commentForm.jsp" flush="true">
			<jsp:param name="cotnum" value="<%=nvo.getNnum() %>"/>
		</jsp:include>
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
		<form id="logoutForm">
 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
 		</form>
	</body>
</html>