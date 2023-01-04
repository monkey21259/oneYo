<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="java.util.List" %>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.ict.mem.vo.MemVO" %>
<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
	
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ profileEmailUpdateForm.jsp ~~");
%>

<%
	String mkey = "";
	mkey = request.getParameter("mkey");
	
	logger.info("mkey >>> : " + mkey);
%>

<%
	Object obj = null;
	obj = request.getAttribute("list");
	
	if (obj == null) return;
	
	List<MemVO> list = null;
	list = (List<MemVO>)obj;
	
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
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
<!-- 칸 나눈 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<script type="text/javascript">
$(document).ready(function(){
	
	var random = Math.floor(Math.random() * 1000000 + 1);
	var mkey = "<%= mkey %>";
	
	$('#mkey').val(random);

	//	이메일 선택 박스 변경시 text변경되는 함수		=====
	$(document).on('change', '#memail2', function(){
// 		alert("memail2 >>> : " + $('#memail2').val());
		
		let emails = ["", "gmail.com", "naver.com", "kakao.com", ""];
		let emailKey = parseInt($('#memail2').val());
// 		alert("email2 >>> : " + emails[emailKey]);
		
		$('#memail1').val(emails[emailKey]);
		if (emailKey == '4') {
			$('#memail1').prop("readonly", false);
			$('#memail1').focus();
		} else {
			$('#memail1').prop("readonly", true);
		}
	});	//	$('#memail2').change()		=====
	
	//	form 전송하기						=====
	$(document).on('click', '.memailBtn', function(){
// 		alert("#memailBtn >>> : "
// 				+ $('#memail0').val() + "@" + $('#memail1').val()
// 				+ "/" + $('#mailKey').val());
		
		let cnt = 0;
		$('.memail').each(function(){
			
			if ($(this).val() == "" || $(this).val() == null) {
				cnt += 1;
				
				alert("이메일을 마저 작성 해주세요.");
				$("#memail0").focus();
				
				return false;
			}
		});
		
		if (cnt == 0) {
				let memail = $('#memail0').val() + "@" + $('#memail1').val();
				$('#memail').val(memail);
				console.log("#memail >>> : " + $('#memail').val());
			
			if (!$('.memail').prop('readonly')) {
				$('.memail').prop("readonly", true);
				
				// ajax로 보내기
				let emailCheckURL = "profileEmailCheck.ict";
				let reqType = "POST";
				let dataParam = {
					 memail		: $('#memail').val()
					,mkey		: $('#mkey').val()
				};
				
				$.ajax({
					 url 	: emailCheckURL
					,type	: reqType
					,data	: dataParam
					,success: whenSuccess
					,error	: whenError
				});
				
				function whenSuccess(resData) {
					console.log("resData >>> : " + resData);
					
					if ("GOMAIL" == resData) {
						
						alert("메일 인증 발송 성공");
						console.log("메일 인증 발송 성공 : GOMAIL");
						
						$('#mailKey_r').prop('hidden', false);
						$('#mailKey_r').focus();
						
					}else if("NOTMAIL" == resData) {
						
						alert("메일 인증 정상 발송 실패");
						console.log("메일 인증 정상 발송 실패 : NOTMAIL");
						
						$('#memail0').val('');
						$('#memail1').val('');
						$('#memail2').attr('select', '0');
						$('#memail0').prop("readonly", false);
						$('#memail0').focus();
						
					}
				}	//	ajax 수행문
				
				function whenError() {
					alert("에러 발생, 콘솔을 확인 해 주세요.");
					console.log("에러 발생 e >>> : " + e.responseText);
				}
				
			}else {
				//	이메일 변경하기
				
				if ($('#mkey').val() == $('#mailKey_r').val()) {
					//	인증번호를 올바르게 기입하는데에 성공하였다면
					
					$('#mkey').val(mkey);
					alert("mkey >>> : " + $('#mkey').val());
					
					$('#profileUpdateForm').attr({
						 "action"	: "memUpdate.ict"
						,"method"	: "POST"
						,"enctype"	: "multipart/form-data"
					}).submit();
					
				}else {
					//	인증번호를 올바르게 기입하는데에 실패하였다면
					
					alert("인증에 실패하였습니다. 올바른 값을 입력해주십시오.");
					
					$('#mailKey_r').val('');
					$('#mailKey_r').focus();
				}
				
			}
		}
		
	});	//	$('#memailBtn').click()		=====
	
	$("#logoutBtn").on("click", function() {
		console.log("[로그아웃] 버튼 클릭");
		$("#logoutForm").attr({
			"action": "/oneYo/logout.ict",
			"method": "GET",
			"enctype": "application/x-www-form-urlencoded"
		}).submit();
	});
	
	//all.js 에 있는 모든 함수 연결
	allJavaScript();
	
});
</script>
</head>
<body>

<form id="profileUpdateForm">
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
			my<br>Page 
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
		if (mid == null || mid.equals("")) {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
<%
		} else {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik mypageHome">마이페이지</span>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="logoutBtn">로그아웃</span>
<%
			String mSNSid = mid;  // M22...
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
				<p><%= mSNSid %> <span>님 환영합니다.</span></p>
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
<input type="hidden" id="mnum" name="mnum" value="<%= mvo.getMnum() %>">
<input type="hidden" id="mkey" name="mkey" value="">
<table>
<tr>
	<td>기존 이메일 주소</td>
	<td><%= mvo.getMemail() %></td>
</tr>
<tr>
<td>변경할 이메일 주소</td>
	<td>
	<input type="text" id="memail0" name="memail0" class="memail">
	@ <input type="text" id="memail1" name="memail1" class="memail" readonly>
	<select id="memail2">
		<option value="0">선택해주세요.</option>
		<option value="1">gmail.com</option>
		<option value="2">naver.com</option>
		<option value="3">kakao.com</option>
		<option value="4">직접 입력</option>
	</select>
	<input type="hidden" id="memail" name="memail" value="">
	</td>
</tr>
<tr>
	<td>인증번호</td>
	<td>
	<input type="text" id="mailKey_r" name="mailKey_r" hidden="true">
	</td>
</tr>
</table>

<input type="button" class="memailBtn" value="이메일 변경">
 
<%
		}
	}
%>

<!-- -------------------------------페이지 전용 center------------------------------- -->
</div>

<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
		<span>팀 소개: ~~~</span>
	</div>
	<div>
		<span>회원 수: ${ Count.get(0).membercnt }명</span> / <span>레시피글 수: ${ Count.get(0).recipecnt }개</span><br />
		<span>전문가팁글 수: ${ Count.get(0).tipcnt }개</span> / <span>커뮤니티글 수: ${ Count.get(0).communitycnt }개</span><br />
	</div>
</div>

</div>
</div>

</form>
		<form id="logoutForm">
	 		<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
	 	</form>

</body>
</html>