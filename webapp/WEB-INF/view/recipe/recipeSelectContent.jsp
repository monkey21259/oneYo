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
		logger.info("recipeList: " + recipeList);
		
		//세션부여
		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(request);
		String mid = (String)mSession.getAttribute(request, "mid");
		
		logger.info("mnum >>> : " + mnum);
		logger.info("mid: " + mid);
		
		if (recipeList.size() != 1) {
			logger.info("[FAIL] recipeList.size() != 1");
		}
		logger.info(recipeList.toString());
		
		RecipeVO recipevo = recipeList.get(0);
		logger.info(" recipevo.getMnum()>>>:" + recipevo.getMnum());
%>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<title>recipeSelectContent.jsp</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0
							maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<!-- jQuery -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<!-- 칸 나눈 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
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
				
				//	검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
				//	홈으로 보내주는 all.js 함수
				homeAction();
				//	메뉴바 클릭액션 all.js 함수
				divClickAction();
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
			<div class="searchBarBtn">
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
		if (mid == null || mid.equals("")) {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">:</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
<%
		} else {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="#" onclick="javascript:alert('준비중입니다.');">마이페이지</span>
				<span class="Choonsik">:</span>
		 		<span class="Choonsik" id="logoutBtn">로그아웃</span>
<%
		String mSNSid = mid;
		if (mid != null && !(mid.equals(""))) {
			if (mid.length() > 5) {
				mSNSid = mid.substring(0, 6);
				if (mSNSid.equals("naver_")) {
					mSNSid = "naver"; 
				}
				if (mSNSid.equals("kakao_")) {
					mSNSid = "kakao";
				}
			}
		}
%>
				<p><%= mSNSid %> <span>님 환영합니다.</span></p>
	 		</div>
	 		<p></p>
	 		<form id="logoutForm">
	 			<input type="hidden" id="mid" name="mid" value="<%= mid %>" />
	 		</form>
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
					<tr>
						<td colspan="2">
							<%
								Object likeObj = request.getAttribute("likeList");
								String likeyn = "Y";
								if(likeObj == null) likeyn = "N";
							%>
							<jsp:include page="/WEB-INF/view/like/likeForm.jsp" flush="true">
								<jsp:param name="mnum" value="<%=mnum %>"/>
								<jsp:param name="likethis" value="<%=recipevo.getRnum() %>"/>
								<jsp:param name="likeyn" value="<%=likeyn %>"/>
							</jsp:include>
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
		<span>회원 수: ${ Count.get(0).membercnt }명</span> / <span>레시피글 수: ${ Count.get(0).recipecnt }개</span><br />
		<span>전문가팁글 수: ${ Count.get(0).tipcnt }개</span> / <span>커뮤니티글 수: ${ Count.get(0).communitycnt }개</span><br />
	</div>
</div>

</div>
</div>
		</section>
	</body>
</html>