<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.ict.levelup.vo.LevelupVO" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	//m.addAttribute("list", list);
	Object obj = request.getAttribute("list");
	
	List<LevelupVO> list = (List<LevelupVO>)obj;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>
<!-- jQuery -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
<!-- 칸 나눈 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<script type="text/javascript">

	$(document).ready(function(){
		
		console.log("levelupSelectAll.jsp 페이지 진입");
		
		$(document).on("click", "#levelupInsertBtn", function(){
			
			if($("#lvlv").val()==null){
			
			
			alert("levelupInsertBtn 버튼 클릭 이벤트 발생");
			if(confirm("등업글을 작성하시겠습니까?")){
				location.href = "levelupInsertForm.ict?mnum=${list.get(0).getMnum()}";
			} 
			
			}else{
				alert("이미 등업신청을 하였습니다");
			}
			
		});
		
		//	검색 바 없어졌다 생기기 액션주는 all.js 함수
		hiddenAction();
		//	홈으로 보내주는 all.js 함수
		homeAction();
		//	메뉴바 클릭액션 all.js 함수
		divClickAction();
		
	});

	function levelupSelect(lvnum) {
		
		alert("levelupSelect() 함수 진입");
		console.log(lvnum);
		
		if(confirm("등업글을 확인하시겠습니까?")){
			location.href="#";
		}
	}

</script>
</head>
<body>
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
// 		if (mnick == null || mnick.equals("")) {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">:</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
<%
// 		} else {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="#" onclick="javascript:alert('준비중입니다.');">마이페이지</span>
				<span class="Choonsik">:</span>
		 		<span class="Choonsik" id="logoutBtn">로그아웃</span>
<%-- 				<p><%= mnick %> <span>님 환영합니다.</span></p> --%>
	 		</div>
	 		<p></p>
	 		<form id="logoutForm">
<%-- 	 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" /> --%>
	 		</form>
<% 		
// 		}
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
<div id="container" style="text-align:center;">
	<div id="levelup" style="display:inline-block;">
		<table style="border:1px solid black;">
			<thead style="border:1px solid black;">
				<tr>
					<th>
						글번호
					</th>
					<th>
						제목
					</th>
					<th>
						내용
					</th>
					<th>
						사진 대충
					</th>
					<th>
						등록일
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="lvvo">
					<tr>	
						<td id="lvlv">
							${lvvo.lvnum}
						</td>
						<td onclick="levelupSelect('${lvvo.lvnum}')">
							${lvvo.lvsubject}
						</td>
						<td onclick="levelupSelect('${lvvo.lvnum}')">
							${lvvo.lvcontent}
						</td>
						<td>
							<img src="/oneYo/img/levelup/${lvvo.lvphoto}" style="width:50px; height:50px;">
						</td>
						<td>
							${lvvo.insertdate}
						</td>
					</tr>
				</c:forEach>
				<tr> 
					<td colspan="5">
						<button type="button" id="levelupInsertBtn">등업 신청</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
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
</div>
</body>
</html>