<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="java.util.List" %>

<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.warning.vo.WarningVO" %>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("adminWarningSelectContent.jsp 진입 .");	
%>
<%
	//세션부여
	O_Session mSession = O_Session.getInstance();
	String mnum = mSession.getSession(request);
	String mid = (String)mSession.getAttribute(request, "mid");
%>
<%
	String wcategory = (String)request.getAttribute("wcategory");
	String wtnum = (String)request.getAttribute("wtnum");
	String mnick = (String)request.getAttribute("mnick");
	String wcontent = (String)request.getAttribute("wcontent");
	String insertdate = (String)request.getAttribute("insertdate");
%>
<%
	Object obj = request.getAttribute("list");
	if(obj == null){return; }
	List<WarningVO> list = (List<WarningVO>)obj;	

	WarningVO wvo = list.get(0);
%>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<title>oneYo(오내요)</title>
<!-- 제이쿼리 -->		
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<!-- adminWarningSelectContent.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/warning/adminWarningSelectContent.css">
<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
		
				// 경고버튼 클릭
				$(document).on("click", "#warningBtn", function(){
				
					// mid	
					let mnum = $("#mnum").val();			
					console.log("mnum(신고당한사람 회원번호) >>> : " + mnum);
				
					// mnick	
					let mnick = $(this).parents().find("#mnick").val();
					console.log("mnick(신고당한사람 닉네임) >>> : " + mnick);
					
					let result = confirm(mnick + '님을 경고 하시겠습니까?');
					
					if (result == true) {
						let url = "adminCaution.ict";
						let reqType = "GET";
						let dataParam = {
							mnum :$("#mnum").val(),
						};
					
						console.log("url : " + url);
						console.log("reqType : " + reqType);
						console.log("dataParam : " + dataParam);
					
						$.ajax({
							url:url,
							type:reqType,
							data:dataParam,
							success:whenSuccess,
							error:whenError		
						}); // ajax
						
					} else {
						alert("취소되었습니다");
						location.href="#";
					} // if else
					
					// 성공했을 때
					function whenSuccess(resData) {
						if (resData == 'updateOK') {
							alert("경고 처리 되었습니다.");
							$('#warningBtn').prop('disabled', true);
						}
					}
					
					// 실패했을 때
					function whenError(e) {
						console("경고 처리 되지 않았습니다(error) : "  + e.responseText);
					} // whenError	
					
				}); // warningBtn 버튼 클릭
			
				// 삭제 버튼 클릭	
				$(document).on("click", "#deleteBtn", function(){
				
					$("#adminwarningForm").attr({
						'action':"adminWarningDelete.ict",
						'method':'GET',
						'enctype':'application/x-www-form-urlencoded'
					}).submit();		
					
				}); // deleteBtn
				
				// 로그아웃
				$("#logoutBtn").on("click", function() {
					$("#logoutForm").attr({
						"action": "logout.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
						
				// all.js 에 있는 모든 함수 연결
				allJavaScript();
				
			}); // ready	
		
		</script>
	</head>
	<body>
		
<form name="adminwarningForm" id="adminwarningForm">

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
	<%
		if(mid == null || !mid.equals("admin")){
	%>
			<div class="mypageHome">
			<span>
			마이<br>페이지 
			</span>
			</div>
			<%
		} else if(mid.equals("admin")){
			%>
			<div class="adminHome">
			<span>
			관리자<br>페이지 
			</span>
			</div>
			<%
		}
		%>
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
<%-- 	<jsp:include page="/WEB-INF/view/warning/warningPage.jsp" flush="true"> --%>
<%-- 		<jsp:param value="" name=""/> --%>
<%-- 	</jsp:include>	 --%>
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
<%
			if(mid.equals("admin")){
%>
				<span class="Choonsik adminHome">관리자페이지</span>
<%
			}else{
%>
				<span class="Choonsik mypageHome">마이페이지</span>
<%
			}
%>
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
			<input type="hidden" id ="wnum" name="wnum" value="<%=wvo.getWnum()%>" />
			<input type="hidden" id ="mnum" name="mnum" value="<%=wvo.getWtmnum()%>" />
			<input type="hidden" id ="mnick" name="mnick" value="<%=wvo.getWtmnick()%>" />
			<div class="reqHeader">
				접수된 신고 조회
			</div>
			<div class="reqHeaderUnderLine">
				-------------------
			</div>
			<div id="viewTable" style="margin-bottom: 35px;">
				<table id="selectContent">
<!-- 
		신고 분야		작성 일자		  신고당한 닉네임	 신고한 닉네임
		   -		   -		   	  -			     -
		
						        신고 내용
		=================================================
		
						 경  고    /  삭 제
						 
						 << footer >>
 -->
 					<tr>
 						<td class="selectTd">
 							<div class="thirdContents">
								<div class="oneTd">
									<div class="nameTd">
										신고분야
									</div>
									<div class="valTd">
										<%= CodeUtils.getWcategory(wcategory) %>
									</div>
								</div>
								<div class="oneTd">
									<div class="nameTd">
										작성일자
									</div>
									<div class="valTd">
										<%= insertdate %>
									</div>
								</div>
								<div class="oneTd">
									<div class="nameTd">
										신고당한 닉네임
									</div>
									<div class="valTd">
										<%= wvo.getWtmnick() %>
									</div>
								</div>
								<div class="oneTd">
									<div class="nameTd">
										신고한 닉네임
									</div>
									<div class="valTd">
										<%= mnick%>
									</div>
								</div>
							</div>
 						</td>
 					</tr>
 					<tr class="selectTd">
 						<td class="oneTd">
 							<div class="nameTd">
 								신고 내용
 							</div>
 						</td>
 					</tr>
 					<tr>
						<td colspan="2" class="contentBody">
							<%= wcontent %>
						</td>
					</tr>
				</table>
				<div class="btnDiv">
					<button type="button" class="wButton" id="warningBtn">경고</button>
					<button type="button" class="wButton" id="deleteBtn">삭제</button>
				</div>
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
			<form id="logoutForm">
	 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
	 		</form>
	</body>
</html>