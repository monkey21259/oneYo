<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- idFindForm.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/login/idFindForm.css">
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
				
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$(document).on('click', '#emailBtn', function(){
					
					let urlVal = "idFind.ict"
					let typeVal = "POST";
					let mnameVal = $('#mname').val();
					let memailVal = $('#memail').val();
					let dataVal = { mname:mnameVal,
									memail:memailVal};
					
					$.ajax({
						url: urlVal,
						type: typeVal,
						data: dataVal,
						success: whenSuccess,
						error: whenError
					});//end of ajax
					
					function whenSuccess(resData){
						if(resData == "FIND_YES"){
							alert("입력하신 이메일 주소로 송부된 URL을 클릭해주세요.");
						}else{
							alert("이름 또는 이메일 주소가 일치하지 않습니다.");
							$('#mname').val('');
							$('#memail').val('');
							$('#mname').focus();
						}//end of if-else
						
					}//end of whenSuccess() function
					
					function whenError(e){
						alert("예기치 못한 에러가 발생했습니다. 잠시 후 다시 시도해주세요.");
					}//end of whenError() function
					
				});//end of emailBtn click function
				
				//	검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="idFindForm" name="idFindForm">
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
			<table border="1">
				<tr>
					<td>로고 자리</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="mname" name="mname" placeholder="이름">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="memail" name="memail" placeholder="이메일 주소">
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" id="emailBtn">인증메일 받기</button>
					</td>
				</tr>
				<tr>
					<td>
						<a href="loginForm.ict">로그인</a>&nbsp;|
						<a href="pwFindForm.ict">비밀번호 찾기</a>&nbsp;|
						<a href="memGrade.ict">회원가입</a>
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