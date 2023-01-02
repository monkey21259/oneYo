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
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지글</title>
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- communitySelectContent.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/notice/noticeSelectContent.css">
		
		<!-- 댓글 기능 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/common/commentForm.css">
		
		<!-- jQuery -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
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
				
				//	검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="selectContentForm" name="selectContentForm">
			<div id="sideBar">
	<div id="warningForm">
	신고
	</div>
	
	<div class="searchBarBtn">
	검색
	</div>
	
	<a href="javascript:window.scrollTo(0,0);">
	<div id="go_top">
	TOP▲
	</div>
	</a>
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

<div id="all_div">

<div id="header">
	<div id="logoLeft" class="logoSide">
	로고 옆공간 좌측
	</div>
	<div id="logoCenter">
		<a href="home.ict">
			<div id="logo">
			<img alt="오내요" src="/oneYo/resource/img/oneYo_logo.png">
			<!-- 379 X 186 -->
			</div>
		</a>
	</div>
	<div id="logoRight" class="logoSide">
	로고 옆공간 우측
	</div>
	
	<hr>
	
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
	
	<hr>
</div>

<div id="left">
좌측
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
					<td colspan="2">
						<img src="/oneYo/img/notice/<%=nvo.getNphoto()%>" style="width:200px; height:200px;"><br>
						<%=nvo.getNcontent() %>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<%
							Object likeObj = request.getAttribute("likeList");
							String likeyn = "Y";
							if(likeObj == null) likeyn = "N";
							O_Session os = O_Session.getInstance();
							String mnum = os.getSession(request);
						%>
						<jsp:include page="/WEB-INF/view/like/likeForm.jsp" flush="true">
							<jsp:param name="mnum" value="<%=mnum %>"/>
							<jsp:param name="likethis" value="<%=nvo.getNnum() %>"/>
							<jsp:param name="likeyn" value="<%=likeyn %>"/>
						</jsp:include>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button id="updateBtn">수정</button>
						<button id="deleteBtn">삭제</button>
					</td>
				</tr>
			</table>
		<jsp:include page="/WEB-INF/view/comment/commentForm.jsp" flush="true">
			<jsp:param name="cotnum" value="<%=nvo.getNnum() %>"/>
		</jsp:include>
		<!-- -------------------------------페이지 전용 center------------------------------- -->
</div>

<div id="right">
우측
</div>

<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
		<span>팀 소개: ~~~</span>
	</div>
	<div>
		<span>회원 수: </span> / <span>레시피글 수: </span><br />
		<span>전문가팁글 수: </span> / <span>커뮤니티글 수: </span><br />
	</div>
</div>

</div>
		</form>
	</body>
</html>