<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="java.util.List" %>

<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% Logger logger = LogManager.getLogger(this.getClass()); %>

<%
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
	
	logger.info("mnum: " + mnum);
	logger.info("mid: " + mid);
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>recipeSelectAll.jsp</title>
		<!--  제이쿼리 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		<!-- communitySelectAll.jsp 전용 -->
		<script type="text/javascript">
		
			console.log("[recipeSelectAll.jsp] JS");
			$(document).ready(function() {
				
				console.log("[recipeSelectAll.jsp] jQuery");
				$(".recipes").on("click", function() {
					
					console.log("[click] recipes");
					
					var recipeInfos = $(this).siblings();
					var rnum = recipeInfos[0].value;
					var mnum = recipeInfos[1].value;
					
					$("#rnum").val(rnum);
					$("#mnum").val(mnum);
					
					$("#recipeInsertForm").attr({
						"action": "/oneYo/recipeSelectContent.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				
				// 로그인 / 로그아웃 / 회원가입 / 마이페이지 ----------
				$("#newMemBtn").on("click", function() {
					console.log("[회원가입] 버튼 클릭");
					location.href="/oneYo/memGrade.ict";
				});
				
				$("#loginBtn").on("click", function() {
					console.log("[로그인] 버튼 클릭");
					location.href="/oneYo/loginForm.ict";
				});
				
				$("#logoutBtn").on("click", function() {
					console.log("[로그아웃] 버튼 클릭");
					$("#logoutForm").attr({
						"action": "/oneYo/logout.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				// ------------------------------------------
				
				//	검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
				//	홈으로 보내주는 all.js 함수
				homeAction();
				//	메뉴바 클릭액션 all.js 함수
				divClickAction();
				
			});
		
		</script>
		<!-- recipe_selectAll.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipe_selectAll.css">
		<!-- 페이징 기능 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/common/paging.css">
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
	</head>
	<body>
		<% logger.info("[recipeSelectAll.jsp] .jsp 진입"); %>
<!--  -->
		<header></header>
<!--  -->
		<nav></nav>
<!--  -->
		<aside></aside>
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
	 		<form id="logoutForm">
	 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
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
				
<!-- Section -->		
		<section>
			<div class="recipeSectionHeader">
				<span class="t">레시피(Recipe) 게시판</span>
			</div>
			<div class="recipeCategory">
				<!-- (조건 검색) 카테고리 넣는 공간 -->
				카테고리 넣는 공간
			</div>
			<div class="recipeSearchBtnDiv">
				<!-- 카테고리 조건 검색 -->
				<a class="recipeSearchBtn" href="javascript:void(0);">검색</a>
			</div>
			<div class="recipeSearchPeriodContainer">
				<div class="t">
					<a href="javascript:void(0);">
						<span>&nbsp;일간&nbsp;</span>
					</a>/
				</div>
				<div class="t">
					<a href="javascript:void(0);">
						<span>&nbsp;주간&nbsp;</span>
					</a>/
				</div>
				<div class="t">
					<a href="javascript:void(0);">
						<span>&nbsp;월간&nbsp;</span>
					</a>/
				</div>
				<div class="t">&nbsp;인기글</div>
<%
				
				if (mnum.length() > 0) {
				
%>
				<div class="tright">
					<a href="/oneYo/recipeInsertForm.ict">
						<span>글 등록 버튼</span>
					</a>
				</div>
<%
				}
%>
			</div>
<%
			Object pagingObj = request.getAttribute("pagingVO");
			if (pagingObj == null) {
				logger.info("[FAIL] getAttribute -> pagingObj is null");
			}
			RecipeVO pagingVO = (RecipeVO)pagingObj;
			int pageSize = Integer.parseInt(pagingVO.getPageSize());
			int groupSize = Integer.parseInt(pagingVO.getGroupSize());
			int curPage = Integer.parseInt(pagingVO.getCurPage());
			int totalCount = 0;
			
			Object recipeObj = request.getAttribute("recipeList");
			if (recipeObj == null) {
				logger.info("[FAIL] getAttribute -> recipeObj is null");
			}
			
			List<RecipeVO> recipeList = (List<RecipeVO>)recipeObj;
			if (recipeList.size() < 1) {
				logger.info("[FAIL] Type Casting -> recipeList.size() < 1");
			}
			
			int rTotalHeight = 308 * (recipeList.size() / 4 + 1);
// 			logger.info(recipeList.size());
%>
				<form id="recipeInsertForm">
			
					<div class="recipeSection" style="height:<%= rTotalHeight %>px"> <!-- loop -->
<%
					RecipeVO recipevo = null;
	 				for (int i=0; i<recipeList.size(); i++) {
	 					recipevo = recipeList.get(i);
	 					
	 					totalCount = Integer.parseInt(recipevo.getTotalCount());
%>
						<a href="javascript:void(0);">  <!-- 클릭 시 해당 내용이 있는 Content로 이동 -->
							<div class="recipes">
								<div style="margin:10%;height:77%;">
									<%= recipevo.getRsubject() %>
								</div>
							</div>
							<input type="hidden" class="rnum" value="<%= recipevo.getRnum() %>" />
							<input type="hidden" class="mnum" value="<%= recipevo.getMnum() %>" />
						</a>
<%
						if (i % 4 == 0 && i > 0) {
%>
							<br />
<%
						}
	 				}
%>
						<input type="hidden" id="rnum" name="rnum" value="<%= recipevo.getRnum() %>" />
						<input type="hidden" id="mnum" name="mnum" value="<%= recipevo.getMnum() %>" />
					</div>
					<jsp:include page="/WEB-INF/view/paging/paging.jsp" flush="true">
							<jsp:param value="recipeSelectAll.ict" name="url"/>
								<jsp:param value="" name="str"/>
								<jsp:param value="<%=pageSize %>" name="pageSize"/>
								<jsp:param value="<%=groupSize %>" name="groupSize"/>
								<jsp:param value="<%=curPage %>" name="curPage"/>
								<jsp:param value="<%=totalCount %>" name="totalCount"/>
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
			
		</form>
	</section>
	</body>
</html>