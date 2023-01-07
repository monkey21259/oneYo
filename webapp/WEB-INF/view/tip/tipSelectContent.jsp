<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="java.util.List" %>

<%@ page import="main.ict.tip.vo.TipVO" %>
<%@ page import="main.ict.common.O_Session" %>
<%@ page import="main.ict.common.ConstPack" %>
<%@ page import="main.ict.common.CodeUtils" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("tipSelectContent.jsp 페이지 진입");	
%>
<%
	//세션부여
	O_Session mSession = O_Session.getInstance();
	String mnum = mSession.getSession(request);
	String mid = (String)mSession.getAttribute(request, "mid");
	String mnick = (String)mSession.getAttribute(request, "mnick");
	
	TipVO tvo = null;
	if (request.getAttribute("list") !=null) {
		List<TipVO> list = (List<TipVO>)request.getAttribute("list");
		if(list !=null && list.size() == 1) {
			tvo = list.get(0);
			logger.info("tvo : \n" + tvo.toString());
		}
	}
%>
<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<title>oneYo(오내요)</title>
<!-- 제이쿼리 -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<!-- tipSelectContent.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/tip/tipSelectContent.css">
<!-- 댓글 기능 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/common/commentForm.css">	
<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		<script type="text/javascript">
		
			$(document).ready(function(){
				
				console.log("tipSelectContent.jsp 페이지 진입");
				
				$(document).on("click", "#updateBtn", function(){
					if(confirm("수정 페이지로 이동하시겠습니까?")){
						$("#tipSelectContentForm").attr({
							'action': 'tipUpdateForm.ict',
							'method': 'GET'
						}).submit();
					}
				});

				$(document).on("click", "#deleteBtn", function(){
					if(confirm("글을 삭제하시겠습니까?")){
						$("#tipSelectContentForm").attr({
							'action': 'tipDelete.ict',
							'method': 'GET'
						}).submit();
					}
				});
				
				$("#warningBtn").click(function(){
					if(confirm("신고하시겠습니까?")){
						$("#tipSelectContentForm").attr({
							'action': 'tipWarningForm.ict',
							'method': 'GET'
						}).submit();
					}
		
				});
				
				//경고 : 관리자
				$(document).on("click", "#cautionBtn", function(){
					
					//mid
					let mnum = $("#mnum").val();
					console.log("mnum(신고당한사람 회원번호) >>> : " + mnum);
					
					//mnick
					let mnick = $("#mnick").val();
					console.log("mnick(신고당한사람 닉네임) >>> : " + mnick);
					
					let result = confirm(mnick + '님을 경고 하시겠습니까?');
					
					if(result == true){
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
					}); //ajax
					
					}else{
						alert("취소되었습니다");
						location.href="#";
					} //if else
					
					//성공했을때
					function whenSuccess(resData){
						if(resData == 'updateOK'){
							alert("경고 처리 되었습니다.");
							$('#cautionBtn').prop('disabled', true);
						} 
					}
					
					//실패했을때
					function whenError(e){
						console("경고 처리 되지 않았습니다(error) : "  + e.responseText);
					} //whenError	
				
				});//cautionBtn버튼클릭
				
		
				//로그아웃
				$("#logoutBtn").on("click", function() {
					$("#logoutForm").attr({
						"action": "logout.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				
				//all.js 에 있는 모든 함수 연결
				allJavaScript();
				
				
			}); //ready
		
		</script>
		<style type="text/css">
		
			#container {
				text-align: center;
			}
			
			#tip_area {
				display: inlineblock;
			}
		
		</style>
	</head>
<body>
<form id="tipSelectContentForm">
	
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
				<div class="divClick">
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
<div id="container">
	<div id="tip_area">
		<input id="tnum" name="tnum" type="hidden" value="<%= tvo.getTnum() %>">
		<input id="mnum" name="mnum" type="hidden" value="<%= tvo.getMnum() %>">
		<input id="tsubject" name="tsubject" type="hidden" value="<%= tvo.getTsubject() %>">
		<input id="mnick" name="mnick" type="hidden" value="<%= tvo.getMnick() %>">
		<div id="viewTable">
			<table id="selectContent">
				<tr>
					<td colspan="2" style="text-align:left;">
