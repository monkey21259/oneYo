<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>

<%@ page import="org.apache.log4j.LogManager"%>
<%@ page import="org.apache.log4j.Logger"%>

<%@ page import="main.ict.mem.vo.MemVO"%>
<%@ page import="main.ict.common.CodeUtils"%>
<%@ page import="main.ict.common.O_Session"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	Logger logger = null;
logger = LogManager.getLogger(this.getClass());

logger.info("~~ profileSelect.jsp ~~");
%>

<%
	O_Session oSession = O_Session.getInstance();
String mnum = oSession.getSession(request);
String mid = (String) oSession.getAttribute(request, "mid");

Object obj = null;
obj = request.getAttribute("list");

if (obj == null)
	return;

List<MemVO> list = null;
list = (List<MemVO>) obj;

if (list != null && list.size() > 0) {
	logger.info("list.size() >>> : " + list.size());

	for (int i = 0; i < list.size(); i++) {

		MemVO mvo = list.get(i);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js"
	charset="UTF-8"></script>

<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">

<!-- profileSelect.jsp 전용 -->
<link rel="stylesheet"
	href="/oneYo/resource/css/mypage/profileSelect.css">

<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
<script type="text/javascript"
	src="/oneYo/resource/js/common/common_count.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$(document).on('click', '.mprBtn', function() {

			$('#mkey').val("MPROFILE");

			$('#profileSelect').attr({
				'action' : "profileSelect.ict",
				'method' : "POST",
				"enctype" : "application/x-www-form-urlencoded"
			}).submit();

		}); //	.mprBtn 프로필 버튼

		//등업신청 클릭
		$(document).on('click', '.mgrBtn', function() {

			$('#mkey').val("MGRADE");

			let mnum = $("#mnum").val();
			console.log("mnum >>> : " + mnum);

			$('#profileSelect').attr({
				'action' : "levelupSelectAll.ict?mnum=" + mnum,
				'method' : "GET",
				"enctype" : "application/x-www-form-urlencoded"
			}).submit();

		}); //	.mgrBtn 등업 버튼

		//비밀번호 수정
		$(document).on('click', '.mpwBtn', function() {

			$('#mkey').val("MPW");

			$('#profileSelect').attr({
				'action' : "profileSelect.ict",
				'method' : "POST",
				"enctype" : "application/x-www-form-urlencoded"
			}).submit();

		}); //	.mpwBtn 비번 변경 버튼

		//이메일 변경
		$(document).on('click', '.memailBtn', function() {

			$('#mkey').val("MEMAIL");

			$('#profileSelect').attr({
				'action' : "profileSelect.ict",
				'method' : "POST",
				"enctype" : "application/x-www-form-urlencoded"
			}).submit();

		}); //	.memailBtn 이메일 버튼

		$(document).on('click', '.memBtn', function() {

			$('#mkey').val("MEM");

			$('#profileSelect').attr({
				'action' : "profileSelect.ict",
				'method' : "POST",
				"enctype" : "application/x-www-form-urlencoded"
			}).submit();

		}); //	.memBtn 기타 버튼

		$(document).on('click', '.delBtn', function() {

			$('#profileSelect').attr({
				'action' : "memDelete.ict",
				'method' : "GET",
				"enctype" : "application/x-www-form-urlencoded"
			}).submit();

		}); //	.memBtn 기타 버튼

		$("#logoutBtn").on("click", function() {
			$("#logoutForm").attr({
				"action" : "/oneYo/logout.ict",
				"method" : "GET",
				"enctype" : "application/x-www-form-urlencoded"
			}).submit();
		});

		//all.js 에 있는 모든 함수 연결
		allJavaScript();

	});
</script>

<!-- 완성 후 css 파일로 만들것 -->
<style type="text/css">
.td_header {
	width: 100px;
	height: 30px;
	line-height: 14px;
	text-align: left;
	vertical-align: top;
	padding-top: 20px;
	border-collapse: separate;
	border-right: 1px solid #c6c9cc;
	border-bottom: 1px solid #c6c9cc;
	border-end-end-radius: 15px;
	border-start-end-radius: 15px;
}

.td_body {
	width: 300px;
	height: 50px;
	text-align: left;
	vertical-align: middle;
	padding-left: 20px;
	border-collapse: separate;
	border-bottom: 1px solid #c6c9cc;
	border-end-start-radius: 15px;
}

