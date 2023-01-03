<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>
<%@ page import="main.ict.common.O_Session" %>

<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunitySelect 진입 >>> : "); 
%>    
<%
	//	model.addAttribute("listS", listS);
	Object obj = request.getAttribute("listS");
	
	List<CommunityVO> list = (List<CommunityVO>)obj;
	int nCnt = list.size();
	logger.info("nCnt >>> : " + nCnt);
	
	CommunityVO cvo = null;
	
	//세션부여
	O_Session mSession = O_Session.getInstance();
	String mnum = mSession.getSession(request);
	
	
	if(nCnt == 1){
		cvo = list.get(0);
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>oneYo(오내요)</title>
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- communitySelectContent.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/community/communitySelectContent.css">
		
		<!-- 댓글 기능 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/common/commentForm.css">
		
		<!-- jQuery -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		
		<script type="text/javascript">
			$(document).ready(function(){
			//조회수 추가하기

			//수정
				$(document).on("click", "#UpdateBtn", function(){
					$("#communitySelectContent").attr({
						"action":"communityUpdateForm.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
					
				}); //Update

			//삭제
				$(document).on("click", "#DeleteBtn", function(){
					$("#communitySelectContent").attr({
						"action":"communityDelete.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"	
					}).submit();
				}); //delete
				
				
			//신고
				$(document).on("click", "#warning", function(){
						$("#communitySelectContent").attr({
							"action":"communityWarningForm.ict",
							"method":"GET",
							"enctype":"application/x-www-form-urlencoded"	
						}).submit();
				}); //신고
				
				//경고 : 관리자
				$(document).on("click", "#warningBtn", function(){
					
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
							$('#warningBtn').prop('disabled', true);
						} 
					}
					
					//실패했을때
					function whenError(e){
						console("경고 처리 되지 않았습니다(error) : "  + e.responseText);
					} //whenError	
				
				});//warningBtn버튼클릭
				
				//	검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
				
				//	홈으로 보내주는 all.js 함수
				homeAction();
				
				//	메뉴바 클릭액션 all.js 함수
				divClickAction();
				
				// 마이페이지로 보내주는 all.js 함수
				mypageHomeAction();
						
				//회원가입 으로 보내주는 all.js 함수
				joinAction();
				
				//로그인으로 보내주는 all.js 함수
				loginAction();
				
 			}); //ready
		
		</script>
	</head>
	<body>
	
		<form id="communitySelectContent" name="communitySelectContent">
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
			<div class="mypageHome">
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
			<input type="hidden" id="mnum" name="mnum" value="<%=cvo.getMnum() %>">
			<input type="hidden" id="csubject" name="csubject" value="<%=cvo.getCsubject() %>">
			<input type="hidden" id="cnum" name="cnum" value="<%= cvo.getCnum() %>">
			<table>
				<div>
					<tr>
						<td>제목</td>
						<td colspan="2"><%=cvo.getCsubject() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= cvo.getMnick()%></td>
					</tr>
					<tr>
						<td>작성시간</td>
						<td colspan="2"><%= cvo.getInsertdate()%></td>
					</tr>
				</div>
				
				<div>
					<tr>
						<td>좋아요</td>
						<td><%= cvo.getLikecnt() %></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td><%= cvo.getChit() %></td>
					</tr>
					
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2"><%= cvo.getCcontent() %></td>
					</tr>
					<tr>
						<td colspan="2">
							<img src="/oneYo/img/community/<%=cvo.getCphoto()%>" style="width:200px; height:200px;">
							<input type="hidden" id="cphoto" name="cphoto" value="<%= cvo.getCphoto()%>"></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<%
								Object likeObj = request.getAttribute("likeList");
								String likeyn = "Y";
								if(likeObj == null) likeyn = "N";
							%>
							<jsp:include page="/WEB-INF/view/like/likeForm.jsp" flush="true">
								<jsp:param name="mnum" value="<%=mnum %>"/>
								<jsp:param name="likethis" value="<%=cvo.getCnum() %>"/>
								<jsp:param name="likeyn" value="<%=likeyn %>"/>
							</jsp:include>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" id="warning">신고</button>
						<%
						if(mnum.equals(cvo.getMnum())){ //관리자 추가하기
							logger.info("mnum >>> : " + mnum);
							logger.info("cvo.getMnum() >>> : " + cvo.getMnum());
						
						%>
							<button type="button" id="UpdateBtn">수정</button>
							<button type="button" id="DeleteBtn">삭제</button>
						<%
						}else if(mnum.equals("M000000000000")){
						%>
							<button type="button" id="warningBtn">경고</button>
						<%
						}
						%>
						</td>
					</tr>
				</div>
			</table>
		<jsp:include page="/WEB-INF/view/comment/commentForm.jsp" flush="true">
			<jsp:param name="cotnum" value="<%=cvo.getCnum() %>"/>
		</jsp:include>
		<!-- -------------------------------페이지 전용 center------------------------------- -->
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