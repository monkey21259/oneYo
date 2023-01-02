<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<title>공지사항 글 쓰기</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0
					maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- communityInsertForm.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/notice/noticeInsertForm.css">
		
		<!-- 제이쿼리cdn -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<script type="text/javascript">	
			$(document).ready(function(){
				
				$(document).on('click', '#insertBtn', function(){
					
					$('#noticeInsertForm').attr({
						'action':'noticeInsert.ict',
						'method':'POST',
						'enctype':'multipart/form-data'
					}).submit();//end of submit
					
				});//end of insertBtn click function
				
				//	검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="noticeInsertForm" name="noticeInsertForm">
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
			<table>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" id="nsubject" name="nsubject">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea id="ncontent" name="ncontent" rows="30" cols="90"></textarea>
					</td>
				</tr>
				<tr>
					<td>사진</td>
					<td>
						<input type="file" id="nphoto" name="nphoto">
					</td>
				</tr>
			</table>
			<button id="insertBtn" name="insertBtn">글 쓰기</button>
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