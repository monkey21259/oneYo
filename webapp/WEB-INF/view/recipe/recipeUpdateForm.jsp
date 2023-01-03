<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.common.CommonUtils" %>

<% Logger logger = LogManager.getLogger(this.getClass()); %>
<%
		Object recipeObj = request.getAttribute("recipevo");
		if (recipeObj == null) {
			logger.info("[FAIL] getAttribute -> recipeObj is null");
		}
		RecipeVO recipevo = (RecipeVO)recipeObj;
		logger.info(recipevo.toString());
%>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<title>recipeSelectContent.jsp</title>
	<!-- jQuery -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
	<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
	
	<!-- 전체 css -->
	<link rel="stylesheet" href="/oneYo/resource/css/all.css">
	<!-- recipeupdateForm.jsp 전용 -->
	<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipe_updateForm.css">		
		
		<script type="text/javascript">
			
			console.log("[recipeSelectContent.jsp] JS");
			$(document).ready(function() {
				
				console.log("[recipeSelectContent.jsp] jQuery");
				
				// Setting --------------------------------------------------------------
				
				/* 음식 카테고리 */ // 기타
				var rcategory = "<%= CodeUtils.getRcategoryVal(recipevo.getRcategory()) %>";
				$("#rcategory option[value='" + rcategory + "']").prop('selected', true);
				
				/* 조리 시간 */ // 00시 10분
				var rhour, rminute;
<%-- 				console.log("<%= recipevo.getRtime() %>");		// 255분 --%>
<%-- 				console.log("<%= recipevo.getRperson() %>");	// 6인분 --%>
				
				let hour_min = "<%= CommonUtils.minuteToHour(recipevo.getRtime()) %>";
				
				if (hour_min.includes("시")) {  /* 시간이 포함된 경우 */
					rhour = hour_min.split('시')[0].trim();
					console.log(rhour);
					$("#rhour option[value='" + rhour + "']").prop('selected', true);
				}
				if (rhour === undefined) {
					rminute = hour_min.split('분')[0].trim();
				} else {
					rminute = hour_min.split('시')[1]
									  .split('분')[0]
									  .trim();
				}
				$("#rminute option[value='" + rminute + "']").prop('selected', true);
				
				/* 인분 */ // 2인분
<%-- 				var rperson = "<%= recipevo.getRperson() %>".split("인분")[0]; --%>
				$("#rperson option[value='" + "<%= recipevo.getRperson() %>" + "']").prop('selected', true);
				
				/* 난이도 */
				var rdiff = "<%= CodeUtils.getRdiffVal(recipevo.getRdiff()) %>";
				$("#rdiff option[value='" + rdiff + "']").prop('selected', true);
				
				// Setting END ---------------------------------------------------------
				
				// Update
				$("#recipeUpdateBtn").on("click", function() {
					
					console.log("[Click] UpdateForm Button");
					
					// rtime Setting
// 					console.log($("#rhour option:selected").val());
// 					console.log($("#rminute option:selected").val());
					let rtime = "";
					rtime += $("#rhour option:selected").val();
					rtime += "시 "
					rtime += $("#rminute option:selected").val();
					rtime += "분"
					$("#rtime").val(rtime);
					
					// 사진 변경 여부에 따른 분기 처리
					// 일단은 POST로 전달하는걸로 (기존 rphoto 보내는쪽으로)
					$("#recipeUpdateForm").attr({
						"action": "/oneYo/recipeUpdate.ict",
						"method": "POST",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				
				let selectjeryo = "<%=recipevo.getRjeryo()%>";
				let valJeryo = selectjeryo.replaceAll("#", " ");
				console.log("valJeryo : " + valJeryo);
				$("#jeryocan").text(valJeryo + " ");
				$("#data").val("<%=recipevo.getRjeryo()%>");
				let i = "";
				$("#jeryo").click(function(){
					
					
					let jeryo = $("#jeryoText").val();
					$("#jeryoText").val("");
					$("#jeryocan").append(jeryo + " ");
					let rjeryo = "#" + jeryo;
					console.log("w :" + rjeryo);
					i = $("#data").val();
					i = i + rjeryo;
					console.log("w :" + i);
					
					$("#data").val(i);
					
					let info = $("#data").val();
					console.log("최종 : " + info);
					
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
		<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipe_updateForm.css">
	</head>
	<body>
	<% logger.info("[recipeUpdateForm.jsp] .jsp 진입"); %>
	<% request.setCharacterEncoding("UTF-8"); %>
<!--  -->
		<header></header>
<!--  -->
		<nav></nav>
<!--  -->
		<aside></aside>
<!-- Section -->		
		<section>
			<form id="recipeUpdateForm">
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
<!-- 			<div class="recipeSectionHeader"> -->
<!-- 				<span class="t">레시피(Recipe) 글 수정 페이지</span> -->
<!-- 			</div> -->
				<table class="recipeTable">
					<tr>
						<td colspan="2" style="text-align:center;">
							<span>레시피 글 수정하기</span>
						</td>
					</tr>
<%  // 글 제목 %>
					<tr>
						<td>글 제목</td>
						<td>
							<input type="text" id="rsubject" name="rsubject"
								   value="<%= recipevo.getRsubject() %>" />
						</td>
					</tr>
<%  // 요리 분야 %>
					<tr>
						<td>요리 분야</td>
						<td>
							<select class="rcategory" id="rcategory" name="rcategory">
								<option value="00">한식</option>
								<option value="01">중식</option>
								<option value="02">양식</option>
								<option value="03">일식</option>
								<option value="04">디저트</option>
								<option value="99">기타</option>
							</select>
						</td>
					</tr>
<%  // 음식 재료 %>
					<tr>
					<td id="rjeryo">재료</td>
						<td>
							<!-- input_text => 값을 담는 방식과 재료 종류를 설정해야함. -->
							<input type="hidden" id="data" name="rjeryo" value="">
							<input type="text" id="jeryoText" name="rjeryoSelect" value="" placeholder="재료를 입력하세요." />
							<input id="jeryo" type="button" value="재료등록"><br>
							<p id="jeryocan"></p>
						</td>			
<!-- 						<td id="rjeryo">재료</td> -->
<!-- 						<td> -->
<!-- 							input_text => 값을 담는 방식과 재료 종류를 설정해야함. -->
<!-- 							<input type="text" id="rjeryo" name="rjeryo" -->
<%-- 								   value="<%= recipevo.getRjeryo() %>" /> --%>
<!-- 						</td> -->
					</tr>
<%  // 조리 시간 %>
					<tr>
						<td>시간</td>
						<td>
							<select id="rhour" name="rhour">
<%	// ---- 시(0 ~ 23)
							for (int i=0; i<24; i++) {
%>
								<option value=<%= i %>><%= i %></option>
<%
							}
%>							</select>&nbsp;시간&nbsp;
							<select id="rminute" name="rminute">
<%	// ---- 분(0 ~ 59)
							for (int i=0; i<60; i++) {
%>								
								<option value=<%= i %>><%= i %></option>
<%							
							}
%>							</select>&nbsp;분&nbsp;
						</td>
					</tr>
					<tr>
						<td>인분</td>
						<td>
							<select id="rperson" name="rperson">
<%  // ---- 몇 인분(max=10)
							for (int i=1; i<11; i++) {
%>
								<option value="<%= i %>인분"><%= i %>인분</option>
<%
							}
%>							</select>
						</td>
					</tr>
<%  // 난이도: 쉬움(0), 보통(1), 어려움(2) %>
					<tr>
						<td>난이도</td>
						<td>
							<select id="rdiff" name="rdiff">
								<option value="0">쉬움</option>
								<option value="1">보통</option>
								<option value="2">어려움</option>
							</select>
						</td>
					</tr>
<%  // 글 내용 %>
					<tr>
						<td>글 내용</td>
						<td>
							<textarea id="rcontent" name="rcontent" cols="50" rows="5"><%= recipevo.getRcontent() %></textarea><br />
<%  // 음식 사진 %>
							<img src="/oneYo/img/recipe/<%= recipevo.getRphoto() %>" id="recipeImg" name="recipeImg" />
						<!-- 사진 변경 시 Ajax(+ 태그 값 변경) >>> input type="file" 추가해서 로직 작성 필요 -->
							<input type="hidden" id="rphoto" name="rphoto" value="<%= recipevo.getRphoto() %>" />
						</td>
					</tr>
<%  // 글쓰기 버튼 %>
					<tr>
						<td colspan="2" style="text-align:right;">
							<a class="btn" id="recipeUpdateBtn">수정완료</a>
						</td>
					</tr>
				</table>
<% // Other Settings %>
				<input type="hidden" id="rnum" name="rnum" value="<%= recipevo.getRnum() %>" />
				<input type="hidden" id="rtime" name="rtime" value="" />
				<input type="hidden" id="mnum" name="mnum" value="<%= recipevo.getMnum() %>" />
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