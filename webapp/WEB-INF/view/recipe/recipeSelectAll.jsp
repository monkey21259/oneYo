<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="java.util.List" %>

<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.common.O_Session" %>
<%@ page import="main.ict.common.CodeUtils" %>
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
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes" />
		<title>oneYo(오내요)</title>
		<!--  제이쿼리 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- recipe_selectAll.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipe_selectAll.css">
		
		<!-- 페이징 기능 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/common/paging.css">
	
		<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>

		<script type="text/javascript">
		
			console.log("[recipeSelectAll.jsp] JS");
			$(document).ready(function() {
				
				console.log("[recipeSelectAll.jsp] jQuery");
				$(".selectOne").on("click", function() {
					
					console.log("[click] recipes");
					
					var recipeInfos = $(this).children();
					var rnum = $(recipeInfos[0]).val();
					var mnum = $(recipeInfos[1]).val();
					
// 					console.log($(recipeInfos[0]));  // rnum 
// 					console.log($(recipeInfos[0]).val());  // R202301020048 
// 					console.log($(recipeInfos[1]));  // mnum
// 					console.log($(recipeInfos[1]).val());  // M202212300018
					
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
						
				//all.js 에 있는 모든 함수 연결
				allJavaScript();
				
			}); // end of $(document).ready();
			
			function recipeSearch() {
				
				location.href = "recipeSearchForm.ict";
			}
		
		</script>
	
	</head>
	<body>
		<% logger.info("[recipeSelectAll.jsp] .jsp 진입"); %>
		<div id="realAll">

<div id="backMenu"></div>

<div id="sideBar">
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

		<li class="item">
			<div class="warningForm">
			<span>
				신고
			</span>
			</div>
		</li>
		<li class="item">
<%
      if (mid == null || !(mid.equals("admin"))) {
%>
	         <div class="mypageHome">
	         <span>
	         	마이<br>페이지 
	         </span>
	         </div>
<%
      } else if (mid.equals("admin")) {
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
	<div>
		<jsp:include page="/WEB-INF/view/recipe/recipePage.jsp" flush="true">
				<jsp:param value="" name=""/>
		</jsp:include>	
	</div>
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
				<div class="menu">
					<a href="recipeSelectAll.ict" class="menu_link">
						<div>
							레시피
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="tipSelectAll.ict" class="menu_link">
						<div>
							Tip
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="communitySelectAll.ict" class="menu_link">
						<div>
							커뮤니티
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="noticeSelectAll.ict" class="menu_link">
						<div>
							공지사항
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="pulsMenu">
					<div class="menu">
						<a href="#" class="menu_link">
							<div>
								더보기
							</div>
						</a>
					</div>
					<div class="sub-menu">
					<ul>
						<li>
							<a href="entertainment.ict" class="menu_link">
							<div>
							엔터테이먼트
							</div>
							</a>
						</li>
						<li>
							<a href="chart.ict" class="menu_link">
							<div>
							차트
							</div>
							</a>
						</li>
						<li>
							<a href="goCalendar.ict" class="menu_link">
							<div>
							일정 관리
							</div>
							</a>
						</li>
					</ul>
					</div>
				</div>
			</li>
		</ul>
		</nav>
	</div>
	
</div>

<div id="center">
<!-- -------------------------------페이지 전용 center------------------------------- -->

<!-- Section -->		
		<section>				
<form id="recipeInsertForm">

<!-- 			<div class="recipeSectionHeader"> -->
<!-- 				<span class="t">레시피(Recipe) 게시판</span> -->
<!-- 			</div> -->
			
<!-- 			<div class="postTitles" data-num="1"> -->
<!-- 			 	<div class="favorPostTitle" data-value="recipe" data-num="1"> -->
<!-- 			 		<span>레시피</span> -->
<!-- 			 	</div> -->
<!-- 			 	<div class="favorPostTitle" data-value="tip" data-num="2"> -->
<!-- 			 		<span>전문가</span> -->
<!-- 			 	</div> -->
<!-- 			 	<div class="favorPostTitle" data-value="community" data-num="3"> -->
<!-- 			 		<span>커뮤니티</span> -->
<!-- 			 	</div> -->
<!-- 			 	<div class="favorPostTitle" data-value="notice" data-num="4"> -->
<!-- 			 		<span>공지사항</span> -->
<!-- 			 	</div> -->
<!-- 		 	</div> -->
		 	
		 	
		 	
			<div class="recipeSearchPeriodContainer">
<!-- 			<div class="recipeSearchPeriod"> -->
<!-- 				<div class="recipeSearchAll"> -->
<!-- 					<div class="t"> -->
<!-- 						<a href="javascript:void(0);"> -->
<!-- 							<span>일간</span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					| -->
<!-- 					<div class="t"> -->
<!-- 						<a href="javascript:void(0);"> -->
<!-- 							<span>주간</span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					| -->
<!-- 					<div class="t"> -->
<!-- 						<a href="javascript:void(0);"> -->
<!-- 							<span>월간</span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					| -->
<!-- 					<div class="t"><span>인기글</span></div> -->
<!-- 				</div> -->
				<div class="recipeBtnTwo">
					<a class="recipeSearchBtn" href="javascript:recipeSearch();">
						<div class="recipeSearchBtnDiv">
							<!-- 카테고리 조건 검색 -->
							검색
						</div>
					</a>
<%
				
				if (mnum.length() > 0) {
				
%>
				<div class="tright">
					<a href="/oneYo/recipeInsertForm.ict">
						<span>글 등록</span>
					</a>
				</div>
<%
				}
%>
				</div>
<!-- 			</div> -->
		 	
		 	
			<div class="recipeCategory">
				<!-- (조건 검색) 카테고리 넣는 공간 -->
				<div class="recipeCate">
					<a href="recipeCategorySelectAll.ict?rcategory=00">
						<img src="/oneYo/img/recipe/rcategory/recipekorea.png">
					</a>
				</div>
				<div class="recipeCate">
					<a href="recipeCategorySelectAll.ict?rcategory=01">
						<img src="/oneYo/img/recipe/rcategory/recipechina.png">
					</a>
				</div>
				<div class="recipeCate">
					<a href="recipeCategorySelectAll.ict?rcategory=02">
						<img src="/oneYo/img/recipe/rcategory/recipeyang.png">
					</a>
				</div>
				
				<div class="recipeCate">
					<a href="recipeCategorySelectAll.ict?rcategory=03">
						<img src="/oneYo/img/recipe/rcategory/recipejapan.png">
					</a>
				</div>
				<div class="recipeCate">
					<a href="recipeCategorySelectAll.ict?rcategory=04">
						<img src="/oneYo/img/recipe/rcategory/recipedesert.png">
					</a>
				</div>
				<div class="recipeCate">
					<a href="recipeCategorySelectAll.ict?rcategory=99">
						<img src="/oneYo/img/recipe/rcategory/recipeelse.png">
					</a>
				</div>
			</div>
			
			
<!-- 			<div class="recipeSearchPeriod"> -->
<!-- 				<div class="recipeSearchAll"> -->
<!-- 					<div class="t"> -->
<!-- 						<a href="javascript:void(0);"> -->
<!-- 							<span>일간</span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					| -->
<!-- 					<div class="t"> -->
<!-- 						<a href="javascript:void(0);"> -->
<!-- 							<span>주간</span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					| -->
<!-- 					<div class="t"> -->
<!-- 						<a href="javascript:void(0);"> -->
<!-- 							<span>월간</span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					| -->
<!-- 					<div class="t"><span>인기글</span></div> -->
<!-- 				</div> -->
<!-- 				<div class="recipeBtnTwo"> -->
<!-- 					<a class="recipeSearchBtn" href="javascript:recipeSearch();"> -->
<!-- 						<div class="recipeSearchBtnDiv"> -->
							<!-- 카테고리 조건 검색 -->
<!-- 							검색 -->
<!-- 						</div> -->
<!-- 					</a> -->
<%
				
// 				if (mnum.length() > 0) {
				
%>
<!-- 				<div class="tright"> -->
<!-- 					<a href="/oneYo/recipeInsertForm.ict"> -->
<!-- 						<span>글 등록</span> -->
<!-- 					</a> -->
<!-- 				</div> -->
<%
// 				}
%>
<!-- 				</div> -->
<!-- 			</div> -->
			
			
			
			</div>
			

			
<!-- 			<div class="recipeSearchPeriodContainerBottom"> -->

<!-- 				<div class="recipeBtnTwo"> -->
<!-- 				<span>&nbsp;</span> -->
<!-- 				</div> -->
<!-- 			</div> -->
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
			String rcategory = pagingVO.getRcategory();
			
			Object recipeObj = request.getAttribute("recipeList");
			if (recipeObj == null) {
				logger.info("[FAIL] getAttribute -> recipeObj is null");
			}
			
			List<RecipeVO> recipeList = (List<RecipeVO>)recipeObj;
			if (recipeList.size() < 1) {
				logger.info("[FAIL] Type Casting -> recipeList.size() < 1");
			}
			
// 			int rTotalHeight = 308 * (recipeList.size() / 4 + 1);
// 			logger.info(recipeList.size());
%>
<div class="choiceAll">
			
			<div class="choiceTableDiv">
				<table class="choiceTable">
<%
					RecipeVO recipevo = null;
					
	 				for (int i = 0; i<recipeList.size(); i++) {
	 					recipevo = recipeList.get(i);
	 					
	 					totalCount = Integer.parseInt(recipevo.getTotalCount());

						if (i % 4 == 0) {
%>
					<tr>
					<td class="choiceFour">
<%
						}
%>
						<!-- 한 게시글 -->
						<a href="javascript:void(0);">  <!-- 클릭 시 해당 내용이 있는 Content로 이동 -->
						<div class="selectOne">
							<input type="hidden" class="rnum" value="<%= recipevo.getRnum() %>" />
							<input type="hidden" class="mnum" value="<%= recipevo.getMnum() %>" />
							<table class="selectTable">
								<!-- 조회좋아 -->
								<tr>
									<td class="optionTd">
										<div>
											<span>조회수 :</span>
											<p><%= recipevo.getRhit() %></p>
										</div>
										<div>
											<span>좋아요 :</span>
											<p><%=recipevo.getLikecnt() %></p>
										</div>
									</td>
								</tr>
								<!-- 썸네일 -->
								<tr>
									<td class="imgTd">
										<div>
											<img src="/oneYo/img/recipe/<%= recipevo.getRphoto() %>" id="rphoto">
										</div>
									</td>
								</tr>
								<!-- 분류 -->
								<tr>
									<td class="cateTd">
										<p>
										<%= CodeUtils.getRcategory(recipevo.getRcategory()) %>
										</p>
									</td>
								</tr>
								<!-- 제목 -->
								<tr>
									<td class="nameTd">
										<div>
										<%= recipevo.getRsubject() %>
										</div>
									</td>
								</tr>
								<!-- 작성자 -->
								<tr>
									<td class="nameTd">
										<p>
										작성자
										</p>
										<span>
										<%= recipevo.getMnick() %>
										</span>
									</td>
								</tr>
								<!-- 작성일 -->
								<tr>
									<td class="dayTd">
										<div>
										<%= recipevo.getInsertdate() %>
										</div>
									</td>
								</tr>
							</table>
						</div>
						</a>
<%
					if (i % 4 == 3) {
%>
					</td>
					</tr>
<%
					}else if (recipeList.size() == i + 1 && (i + 1) % 4 > 0) {
						for (int j = 0; j < 4 - (i + 1) % 4; j++) {
%>
						<div class="notOne hidden_O"></div>
<%
						}
%>
					</td>
					</tr>
<%
					}
				}
%>
			</table>
		</div>
	</div>
				<br><br><br>
					<jsp:include page="/WEB-INF/view/paging/paging.jsp" flush="true">
						<jsp:param value="recipeSelectAll.ict" name="url"/>
						<jsp:param value="" name="str"/>
						<jsp:param value="<%=pageSize %>" name="pageSize"/>
						<jsp:param value="<%=groupSize %>" name="groupSize"/>
						<jsp:param value="<%=curPage %>" name="curPage"/>
						<jsp:param value="<%=totalCount %>" name="totalCount"/>
						<jsp:param value="<%=rcategory %>" name="rcategory"/>
					</jsp:include>

	<input type="hidden" id="rnum" name="rnum" value="" />
	<input type="hidden" id="mnum" name="mnum" value="" />
</form>
	</section>
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
			
		
	</body>
</html>