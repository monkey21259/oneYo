<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.common.CommonUtils" %>
<%@ page import="main.ict.common.O_Session" %>

<% Logger logger = LogManager.getLogger(this.getClass()); %>
<%
	Object recipeObj = request.getAttribute("recipevo");
	if (recipeObj == null) {
		logger.info("[FAIL] getAttribute -> recipeObj is null");
	}
	RecipeVO recipevo = (RecipeVO)recipeObj;
	logger.info(recipevo.toString());
%>
<%
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
	
	logger.info("mnum: " + mnum);
	logger.info("mid: " + mid);
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
	<!-- recipeInsertForm.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipe_insertForm.css">
	<!-- recipeupdateForm.jsp 전용 -->
<!-- 	<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipe_updateForm.css">		 -->
	<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
	<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		
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

				//	사진 미리 보기
				$(document).on('change', '#rphoto', function() {
					preview(this);
				});
				
			});
			
//			사진 미리 보기
			function preview(fileP) {
				if(fileP.files && fileP.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#preview').attr('src', e.target.result);
					}
					reader.readAsDataURL(fileP.files[0]);
				}
			}
			
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


<div id="viewTable">
<table id="insertContent">
<!-- #recipeTable -->
		<!-- 카테고리 -->
	<tr>
		<td id="recipe" class="selectTd cateTd">
			<span>레시피 글 수정</span>
		</td>
	</tr>
	<!-- 글쓰기 -->
	<tr>
		<td style="text-align:right;">
			<a class="btn buttons" id="recipeUpdateBtn">수정완료</a>
		</td>
	</tr>
	<!-- 글 제목 -->
	<tr class="subjectTr"> <%  // 글 제목 %>
		<td class="selectTd subjectTd">
			<div class="subjectDiv">
				글 제목
			</div>
			<p>
				<input type="text" id="rsubject" name="rsubject" value="<%= recipevo.getRsubject() %>" />
			</p>
			<div id="hrDiv"></div>
		</td>
	</tr>
	<!-- 레시피 옵션 (분야 시간 인원 난이도 재료) -->
	<tr>
		<td class="selectTd infoTd">
		<!-- 요리분야 -->
			<div class="oneTd">
				<table>
					<tr>
						<td class="nameTd">
						요리분야
						</td>
					</tr>
					<tr>
						<td class="valTd">
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
				</table>
			</div>
			<!-- 조리시간 -->
			<div class="oneTd oneTdSpe">
				<table>
					<tr>
						<td class="nameTd">
						조리시간
						</td>
					</tr>
					<tr>
						<td class="valTd">
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
				</table>
			</div>
			<!-- 인분 -->
			<div class="oneTd">
				<table>
					<tr>
						<td class="nameTd">
						식사인원
						</td>
					</tr>
					<tr>
						<td class="valTd">
							<select id="rperson" name="rperson">
								<option value="1인분" selected>1인분</option>
<%  // ---- 몇 인분(max=10)
							String rPerson = null;
							for (int i=2; i<11; i++) {
								rPerson = "";
								
								rPerson += i;
%>
								<option value="<%= rPerson %>인분"><%= i %>인분</option>
<%
							}
%>							</select>
						</td>
					</tr>
				</table>
			</div>
			<!-- 난이도 -->
			<div class="oneTd">
				<table>
					<tr>
						<td class="nameTd">
						난이도
						</td>
					</tr>
					<tr>
						<td class="valTd selectOption">
							<select id="rdiff" name="rdiff">
								<option value="0">쉬움</option>
								<option value="1">보통</option>
								<option value="2">어려움</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<!-- 사진 -->
			<div class="twoTd photoTd">
				<table>
					<tr>
						<td class="nameTd">
							<label for="rphoto">사진</label>
						</td>
						<td class="valTd">
							<label for="rphoto">
								<img src="/oneYo/img/recipe/<%= recipevo.getRphoto() %>" id="recipeImg" name="recipeImg" />
								<img id="preview">
							</label>
							<label for="rphoto" class="photoBtn">사진</label>
							<input type="file" id="rphoto" name="rphoto"  accept=".jpg, .jpeg, .png, .gif" hidden/>
						<!-- 사진 변경 시 Ajax(+ 태그 값 변경) >>> input type="file" 추가해서 로직 작성 필요 -->
							<input type="hidden" id="rphotoOld" name="rphotoOld" value="<%= recipevo.getRphoto() %>" />
						</td>
					</tr>
				</table>
			</div>
			<!-- 재료 -->
			<div class="twoTd">
				<table>
					<tr>
						<td id="rjeryo" class="nameTd">
							재료
						</td>
					</tr>
					<tr>
						<td class="valTd">
							<!-- input_text => 값을 담는 방식과 재료 종류를 설정해야함. -->
							<input type="hidden" id="data" name="rjeryo" value="">
							<input type="text" id="jeryoText" name="rjeryoSelect" value="" placeholder="재료를 입력하세요." />
							<span id="jeryo">재료등록</span>
							<p id="jeryocan"></p>
						</td>
					</tr>
				</table>
			</div>
			<div id="hrDiv"></div>
		</td>
	</tr>
	<!-- 본문 -->
	<tr>
		<td>
			<div class="neyong" id="neyong" style="display:table;">
				<input type="hidden" id="rcontent" name="rcontent">
				<div class="neyong" style="display:flex; align-items:center;">
					<img src="/oneYo/img/numbering/number1.png" width="45" height="45">&nbsp;
<!-- 									<textarea class="rcontent" placeholder="내용을 입력해주세요"></textarea> -->
					<input type="text" class="rcontent" placeholder="내용을 입력해주세요">
				</div>
			</div>
			<div class="btnsBottom">
				<span id="addRcontentBtn" class="buttons">단계 추가하기</span>
				<span id="removeRcontentBtn" class="buttons">단계 빼기</span>
			</div>
		</td>
	</tr>
	
