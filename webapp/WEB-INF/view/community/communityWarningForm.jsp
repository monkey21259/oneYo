<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cnum = (String)request.getAttribute("cnum");
	String csubject = (String)request.getAttribute("csubject");
	String mnum = (String)request.getAttribute("mnum");

 %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>커뮤니티 신고</title>
	<!-- 전체 css -->
	<link rel="stylesheet" href="/oneYo/resource/css/all.css">
	
	<!-- communityWarningForm.jsp 전용 -->
	<link rel="stylesheet" href="/oneYo/resource/css/community/communityWarningForm.css">
	
	<!-- jQuery -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
	<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
		
			$("#datain").click(function(){
				
				let box = $("#box").val();
				
				if(box != '50'){
				
				$("#submit").attr({
					"action":"communityWarningInsert.ict",
					"method":"GET",
					"enctype":"application/x-www-form-urlencoded"
				}).submit();
				
				alert("신고 되었습니다");
			
				}else{
					alert("신고할 카테고리를 선택해주세요");
					return false;
				}
			});
			
			$("#content").click(function(){
				
				$("#content").text("");
				$("#content").prop("readonly", false);
	
			});
		
		//	검색 바 없어졌다 생기기 액션주는 all.js 함수
		hiddenAction();

		}); //ready
		
	</script>
	</head>
	<body>
		<form id="submit" name="submit">
		
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
			<input type="hidden" name="mnum" value="<%= mnum %>">
			<input type="hidden" name="wtnum" value="<%= cnum %>">
			
			<table border="1">
			<tr>
				<td>
				<h3 align="center">신고하기</h3>
				</td>
			</tr>
			<tr>
				<td>
					<select id="box" name="wcategory">
					<option value="50">선택하세요 </option>
					<option value="00">욕설 및 비방 </option>
					<option value="01">음란물</option>
					<option value="02">불법광고</option>
					<option value="03">도배성</option>
					<option value="04">주제와 맞지 않음 </option>
					<option value="99">기타</option>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				글 카테고리
				: 커뮤니티
				</td>
			</tr>
			<tr>
				<td colspan="2">
				글 제목 : 
				
				<%= csubject %>
				</td>
			</tr>
			<tr>
				<td>
					<textarea id="content" rows="30" cols="80" name="wcontent" readonly>신고할 내용을 작성해주세요</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id="datain" value="신고">
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
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