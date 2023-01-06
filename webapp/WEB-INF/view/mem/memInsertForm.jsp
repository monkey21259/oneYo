<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.ict.mem.vo.MemVO" %>
<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.common.O_Session" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ memInsertForm.jsp ~~");
%>

<%
	// 세션부여
	O_Session mSession = O_Session.getInstance();
	String mnum = mSession.getSession(request);
	String mid = (String)mSession.getAttribute(request, "mid");
	String mnick = (String)mSession.getAttribute(request, "mnick");
	
	logger.info("mnum >>> : " + mnum);
	logger.info("mid: " + mid);
%>

<%
	String memail = null;
	memail = request.getParameter("memail");
	logger.info(memail);
%>
<%
	String mgrade = null;
	mgrade = request.getParameter("mgrade");
	logger.info(mgrade);
%>

<%
	MemVO mvo = (MemVO)request.getAttribute("mvoSNS");
	String mkey = "";
	if (mvo != null) {
		logger.info(mvo.toString());
		logger.info("SNS-LoginVO was created");
		mkey = mvo.getMkey();
	}
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
<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<!-- memInsertForm.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/mem/memInsertForm.css">
<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js" charset="UTF-8"></script>

<script type="text/javascript">
$(document).ready(function(){
	alert("hihi, <%= memail %>. 회원가입 진행합니다.");
	
// 	//	mcategory 단수	=====================
// 	$(document).on('click', '.mcategory', function(){
		
// 		$('.mcategory').prop('checked', false);
// 		$(this).prop('checked', true);
// 	});	//	mcategory 단수	=====================
	
	//	아이디 중복 검사 이후 재 입력 시도
	$(document).on('click', '#mid', function(){
		
		if ($('#mid').attr('readonly')) {
			
			$('#mid').attr('readonly', false);
			$('#mid').focus();
			$('#midBtn').attr('disabled', false);
		}
		
	}); //아이디중복체크
	

	
	$(document).on('click', '#nickCheck', function(){
		
		alert("닉네임 확인 중! >>> ");
		
		let idCheckURL = "memNickCheck.ict";
		let reqType = "POST";
		let dataParam = { mnick : $('#mnick').val(), };
		
		$.ajax({
			 url 	: idCheckURL
			,type	: reqType
			,data	: dataParam
			,success: whenSuccess
			,error	: whenError
		});
		
		function whenSuccess(resData) {
			console.log("resData >>> : " + resData);
			
			if ("ID_YES" == resData) {
				
				alert("사용 가능한 닉네임입니다");
				
			}else if("ID_NO" == resData) {
				
				alert("이미 사용중인 닉네입니다");
			
				
				$('#mnick').val('');
				$('#mnick').focus();
			}
		}	//	ajax 수행문
		
		function whenError() {
			alert("에러 발생, 콘솔을 확인 해 주세요.");
			console.log("에러 발생 e >>> : " + e.responseText);
		}
		
	});	//닉네임 체크 함수 nickCheck
	
	
	$(document).on('click', '#midBtn', function(){
		
		alert("아이디 확인 중! >>> ");
		
		let idCheckURL = "memIdCheck.ict";
		let reqType = "POST";
		let dataParam = { mid : $('#mid').val(), };
		
		$.ajax({
			 url 	: idCheckURL
			,type	: reqType
			,data	: dataParam
			,success: whenSuccess
			,error	: whenError
		});
		
		function whenSuccess(resData) {
			console.log("resData >>> : " + resData);
			
			if ("ID_YES" == resData) {
				
				alert("아이디 사용 가능 : ID_YES");
				console.log("아이디 사용 가능 : ID_YES");
				
				$('#mid').prop('readonly', true);
				$('#mpw').focus();
				$('#midBtn').prop('disabled', true);
				
			}else if("ID_NO" == resData) {
				
				alert("아이디 사용 불가능 : ID_NO");
				console.log("아이디 사용 불가능 : ID_NO");
				
				$('#mid').val('');
				$('#mid').focus();
			}
		}	//	ajax 수행문
		
		function whenError() {
			alert("에러 발생, 콘솔을 확인 해 주세요.");
			console.log("에러 발생 e >>> : " + e.responseText);
		}
		
	});	//	ID 아이디 중복 검사
	
	//	비밀번호 입력 확인
	$(document).on('click', '#mpw', function(){
		if ($('#mpw').prop('readonly') && $('#mpw_r_tr').prop('hidden')) {

			$('#mpw').prop('readonly', false);
			$('.mpw_td').each(function(){
				$(this).attr('rowspan', '2');
			});
			$('#mpw_r_tr').prop('hidden', false);
			$('#mpwBtn').prop('disabled', false);
			
			$('#mpw_r').val($('#mpw').val());
		}
	});
	
	//	비밀번호 확인
	$(document).on('click', '#mpwBtn', function(){
		alert("비밀번호 확인 중입니다.");
		
		let pw = $('#mpw').val();
		let pw_r = $('#mpw_r').val();
		
		
		if (pw == pw_r) {
			alert("비밀번호가 일치합니다.");
			
			$('#mpw_r').val('');
			
			$('#mpw').attr('readonly', true);
			$('.mpw_td').each(function(){
				$(this).attr('rowspan', '');
			});
			$('#mpw_r_tr').prop('hidden', true);
			$('#mpwBtn').attr('disabled', true);
			
			$('#mname').focus();
		} else {
			alert("비밀번호가 일치하지 않습니다.");
			
			$('#mpw').val('');
			$('#mpw_r').val('');
			$('#mpw').focus();
			
		}
	});	//	비밀번호 확인
	
	
	//	form 전송 버튼
	$(document).on('click', '#formBtn', function(){
		
		//	NOT NULL 데이터 NULL 체크			=====================
		
		if( $('#mnick').text() == null){
			alert("닉네임을 기입해주세요");
			$("#mnick").focus();
			return false;
		
			
		}else{
			let idCheckURL = "memNickCheck.ict";
			let reqType = "POST";
			let dataParam = { mnick : $('#mnick').val(), };
			
			$.ajax({
				 url 	: idCheckURL
				,type	: reqType
				,data	: dataParam
				,success: whenSuccess
				,error	: whenError
			});
			
			function whenSuccess(resData) {
				console.log("resData >>> : " + resData);
				
				if ("ID_YES" == resData) {
					
					alert("사용 가능한 닉네임입니다");
				
					
					
					
				}else if("ID_NO" == resData) {
					
					alert("이미 사용중인 닉네입니다");
				
					
					$('#mnick').val('');
					$('#mnick').focus();
				}
			}	//	ajax(success) 수행문
			
			function whenError() {
				alert("에러 발생, 콘솔을 확인 해 주세요.");
				console.log("에러 발생 e >>> : " + e.responseText);
			}// whenErrorr	
		}		
			
			
			
		let cnt = 0;			//	null갯수 체크 변수
		let thisNull = null;	//	포커싱 위한 변수
		
		$('.notNull').each(function(){	//	null이면 안되는 input을 돌며 null데이터를 체크한다.
			if ($(this).val() == null || $(this).val() == '') {	//	input null 체크 if
				
				cnt += 1;	//	input null 이면 cnt가 올라간다.
				
				if (cnt == 1) {	//	null 항목 중 가장 첫번째라면
					thisNull = $(this);	//	가장 처음 null인 대상을 thisNull에 입력
				}	//	포커싱 위한 this 선택 if
				
			}	//	input null 체크 if
		});	//	null이면 안되는 input을 돌며 null데이터를 체크한다.
		
		
		if (!$('#mid').prop('readonly')) {
			
			alert("아이디 중복 검사를 하지 않았습니다.");	//	아이디 중복 검사 여부를 알려줌
			$('#mid').focus();	//	아이디에 커서 올려줌
			
		}
		
		if (!$('#mpw').prop('readonly')) {
			
			alert("비밀번호 검사를 하지 않았습니다.");	//	비밀번호 완료를 확인함
			$('#mpw_r').focus();	//	비번 확인 란에 커서 올려줌
			
		}
		
		if (cnt != 0) {	//	NOT NULL항목중 null이 있었을 경우
			
			alert("미작성 한 필수 입력 항목이 " + cnt + "개 있습니다. 마저 작성해주세요.");	//	미작성 항목 수를 알려줌
			thisNull.focus();	//	미작성 한 것 중 가장 앞에 커서를 올려둠
			
		//	NOT NULL 데이터 NULL 체크			=====================
			
		}
		
		//	아이디 중복 검사  & 비밀번호 확인 & 필수작성항목 전부 작성시
		if (cnt == 0 && $('#mid').prop('readonly') && $('#mpw').prop('readonly')){
			
			//	mhp			=====================
			let mhp = $('#mhp0').val();
				mhp += "-" + $('#mhp1').val();
				mhp += "-" + $('#mhp2').val();
			$('#mhp').val(mhp);		//	mhp합치기..
			console.log('mhp >>> : ' + $('#mhp').val());
			//	mhp			=====================
				
			//	mcategory 복수	=====================
			let mcategory = "";
			$('.mcategory').each(function(){
				if ($(this).is(':checked') == true) {
					mcategory += "#" + $(this).val();
				}
			});
			alert("mcategory: " + mcategory);  // 230103 김기영 추가
			$('#mcategory').val(mcategory);
			console.log("mcategory >>> : " + $('#mcategory').val());
			//	mcategory 복수	=====================
			
			alert("mid >>> : " + $('#mid').val());
			
			$('#memInsertForm').attr({
				 'action'	: 'memInsert.ict'
				,'method'	: 'POST'
				,'enctype'	: 'multipart/form-data'
			}).submit();
		} //if
		
	});	//	form 전송 버튼
			
	//all.js 에 있는 모든 함수 연결
	allJavaScript();
	
}); //ready

