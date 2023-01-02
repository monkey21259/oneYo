<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.tip.vo.TipVO" %>
<%@ page import="main.ict.common.ConstPack" %>
<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); 

%>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("tipSelectContent.jsp 페이지 진입");
	
	//세션부여
	O_Session mSession = O_Session.getInstance();
	String mnum = mSession.getSession(request);
	
	TipVO tvo = null;
	
	if(request.getAttribute("list") !=null) {
		List<TipVO> list = (List<TipVO>)request.getAttribute("list");
		if(list !=null && list.size() == 1) {
			tvo = list.get(0);
			logger.info("tvo : \n" + tvo.toString());
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>
<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">

<!-- tipSelectContent.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/tip/tipSelectContent.css">

<!-- 댓글 기능 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/common/commentForm.css">

<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>

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
		
		//	검색 바 없어졌다 생기기 액션주는 all.js 함수
		hiddenAction();
		
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

<div id="center">
<!-- -------------------------------페이지 전용 center------------------------------- -->
<div id="container">
	<div id="tip_area">
		<div id="subject">
			제목 : <%= tvo.getTsubject() %>
		</div>

			<input id="tnum" name="tnum" type="hidden" value="<%= tvo.getTnum() %>">
			<input id="mnum" name="mnum" type="hidden" value="<%= tvo.getMnum() %>">
			<input id="tsubject" name="tsubject" type="hidden" value="<%= tvo.getTsubject() %>">
			<div id="content">
				<img src="/oneYo/img/tip/<%= tvo.getTphoto() %>"  style="width:200px; height:200px;">
				<br>
				내용 : <%= tvo.getTcontent() %>
				<br>
				좋아요 : <%= tvo.getLikecnt() %>
				<br>
				조회수 : <%= tvo.getThit() %>
				<br>
				카테고리 : <%= tvo.getTcategory() %>
				<br>
				작성일 : <%= tvo.getInsertdate() %>
				<br>
				작성자 : <%= tvo.getMnick() %>
				<br>
				<%
					Object likeObj = request.getAttribute("likeList");
					String likeyn = "Y";
					if(likeObj == null) likeyn = "N";
				%>
				<jsp:include page="/WEB-INF/view/like/likeForm.jsp" flush="true">
					<jsp:param name="mnum" value="<%=mnum %>"/>
					<jsp:param name="likethis" value="<%=tvo.getTnum() %>"/>
					<jsp:param name="likeyn" value="<%=likeyn %>"/>
				</jsp:include>
				<br>
				
				<%
 				if(mnum.equals(tvo.getMnum())){
				
				%>
				
				<input id="updateBtn" type="button" value="수정">
				<input id="deleteBtn" type="button" value="삭제">
				
				<%
 				}
				
				%>
				
				<input id="warningBtn" type="button" value="신고">
			</div>
		<jsp:include page="/WEB-INF/view/comment/commentForm.jsp" flush="true">
			<jsp:param name="cotnum" value="<%=tvo.getTnum() %>"/>
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