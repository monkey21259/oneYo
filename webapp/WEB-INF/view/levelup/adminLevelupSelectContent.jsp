<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.levelup.vo.LevelupVO" %>
<%

	List<LevelupVO> list = (List<LevelupVO>)request.getAttribute("list");
	
	LevelupVO lvo = list.get(0);

	String mnick = (String)request.getAttribute("mnick");


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">

<!-- adminLevelupContent.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/levelup/adminLevelupContent.css">

<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>		
		
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#nopeBtn").click(function(){
			
			let result = confirm('등업을 거부하시겠습니까?');
			if(result == true){
			
			$("#levelupForm").attr({
				"action":"levelupNope.ict",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
			alert("등업이 거부되었습니다.");
			
			}else{
				alert("취소되었습니다.");
			}
		});
		
		
		$("#okeyBtn").click(function(){
			
			let result = confirm('등업을 승인하시겠습니까?');
			if(result == true){
			
			$("#levelupForm").attr({
				"action":"levelupOkey.ict",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"		
			}).submit();
				
			alert("등업이 승인되었습니다.");
			
			}else{
				alert("취소되었습니다.");
			}	
		});
		
//		검색 바 없어졌다 생기기 액션주는 all.js 함수
		hiddenAction();
		
	});



</script>

</head>
<body>
<br>


<form name="levelupForm" id="levelupForm">
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
<h1 align="center">등업</h1>
<table>
	<tr>
		<td>제목</td>
		<td colspan="4" style="text-align:left; width:400;">
			<font size="4" style="color:black"><%= lvo.getLvsubject() %></font>
		</td>
		<td class="td_2"> 작성일자 :<%= lvo.getInsertdate() %>
		</td>
		</tr>
		<tr>
			<input type="hidden" name="lvnum" value="<%=lvo.getLvnum() %>">
			<input type="hidden" name="mnum" value="<%=lvo.getMnum() %>">
			<td>작성자</td>
			<td><%= mnick %></td>
		</tr>
		<tr>
			<td colspan="6" style="text-align:left">
			<img src="/oneYo/img/levelup/<%=lvo.getLvphoto() %>" border="1" width="100" height="100" alt="image"><br>
			</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align:left" >
			<span name="kbcontent" id="kbcontent" rows="5" cols="100"><%= lvo.getLvcontent() %></span>
			</td>
		</tr>		
</tr>
<tr>
<td colspan="6" align="center">
<br><br>
<button type="button" class="btns" id="nopeBtn">거부</button>
<button type="button" class="btns" id="okeyBtn">승인</button>
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