.mpwBtn {
	width: 47px;
	height: 47px;
	vertical-align: middle;
}

#profile_table {
	display: inline-block;
	background-color: white;
	border-radius: 10px;
}
</style>

</head>
<body>


	<form id="profileSelect">

		<div id="realAll">

			<div id="backMenu"></div>
			<input type="checkbox" id="sideMenu" name="sideMenu" hidden>
			<label for="sideMenu" id="sideLabel">&lt;&lt;&nbsp;&nbsp;&nbsp;</label>
			<div class="sidebar">
				<ul>
					<li class="item">
						<div class="homeLink">
							<span> 홈으로 </span>
						</div>
					</li>
					<li class="item">
						<div class="searchBarBtn">
							<span> 검색 </span>
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
							<span> 신고<br>팝업
							</span>
						</div>
					</li>

					<li class="item">
						<%
							if (mid == null || !mid.equals("admin")) {
						%>
						<div class="mypageHome">
							<span> 마이<br>페이지
							</span>
						</div> <%
 	} else if (mid.equals("admin")) {
 %>
						<div class="adminHome">
							<span> 관리자<br>페이지
							</span>
						</div> <%
 	}
 %>
					</li>

					<li class="item"><a href="javascript:window.scrollTo(0,0);">
							<div id="go_top">
								<span> TOP▲ </span>
							</div>
					</a></li>
				</ul>
			</div>