</table>

<input type="hidden" id="rnum" name="rnum" value="<%= recipevo.getRnum() %>" />
<input type="hidden" id="rtime" name="rtime" value="" />
<input type="hidden" id="mnum" name="mnum" value="<%= recipevo.getMnum() %>" />

</div>






<!-- 			<div class="recipeSectionHeader"> -->
<!-- 				<span class="t">레시피(Recipe) 글 수정 페이지</span> -->
<!-- 			</div> -->
<!-- 				<table class="recipeTable"> -->
<!-- 					<tr> -->
<!-- 						<td colspan="2" style="text-align:center;"> -->
<!-- 							<span>레시피 글 수정하기</span> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<%  // 글 제목 %>
<!-- 					<tr> -->
<!-- 						<td>글 제목</td> -->
<!-- 						<td> -->
<!-- 							<input type="text" id="rsubject" name="rsubject" -->
<%-- 								   value="<%= recipevo.getRsubject() %>" /> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<%  // 요리 분야 %>
<!-- 					<tr> -->
<!-- 						<td>요리 분야</td> -->
<!-- 						<td> -->
<!-- 							<select class="rcategory" id="rcategory" name="rcategory"> -->
<!-- 								<option value="00">한식</option> -->
<!-- 								<option value="01">중식</option> -->
<!-- 								<option value="02">양식</option> -->
<!-- 								<option value="03">일식</option> -->
<!-- 								<option value="04">디저트</option> -->
<!-- 								<option value="99">기타</option> -->
<!-- 							</select> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<%  // 음식 재료 %>
<!-- 					<tr> -->
<!-- 					<td id="rjeryo">재료</td> -->
<!-- 						<td> -->
							<!-- input_text => 값을 담는 방식과 재료 종류를 설정해야함. -->
<!-- 							<input type="hidden" id="data" name="rjeryo" value=""> -->
<!-- 							<input type="text" id="jeryoText" name="rjeryoSelect" value="" placeholder="재료를 입력하세요." /> -->
<!-- 							<input id="jeryo" type="button" value="재료등록"><br> -->
<!-- 							<p id="jeryocan"></p> -->
<!-- 						</td>			 -->
<!-- 						<td id="rjeryo">재료</td> -->
<!-- 						<td> -->
<!-- 							input_text => 값을 담는 방식과 재료 종류를 설정해야함. -->
<!-- 							<input type="text" id="rjeryo" name="rjeryo" -->
<%-- 								   value="<%= recipevo.getRjeryo() %>" /> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<%  // 조리 시간 %>
<!-- 					<tr> -->
<!-- 						<td>시간</td> -->
<!-- 						<td> -->
<!-- 							<select id="rhour" name="rhour"> -->
<%	// ---- 시(0 ~ 23)
// 							for (int i=0; i<24; i++) {
%>
<%-- 								<option value=<%= i %>><%= i %></option> --%>
<%
// 							}
%>						<!-- 	</select>&nbsp;시간&nbsp; -->
<!-- 							<select id="rminute" name="rminute"> -->
<%	// ---- 분(0 ~ 59)
// 							for (int i=0; i<60; i++) {
%>								
<%-- 								<option value=<%= i %>><%= i %></option> --%>
<%							
// 							}
%>							<!-- </select>&nbsp;분&nbsp; -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td>인분</td> -->
<!-- 						<td> -->
<!-- 							<select id="rperson" name="rperson"> -->
<%  // ---- 몇 인분(max=10)
// 							for (int i=1; i<11; i++) {
%>
<%-- 								<option value="<%= i %>인분"><%= i %>인분</option> --%>
<%
// 							}
%>							<!-- </select> -->
<!-- 						</td> -->
					</tr>
<%  // 난이도: 쉬움(0), 보통(1), 어려움(2) %>
<!-- 					<tr> -->
<!-- 						<td>난이도</td> -->
<!-- 						<td> -->
<!-- 							<select id="rdiff" name="rdiff"> -->
<!-- 								<option value="0">쉬움</option> -->
<!-- 								<option value="1">보통</option> -->
<!-- 								<option value="2">어려움</option> -->
<!-- 							</select> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<%  // 글 내용 %>
<!-- 					<tr> -->
<!-- 						<td>글 내용</td> -->
<!-- 						<td> -->
<%-- 							<textarea id="rcontent" name="rcontent" cols="50" rows="5"><%= recipevo.getRcontent() %></textarea><br /> --%>
<%  // 음식 사진 %>
<%-- 							<img src="/oneYo/img/recipe/<%= recipevo.getRphoto() %>" id="recipeImg" name="recipeImg" /> --%>
						<!-- 사진 변경 시 Ajax(+ 태그 값 변경) >>> input type="file" 추가해서 로직 작성 필요 -->
<%-- 							<input type="hidden" id="rphoto" name="rphoto" value="<%= recipevo.getRphoto() %>" /> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<%  // 글쓰기 버튼 %>
<!-- 					<tr> -->
<!-- 						<td colspan="2" style="text-align:right;"> -->
<!-- 							<a class="btn" id="recipeUpdateBtn">수정완료</a> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
<% // Other Settings %>
<%-- 				<input type="hidden" id="rnum" name="rnum" value="<%= recipevo.getRnum() %>" /> --%>
<!-- 				<input type="hidden" id="rtime" name="rtime" value="" /> -->
<%-- 				<input type="hidden" id="mnum" name="mnum" value="<%= recipevo.getMnum() %>" /> --%>
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
			</form>
			<form id="logoutForm">
	 			<input type="hidden" id="mid" name="mid" value="<%= mid %>" />
	 		</form>
		</section>
	</body>
</html>