<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="java.util.List" %>

<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.common.O_Session" %>


<% Logger logger = LogManager.getLogger(this.getClass()); %>
<%
		
		Object recipeObj = request.getAttribute("recipeList");
		if (recipeObj == null) {
			logger.info("[FAIL] getAttribute -> recipeObj is null");
		}
		
		List<RecipeVO> recipeList = (List<RecipeVO>)recipeObj;
		
		//세션부여
				O_Session mSession = O_Session.getInstance();
				String mnum = mSession.getSession(request);
		
		if (recipeList.size() != 1) {
			logger.info("[FAIL] recipeList.size() != 1");
		}
		logger.info(recipeList.toString());
		
		RecipeVO recipevo = recipeList.get(0);
%>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<title>recipeSelectContent.jsp</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0
							maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			
			console.log("[recipeSelectContent.jsp] JS");
			$(document).ready(function() {
				
				console.log("[recipeSelectContent.jsp] jQuery");
				
				// UpdateForm, Delete
				$("#recipeUpdateFormBtn").on("click", function() {
					
					console.log("[Click] UpdateForm Button");
					$("#recipeSelectForm").attr({
						"action": "/oneYo/recipeUpdateForm.ict",
						"method": "POST",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				
				$("#recipeDeleteBtn").on("click", function() {
					
					console.log("[Click] Delete Button");
					$("#recipeSelectForm").attr({
						"action": "/oneYo/recipeDelete.ict",
						"method": "POST",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				
				$("#warningBtn").click(function(){
					
					$("#recipeSelectForm").attr({
						"action": "recipeWarningForm.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
					
				});
				
//				검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
			}); 
		
		</script>
		<style type="text/css">
		
			.recipeTable tr, .recipeTable td {
				border: 1px solid black;			
			}
		
		</style>
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- recipeSelectContent.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipe_selectContent.css">
		
		<!-- 댓글 기능 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/common/commentForm.css">
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
	</head>
	<body>
	<% logger.info("[recipeSelectContent.jsp] .jsp 진입"); %>
	<% request.setCharacterEncoding("UTF-8"); %>
<!--  -->
		<header></header>
<!--  -->
		<nav></nav>
<!--  -->
		<aside></aside>
<!-- Section -->
		<section>
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
			<div class="recipeSectionHeader">
				<span class="t">레시피(Recipe) 글보기</span>
			</div>
			<form id="recipeSelectForm">
				<input id="tnum" name="tnum" type="hidden" value="<%= recipevo.getRnum() %>">
				<input id="tsubject" name="tsubject" type="hidden" value="<%= recipevo.getRsubject() %>">
				<table class="recipeTable">
					<tr>
						<td colspan="2" style="text-align:center;">
							<span>레시피 글쓰기</span>
						</td>
					</tr>
					<tr> <%  // 글 제목 %>
						<td>글 제목</td>
						<td>
							<input type="text" id="rsubject" name="rsubject"
								   value="<%= recipevo.getRsubject() %>" readonly />
						</td>
					</tr>
					<tr> <%  // 요리 분야 %>
						<td>요리 분야</td>
						<td>
							<input type="text" id="rcategory" name="rcategory"
								   value="<%= CodeUtils.getRcategory(recipevo.getRcategory()) %>" readonly />
						</td>
					</tr>
					<tr> <%  // 음식 재료 %>
						<td id="rjeryo">재료</td>
						<td>
							<!-- input_text => 값을 담는 방식과 재료 종류를 설정해야함. -->
							<input type="text" id="rjeryo" name="rjeryo"
								   value="<%= recipevo.getRjeryo() %>" readonly />
						</td>
					</tr>
					<tr> <%  // 조리 시간 %>
						<td>시간</td>
						<td>
							<input type="text" id="rtime" name="rtime" 
								   value="<%= recipevo.getRtime() %>" readonly />
						</td>
					</tr>
					<tr> <%  // 인분 %>
						<td>인분</td>
						<td>
							<input type="text" id="rperson" name="rperson" 
								   value="<%= CodeUtils.getRperson(recipevo.getRperson()) %>" readonly />
						</td>
					</tr>
					<tr> <%  // 난이도: 쉬움(0), 보통(1), 어려움(2) %>
						<td>난이도</td>
						<td>
							<input type="text" id="rdiff" name="rdiff"
								   value="<%= CodeUtils.getRdiff(recipevo.getRdiff()) %>" readonly />
						</td>
					</tr>
<%  // 글 내용 %>
					<tr>
						<td>글 내용</td>
						<td>
							<textarea id="rcontent" name="rcontent" cols="10" rows="5" readonly><%= recipevo.getRcontent() %></textarea><br />
<%  // 음식 사진 %>
							<img src="/oneYo/img/recipe/<%= recipevo.getRphoto() %>" id="recipeImg" name="recipeImg"  />
							<input type="hidden" id="rphoto" name="rphoto" value="<%= recipevo.getRphoto() %>" />
						</td>
					</tr>
<%  // 글쓰기 버튼 %>
					<tr>
						<td colspan="2" style="text-align:right;">
							<input type="button" id="warningBtn" value="신고">
							<% 
							if(mnum.equals(recipevo.getMnum())){
							%>
							
							<a class="btn" id="recipeUpdateFormBtn">수정</a>
							<a class="btn" id="recipeDeleteBtn">삭제</a>
							
							<%
							}
							 %>
						</td>
					</tr>
				</table>
				!!! <%= recipevo.getLikecnt() %> !!!
<% // rnum, rhit, mnum, warning, deleteyn, insertdate, updatedate %>
				<input type="hidden" id="rnum" name="rnum" value="<%= recipevo.getRnum() %>" />
				<input type="hidden" id="mnum" name="mnum" value="<%= recipevo.getMnum() %>" />
	<!-- 데이터 사용여부 검토 필요 -->
				<input type="hidden" id="rhit" name="rhit" value="<%= recipevo.getRhit() %>" />	<!-- 조회수 -->
				<!-- <input type="hidden" id="warning" name="warning" value="" /> -->	<!-- 경고 -->
				<!-- deleteyn 삭제 -->
				<!-- <input type="hidden" id="insertdate" name="insertdate" value="<%= recipevo.getInsertdate() %>" /> -->	<!-- 일간/주간/월간 -->
				<input type="hidden" id="updatedate" name="updatedate" value="<%= recipevo.getUpdatedate() %>" />	<!-- 작성(수정) 시간 -->
			</form>
			<jsp:include page="/WEB-INF/view/comment/commentForm.jsp" flush="true">
				<jsp:param name="cotnum" value="<%=recipevo.getRnum() %>"/>
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
		</section>
	</body>
</html>