<div id="searchBar" class="hidden_X">
<!-- <div id="searchBar" class="hidden_O"> -->
	<div class="searchBarBtn">
		X
	</div>
	<div>
		<jsp:include page="/WEB-INF/view/recipe/recipePage.jsp" flush="true">
				<jsp:param value="" name=""/>
		</jsp:include>	
	</div>
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
							<%
								if (mid == null || mid.equals("")) {
							%>
							<div class="loginBtnDiv">
								<span class="Choonsik" id="newMemBtn">회원가입</span> <span
									class="Choonsik">|</span> <span class="Choonsik" id="loginBtn">로그인</span>
							</div>
							<%
								} else {
							%>
							<div class="loginBtnDiv">
								<span class="Choonsik mypageHome">마이페이지</span> <span
									class="Choonsik">|</span> <span class="Choonsik" id="logoutBtn">로그아웃</span>
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
								<p><%=mSNSid%>
									<span>님 환영합니다.</span>
								</p>
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
				<div class="menu">
					<a href="recipeSelectAll.ict" class="menu_link">
						<div>
							레시피
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="tipSelectAll.ict" class="menu_link">
						<div>
							Tip
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="communitySelectAll.ict" class="menu_link">
						<div>
							커뮤니티
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="noticeSelectAll.ict" class="menu_link">
						<div>
							공지사항
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="pulsMenu">
					<div class="menu">
						<a href="#" class="menu_link">
							<div>
								더보기
							</div>
						</a>
					</div>
					<div class="sub-menu">
					<ul>
						<li>
							<a href="entertainment.ict" class="menu_link">
							<div>
							엔터테이먼트
							</div>
							</a>
						</li>
						<li>
							<a href="chart.ict" class="menu_link">
							<div>
							차트
							</div>
							</a>
						</li>
						<li>
							<a href="goCalendar.ict" class="menu_link">
							<div>
							일정 관리
							</div>
							</a>
						</li>
					</ul>
					</div>
				</div>
			</li>
		</ul>
		</nav>
	</div>

				</div>

				<div id="center" style="text-align: center;">
					<!-- -------------------------------페이지 전용 center------------------------------- -->
					프로필 수정
					<hr>

					<table id="profile_table"">
						<!-- 프로필 -->
						<tr class="table_row">
							<td class="td_header">회원번호</td>
							<td colspan="2" class="td_body"><%=mvo.getMnum()%></td>
						</tr>
						<tr class="table_row">
							<td class="td_header">아이디</td>
							<td colspan="2" class="td_body"><input type="hidden"
								id="mnum" name="mnum" value="<%=mvo.getMnum()%>"> <input
								type="hidden" id="mkey" name="mkey" value=""> <%=mvo.getMid()%></td>
						</tr>
						<!-- 인증절차? 필요?? -->
						<tr class="table_row">
							<td class="td_header">비밀번호</td>
							<td class="td_body" colspan="2">???????? <%-- 	<%= mvo.getMpw() %> --%>
								<button class="mpwBtn"
									style="width: 20px; height: 16px; float: right; border: 0px; background-color: white;">
									<img src="/oneYo/resource/img/modify.png"
										style="width: 20px; height: 16px;">
								</button>
							</td>
						</tr>
						<tr class="table_row">
							<td class="td_header">닉네임</td>
							<td class="td_body" colspan="2"><%=mvo.getMnick()%>
								<button class="mprBtn"
									style="width: 20px; height: 16px; float: right; border: 0px; background-color: white;">
									<img src="/oneYo/resource/img/modify.png"
										style="width: 20px; height: 16px;">
								</button></td>
						</tr>
						<tr class="table_row">
							<td class="td_header">프로필 사진</td>
							<td class="td_body" colspan="2"><img
								src="/oneYo/img/mem/<%=mvo.getMprofile()%>" width="50"
								height="50" alt="image"
								onerror="this.src='/oneYo/resource/img/grade0.png'"> <br>
							</td>
						</tr>
						<tr class="table_row">
							<td class="td_header">등급</td>
							<td class="td_body" colspan="2"><%=CodeUtils.getMgradeVal(mvo.getMgrade())%></td>
							<%
								if (mvo.getMgrade().equals("0")) {
							%>
							<td><input type="button" class="mgrBtn" value="등업 신청">
							</td>
							<%
								}
							%>
						</tr>

						<tr class="table_row">
							<td class="td_header">이메일</td>
							<td class="td_body" colspan="2"><%=mvo.getMemail()%>
								<button class="memailBtn"
									style="width: 20px; height: 16px; float: right; border: 0px; background-color: white;">
									<img src="/oneYo/resource/img/modify.png"
										style="width: 20px; height: 16px;">
								</button>
							</td>
						</tr>
						<!-- 기타 -->
						<tr class="table_row">
							<td class="td_header">이름</td>
							<td class="td_body" colspan="2"><%=mvo.getMname()%></td>
						</tr>
						<tr class="table_row">
							<td class="td_header">전화번호</td>
							<td class="td_body"><%=mvo.getMhp()%>
								<button class="memBtn"
									style="width: 20px; height: 16px; float: right; border: 0px; background-color: white;">
									<img src="/oneYo/resource/img/modify.png"
										style="width: 20px; height: 16px;">
								</button>
							</td>
							
						</tr>
						<tr class="table_row">
							<td class="td_header">선호분야</td>
							<td class="td_body"><%=CodeUtils.getMCategorys(mvo.getMcategory())%></td>
						</tr>

						<!-- 유저 변경 불가능 -->
						<tr class="table_row">
							<td class="td_header">경고</td>
							<td colspan="2" class="td_body"><%=mvo.getMwarning()%> 회</td>
						</tr>
						<tr class="table_row">
							<td class="td_header">가입일</td>
							<td colspan="2" class="td_body"><%=mvo.getInsertdate()%></td>
						</tr>
						<tr class="table_row">
							<td class="td_header">수정일</td>
							<td colspan="2" class="td_body"><%=mvo.getUpdatedate()%></td>
						</tr>
						<tr>
							<td class="td_header">회원탈퇴</td>
							<td colspan="2" class="td_body">
								<input type="text"/ style="width:92%; height:33%;" placeholder="탈퇴를 원하면 '탈퇴를 원합니다.'를 입력하세요.">
							</td>
						</tr>
					</table>

				</div>
				<!-- <hr> -->
				<!-- ,DELETEYN<br> -->
				<%-- <%= mvo.getDeleteyn() %> --%>
				<!-- <hr> -->

				<%
					}
				}
				%>
				<!-- -------------------------------페이지 전용 center------------------------------- -->
			</div>

			<!-- common_count.js 자바스크립트 임포트하면 span태그에 값이 바인딩 됨. -->
			<div id="footer">
				<div>
					<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
				</div>
				<div>
					<span></span> / <span></span><br /> <span></span> / <span></span><br />
				</div>
			</div>
		</div>

	</form>
	<form id="logoutForm">
		<input type="hidden" id="mid" name="mid" value="<%=mid%>" />
	</form>
</body>
</html>