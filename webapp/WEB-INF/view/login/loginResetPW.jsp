<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="main.ict.mem.vo.MemVO" %>
<%

	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	request.setCharacterEncoding("UTF-8");
	Object obj = request.getAttribute("pwFindVO");
	MemVO pwFindVO = (MemVO)obj;
%>
<!DOCTYPE html>
<html> 
	<head>
		<meta charset="UTF-8">
		<title>oneYo(오내요)</title>
		<!-- jQuery -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<!-- 칸 나눈 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		<!-- loginResetPW.jsp 전용 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/login/loginResetPW.css">
		<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		<script type="text/javascript">
		
			$(document).ready(function(){
						
				let mid = $("#mid").val();
				
				//사이드 바 마이페이지 클릭하면 null로 변환(비회원이니까)
				$(".resetPW").on("click", function(){
					$("#mid").val(null);

				});
				
				// null로 바꾼거 다시 활성화 시키기 
				
				
				$(document).on('click', '#resetPWBtn', function(){
			
					let mpw = $('#mpw').val();
					let mpw_r = $('#mpw_r').val();
					
					if(mpw == mpw_r){
						$('#resetPWForm').attr({
							'action':'resetPW.ict',
							'method':'POST',
							'enctype':'application/x-www-form-urlencoded'
						}).submit();//end of submit
					}else{
						alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
						$('#mpw').val('');
						$('#mpw_r').val('');
						$('#mpw').focus();
						return;
					}
				});//end of resetPWBtn click function
						
				//all.js 에 있는 모든 함수 연결
				allJavaScript();
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="resetPWForm" name="resetPWForm">
		<div id="realAll">

<div id="backMenu"></div>

<div id="sideBar">
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
			<div class="mypageHome resetPW">
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
			<p id="subject">비밀번호변경</p>
			<p id="content">변경할 비밀번호를 입력해주세요.</p>
			<table>
				<tr>
					<td class="name">새 비밀번호</td>
					<td>
						<input type="hidden" id="mid" name="mid" value="<%=pwFindVO.getMid() %>">
						<input type="password" id="mpw" name="mpw" placeholder="새 비밀번호"><hr>
					</td>
				</tr>
				<tr>
					<td class="name">비밀번호 확인</td>
					<td>
						<input type="password" id="mpw_r" name="mpw_r" placeholder="비밀번호  확인"><hr>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" id="resetPWBtn">비밀번호 수정</button>
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