</script>
<style type="text/css">
 .mhp { 
 	width	: 40px; 
 } 
<!-- </style> -->
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

<form id="memInsertForm" name="memInsertForm">

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
<%
	if (memail == null || mgrade == null) {
%>
	<script>
		location.href = "/oneYo/memGrade.ict";
	</script>
<%
	}
%>

오내요 회원가입
<table border=1>
<!-- mid 아이디 -->
<%
	if (mvo == null) {	// SNS 로그인 케이스가 아닌 경우
%>
<tr>
	<td>
		아이디
	</td>
	<td>
		<input type="text" id="mid" name="mid" class="notNull">
	</td>
	<td>
		<input type="button" id="midBtn" name="midBtn" value="아이디 확인">
		<input type="button" id="testID" name="testID" value="ㅌㅅㅌ">
	</td>
</tr>
<!-- mpw 비밀번호 -->
<tr>
	<td class="mpw_td" rowspan='2'>
		비밀번호
	</td>
	<td>
		<input type="text" id="mpw" name="mpw" class="notNull">
	</td>
	<td class="mpw_td" rowspan='2'>
		<input type="button" id="mpwBtn" name="mpwBtn" value="비밀번호 확인">
	</td>
</tr>
<tr id="mpw_r_tr">
	<td>
		<input type="text" id="mpw_r" name="mpw_r">
	</td>
</tr>
<!-- mname 이름 -->
<tr>
	<td>
		이름
	</td>
	<td>
		<input type="text" id="mname" name="mname">
	</td>
	<td>
	</td>
</tr>
<!-- mnick 닉네임 -->
<tr>
	<td>
		닉네임
	</td>
	<td>
		<input type="text" id="mnick" name="mnick">
	</td>
	<td>
		<input type="button" id="nickCheck" value="닉네임 중복확인">
	</td>
</tr>
<!-- mhp 휴대폰 -->
<tr>
	<td>
		휴대폰
	</td>
	<td>
		<input type="text" id="mhp0" name="mhp0" class="mhp notNull">
		- <input type="text" id="mhp1" name="mhp1" class="mhp notNull">
		- <input type="text" id="mhp2" name="mhp2" class="mhp notNull">
		<input type="hidden" id="mhp" name="mhp" value="">
	</td>
	<td>
	</td>
</tr>
<!-- memail 이메일 -->
<tr>
	<td>
		이메일
	</td>
	<td>
		<%= memail %>
		<input type="hidden" id="memail" name="memail" value="<%= memail %>">
		<input type="hidden" id="mgrade" name="mgrade" value="<%= mgrade %>">
	</td>
	<td>
	</td>
</tr>
<!-- mprofile 프로필 사진 -->
<tr>
	<td>
		프로필 사진
	</td>
	<td>
		<input type="file" id="mprofile" name="mprofile">
	</td>
	<td>
	</td>
</tr>
<!-- mcategory 요리 분야 -->
<tr>
	<td>
		관심 요리분야
	</td>
	<td>
		<ul>
		<li>
			<input type="checkbox" class="mcategory" value="00">한식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="01">중식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="02">양식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="03">일식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="04">간식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="99">기타
		</li>
		</ul>
		<input type="hidden" id="mcategory" name="mcategory" value="">
	</td>
	<td>
	</td>
</tr>
<tr>
	<td colspan="3">
		<input type="button" id="formBtn" name="formBtn" value="회원가입">
	</td>
</tr>
<%
	} else {	// SNS 로그인 케이스인 경우 (mvo != null)
%>
<tr>
	<td>
		아이디
	</td>
	<td>
		<input type="text" id="mid" name="mid" value="<%= mvo.getMid() %>" readonly />
	</td>
	<td>
		<input type="button" id="midBtn" name="midBtn" value="아이디 확인">
		<input type="button" id="testID" name="testID" value="ㅌㅅㅌ">
	</td>
</tr>
<!-- mpw 비밀번호 -->
<tr>
	<td class="mpw_td" rowspan='2'>
		비밀번호
	</td>
	<td>
		<input type="password" id="mpw" name="mpw" value="<%= mvo.getMpw() %>" readonly />
	</td>
	<td class="mpw_td" rowspan='2'>
		<input type="button" id="mpwBtn" name="mpwBtn" value="비밀번호 확인" />
	</td>
</tr>
<tr id="mpw_r_tr">
	<td>
		<input type="password" id="mpw_r" name="mpw_r" value="<%= mvo.getMpw() %>" readonly />
	</td>
</tr>
<!-- mname 이름 -->
<tr>
	<td>
		이름
	</td>
	<td>
		<input type="text" id="mname" name="mname" value="<%= mvo.getMname() %>" readonly>
	</td>
	<td>
	</td>
</tr>
<!-- mnick 닉네임 -->
<tr>
	<td>
		닉네임
	</td>
	<td>

<%
		if ((mkey.equals("Naver") || mkey.equals("Kakao")) && mvo.getMnick() != null) {  // (네이버 or 카카오) + 닉네임이 유효한 경우
%>
		<input type="text" id="mnick" name="mnick" value="<%= mvo.getMnick() %>"  />
<%	
		} else {
%>

<%-- <% --%>
<!-- // 		if ((mkey.equals("Naver") || mkey.equals("Kakao")) && mvo.getMnick() != null) {  // (네이버 or 카카오) + 닉네임이 유효한 경우 -->
<%-- %> --%>
<%-- 		<input type="text" id="mnick" name="mnick" value="<%= mvo.getMnick() %>" readonly /> --%>
<%-- <%	 --%>
<!-- // 		} else { -->
<%-- %> --%>
<%-- <% --%>
<!-- // 		} -->
<%-- %> --%>
	</td>
	<td>
	</td>
</tr>
<!-- mhp 휴대폰 -->
<tr>
	<td>
		휴대폰
	</td>
	<td>
<%
		if (mkey.equals("Naver")) {
%>
		<% String[] mhpParts = CodeUtils.getMhpParts(mvo.getMhp()); %>
		<input type="text" id="mhp0" name="mhp0" class="mhp notNull" value="<%= mhpParts[0] %>" readonly />
		- <input type="text" id="mhp1" name="mhp1" class="mhp notNull" value="<%= mhpParts[1] %>" readonly />
		- <input type="text" id="mhp2" name="mhp2" class="mhp notNull" value="<%= mhpParts[2] %>" readonly />
		<input type="hidden" id="mhp" name="mhp" value="<%= mvo.getMhp() %>" />
<%
		} else {
			%>
					<input type="text" id="mhp0" name="mhp0" class="mhp notNull" value="" />
					- <input type="text" id="mhp1" name="mhp1" class="mhp notNull" value="" />
					- <input type="text" id="mhp2" name="mhp2" class="mhp notNull" value="" />
					<input type="hidden" id="mhp" name="mhp" value="" />
			<%
					}
			%>
				</td>
				<td>
				</td>
			</tr>
			<!-- memail 이메일 -->
			<tr>
				<td>
					이메일
				</td>
				<td>
					<%= mvo.getMemail() %>
					<input type="hidden" id="memail" name="memail" value="<%= mvo.getMemail() %>">
					<input type="hidden" id="mgrade" name="mgrade" value="<%= mgrade %>">
				</td>
				<td>
				</td>
			</tr>
			<!-- mprofile 프로필 사진 -->
			<tr>
				<td>
					프로필 사진
				</td>
				<td>
					<input type="file" id="mprofile" name="mprofile">
				</td>
				<td>
				</td>
			</tr>
			<!-- mcategory 요리 분야 -->
			<tr>
				<td>
					관심요리분야
				</td>
				<td>
					<ul>
					<li>
						<input type="checkbox" class="mcategory" value="00">한식
					</li>
					<li>
						<input type="checkbox" class="mcategory" value="01">중식
					</li>
					<li>
						<input type="checkbox" class="mcategory" value="02">양식
					</li>
					<li>
						<input type="checkbox" class="mcategory" value="03">일식
					</li>
					<li>
						<input type="checkbox" class="mcategory" value="04">간식
					</li>
					<li>
						<input type="checkbox" class="mcategory" value="99">기타
					</li>
					</ul>
					<input type="hidden" id="mcategory" name="mcategory" value="">
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="button" id="formBtn" name="formBtn" value="회원가입">
				</td>
			</tr>
			<%
				}
	}
			%>
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