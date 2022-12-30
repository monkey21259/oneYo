<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>    
<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunityUpdateForm 진입 >>> : "); 
%>     
<%
	//model.addAttribute("listU", listU);
	Object obj = request.getAttribute("listU");
	if (obj == null){ return; }
	
	List<CommunityVO> list = (List<CommunityVO>)obj;
	int nCnt = list.size();
	logger.info("nCnt >>> : " + nCnt);
	
	CommunityVO cvo = null;
	
	if(nCnt == 1){
		cvo = list.get(0);
		logger.info("list.get(0).getCphoto() >>> : " + list.get(0).getCphoto());
	}

%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>커뮤니티 게시글 수정</title>
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- communityUpdateForm.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/community/communityUpdateForm.css">
		
		<!-- 제이쿼리cdn -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		
		<script type="text/javascript">		
				$(document).ready(function(){
			
					$(document).on("click", "#communityUpdate", function(){
						$("#communitySelectContent").attr({
							"action":"communityUpdate.ict",
							"method":"POST",
							"enctype":"multipart/form-data"	
						}).submit();
					});	 //communityUpdate

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
	
			<input type="hidden" id="cnum" name="cnum" value="<%= cvo.getCnum() %>">
			<table>
			<tr>
					<td>제목</td>
					<td>
						<input type="text" id="csubject" name="csubject" value="<%= cvo.getCsubject() %>">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea id="ccontent" name="ccontent" value="<%= cvo.getCcontent()%>" rows="10" cols="60"><%= cvo.getCcontent()%></textarea></td>
				</tr>
				<tr>
					<td>사진</td>
					<td>
						<img src="/oneYo/img/community/<%=cvo.getCphoto()%>" style="width:200px; height:200px;">
						<input type="file" id="cphoto" name="cphoto" value="<%= cvo.getCphoto()%>">
					</td>
				</tr>
					<tr>
						<td colspan="2">
							<button type="button" id="communityUpdate">수정</button>
						</td>
					</tr>
			</table><!-- -------------------------------페이지 전용 center------------------------------- -->
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