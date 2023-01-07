<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>oneYo(오내요)</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		 
		<!-- 전체 css --> 
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- communitySelectContent.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/login/pwFindForm.css">
	
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		
		<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		<script type="text/javascript">
		
			$(document).ready(function(){
				
				$(document).on('click', '#emailBtn', function(){
					
					let urlVal = "pwFind.ict"
					let typeVal = "POST";
					let midVal = $('#mid').val();
					let memailVal = $('#memail').val();
					let dataVal = { mid:midVal,
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
							alert("입력하신 이메일 주소로 인증메일이 발송되었습니다.");
						}else{
							alert("아이디 또는 이메일 주소가 일치하지 않습니다.");
							$('#mid').val('');
							$('#memail').val('');
							$('#mname').focus();
						}//end of if-else
						
					}//end of whenSuccess() function
					
					function whenError(e){
						alert("예기치 못한 에러가 발생했습니다. 잠시 후 다시 시도해주세요.");
					}//end of whenError() function
					
				});//end of emailBtn click function
						
				//all.js 에 있는 모든 함수 연결
				allJavaScript();
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="pwFindForm" name="pwFindForm">
				
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
			마이<br>페이지 
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
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
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
			<p id="subject">비밀번호 찾기</p>
			<p id="content">가입하신 계정의 아이디와 이메일을 입력해주세요.</p>
		
			<table>
				<tr>
					<td class="name">아이디</td>
					<td>
						<input type="text" id="mid" name="mid" placeholder="아이디"><hr>
					</td>
				</tr>
				<tr>
					<td class="name">이메일</td>
					<td>
						<input type="text" id="memail" name="memail" placeholder="이메일주소(@포함한 이메일 주소 입력해주세요)"><hr>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" id="emailBtn">인증메일 받기</button>
					</td>
				</tr>
				<tr>
					<td class="alink" colspan="2">
						<a href="loginForm.ict">로그인</a>&nbsp;|
						<a href="idFindForm.ict">아이디 찾기</a>&nbsp;|
						<a href="memGrade.ict">회원가입</a>
					</td>
				</tr>
			</table>
		<!-- -------------------------------페이지 전용 center------------------------------- -->
</div>

<!-- common_count.js 자바스크립트 임포트하면 span태그에 값이 바인딩 됨. -->
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
	</body>
</html>