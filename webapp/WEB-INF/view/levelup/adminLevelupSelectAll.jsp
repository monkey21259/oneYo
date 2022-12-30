<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.levelup.vo.LevelupVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0
						maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
	<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- adminWarningSelectAll.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/levelup/adminLevelupSelectAll.css">		
	
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
		
	});
</script>

</head>
<body>
<form id="adminForm" name="adminForm">
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