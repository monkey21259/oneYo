<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>

<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunitySelect 진입 >>> : "); 
%>    
<%
	//	model.addAttribute("listS", listS);
	Object obj = request.getAttribute("listS");
	if (obj == null){ return; }
	
	List<CommunityVO> list = (List<CommunityVO>)obj;
	int nCnt = list.size();
	logger.info("nCnt >>> : " + nCnt);
	
	CommunityVO cvo = null;
	
	if(nCnt == 1){
		cvo = list.get(0);
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>커뮤니티 게시글 조회</title>
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
				$(document).on("click", "#communityUpdateBtn", function(){
					$("#communitySelectContent").attr({
						"action":"communityUpdateForm.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
					
				}); //Update

			//삭제
				$(document).on("click", "#communityDeleteBtn", function(){
					$("#communitySelectContent").attr({
						"action":"communityDelete.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"	
					}).submit();
				}); //delete
				
				
			//신고
				$(document).on("click", "#warning", function(){
						alert("삭제버튼클릭");
						$("#communitySelectContent").attr({
							"action":"communityWarningForm.ict",
							"method":"GET",
							"enctype":"application/x-www-form-urlencoded"	
						}).submit();
				}); //신고
				
				//	검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
				
 			}); //ready
		
		</script>
	</head>
	<body>
	
		<form id="communitySelectContent" name="communitySelectContent">
		
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
		
	<h3>게시글 보기</h3>
	<hr>
			<input type="hidden" id="mnum" name="mnum" value="<%=cvo.getMnum() %>">
			<input type="hidden" id="csubject" name="csubject" value="<%=cvo.getCsubject() %>">
			<input type="hidden" id="cnum" name="cnum" value="<%= cvo.getCnum() %>">
			<table>
				<div>
					<tr>
						<td>글제목</td>
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
						<td><%= cvo.getLikecnt() %></td>
						<td>조회수</td>
						<td><button type="button" id="warning">신고</button></td>
					</tr>
					
					<tr>
						<td colspan="3">글내용</td>
					</tr>	
					<tr>
						<td>
							<img src="/oneYo/img/community/<%=cvo.getCphoto()%>">
							<input type="hidden" id="cphoto" name="cphoto" value="<%= cvo.getCphoto()%>"></td>
							<td colspan="2"><%= cvo.getCcontent() %></td>
						
					</tr>
					<tr>
						<td colspan="3">
							<button type="button" id="communityUpdateBtn">수정</button>
							<button type="button" id="communityDeleteBtn">삭제</button>
						</td>
					</tr>
				</div>
			</table>
		<jsp:include page="/WEB-INF/view/comment/commentForm.jsp" flush="true">
			<jsp:param name="cotnum" value="<%=cvo.getCnum() %>"/>
		</jsp:include>
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