<%			// 좋아요
					Object likeObj = request.getAttribute("likeList");
					String likeyn = "Y";
					if(likeObj == null) likeyn = "N";
%>
						<jsp:include page="/WEB-INF/view/like/likeForm.jsp" flush="true">
							<jsp:param name="mnum" value="<%= mnum %>"/>
							<jsp:param name="likethis" value="<%= tvo.getTnum() %>"/>
							<jsp:param name="likeyn" value="<%= likeyn %>"/>
						</jsp:include>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:right;">
					<!-- 수정 / 삭제 / 경고 / 신고 -->
				<% if (mnum.length() > 0) { %>
						<input id="warningBtn" type="button" class="tipButton" value="신고"> 
				<% } %>
				<% if (mnum.equals(tvo.getMnum())) { %>
						<input id="updateBtn" type="button" class="tipButton" value="수정">
						<input id="deleteBtn" type="button" class="tipButton" value="삭제">
				<% } else if (mnum.equals("M000000000000")) { %>
						<button type="button" id="cautionBtn" class="tipButton">경고</button>
				<% } %>
					</td>
				</tr>
				<tr>
					<td rowspan="2">
					<!-- 글 이미지 + 카테고리 -->
						<div class="imgSelect" style="margin-bottom: 20px;">
							<img class="tipImg" src="/oneYo/img/tip/<%= tvo.getTphoto() %>">
							<input type="hidden" id="tphoto" name="tphoto" value="<%= tvo.getTphoto() %>"/> 
						</div>
					</td>
					<td id="tip" class="selectTd cateTd" style="text-align:left;">
						<span>전문가 팁</span>
					</td>
				</tr>
				<!-- 글 제목 + 글 작성자 -->
				<tr class="subjectTr"> <%  // 글 제목 %>
					<td class="selectTd subjectTd">
						<p style="text-align:left;word-break:keep-all;overflow:hidden;">
							<%= tvo.getTsubject() %><br />
						</p>
						<div id="hrDiv"></div>
						<div class="writerDiv" style="text-align:left;">
							<%= tvo.getMnick() %>
						</div>
						<div class="thirdContents">
							<div class="oneTd">
								<table>
									<tr>
										<td class="nameTd">
											좋아요
										</td>
									</tr>
									<tr>
										<td class="valTd">
											<%= tvo.getLikecnt() %>
										</td>
									</tr>
								</table>
							</div>
							<div class="oneTd">
								<table>
									<tr>
										<td class="nameTd">
											조회수
										</td>
									</tr>
									<tr>
										<td class="valTd">
											<%= tvo.getThit() %>
										</td>
									</tr>
								</table>
							</div>
							<div class="oneTd">
								<table>
									<tr>
										<td class="nameTd">
											카테고리
										</td>
									</tr>
									<tr>
										<td class="valTd">
											<%= CodeUtils.getTipcate(tvo.getTcategory()) %>
										</td>
									</tr>
								</table>
							</div>
							<div class="oneTd">
								<table>
									<tr>
										<td class="nameTd">
											작성일
										</td>
									</tr>
									<tr>
										<td class="valTd">
											<%= tvo.getInsertdate() %>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="contentBody">
						<%= tvo.getTcontent() %>
					</td>
				</tr>
			</table>
		</div>
		<jsp:include page="/WEB-INF/view/comment/commentForm.jsp" flush="true">
			<jsp:param name="cotnum" value="<%=tvo.getTnum() %>"/>
			<jsp:param name="clientMnick" value="<%=mnick %>"/>
		</jsp:include>
		<!-- -------------------------------페이지 전용 center------------------------------- -->
</div>

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