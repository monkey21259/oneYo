<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="java.util.List" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="main.ict.common.O_Session" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.tip.vo.TipVO" %>
<%@ page import="main.ict.home.vo.HomeVO" %>

<% Logger logger = LogManager.getLogger(this.getClass()); %>
<% logger.info(".jsp 진입"); %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
%>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<!-- [221230] 반응형 페이지 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes" />
		<title>oneYo(오내요)</title>
		<!-- jQuery -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- 칸 나눈 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		<!-- home 페이지 전용 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipe_selectAll.css">
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<script type="text/javascript" src="/oneYo/resource/js/home/home.js" charset="UTF-8"></script>
		<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		
		<link rel="stylesheet" href="/oneYo/resource/css/mypage/myPageHome.css">
		<script type="text/javascript">
		
			console.log("[home.jsp] JS");
			
			$(document).ready(function() {
				
				console.log("[home.jsp] jQuery");
				
				$("#warningForm").click(function(){
					location.href="warningForm.ict";
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
				
				var mnum = '<%= request.getParameter("mnum") %>';
				
				// 페이지 진입 후 기본적으로 recipe 데이터가 보여짐
				$.ajax({
					type:'GET',
					url: '/oneYo/recipe/' + mnum + '.ict',
					dataType: 'text',
					success: whenSuccess,
					error: whenError
				});
					
				// 레시피버튼을 누를 경우
				$(document).on("click", "#recipeBtn", function(){
					console.log("recipeBtn 버튼 클릭 이벤트 발생");
					
					$.ajax({
						type:'GET',
						url: '/oneYo/recipe/' + mnum + '.ict',
						dataType : 'text',
						success : whenSuccess,
						error: whenError
					});
				});
				
				// 팁버튼을 누를 경우
				$(document).on("click", "#tipBtn", function(){
					console.log("tipBtn 버튼 클릭 이벤트 발생");
					
					$.ajax({
						type:'GET',
						url: '/oneYo/tip/' + mnum + '.ict',
						dataType : 'text',
						success : whenSuccess,
						error: whenError
					});
				});
				
				// 커뮤니티 누를 경우
				$(document).on("click", "#communityBtn", function(){
					console.log("communityBtn 버튼 클릭 이벤트 발생");
					
					$.ajax({
						type:'GET',
						url: '/oneYo/community/' + mnum + '.ict',
						dataType : 'text',
						success : whenSuccess,
						error: whenError
					});
				});
				
				// 레시피 더보기
				$(document).on("click", "#recipeShowMore", function(){
					console.log("레시피  보기");
					location.href = "chefRecipeShowMore.ict?mnum=" + mnum;
				});
				
				// 전문가팁 더보기
				$(document).on("click", "#tipShowMore", function(){
					console.log("팁 더보기");
					location.href = "chefTipShowMore.ict?mnum=" + mnum;
				});
				
				// 커뮤니티 더보기
				$(document).on("click", "#communityShowMore", function(){
					console.log("커뮤니티 더 보기");
					location.href = "chefCommunityShowMore.ict?mnum=" + mnum;
				});

				//all.js 에 있는 모든 함수 연결
				allJavaScript();
				
			});
			
			function whenSuccess(data) {
				console.log(data);
				let json = JSON.parse(data);
				let recipe_html = "";
				
				console.log(json.mem[0].mgrade);
				console.log(json.mem[0].mnick);
				console.log(json.mem[0].mprofile);
				console.log(json.mem[0].mnum);
				
				console.log("레시피 : " + data);
				console.log("레시피 : " + json.hasOwnProperty('recipe'));
				console.log("레시피 : " + Object.keys(json));
				
				if(json.hasOwnProperty('mem')) {
					$("#mnick").text(json.mem[0].mnick);
					$("#insertdate").text(json.mem[0].insertdate);
					$("#mprofile").attr("src", "/oneYo/img/mem/" + json.mem[0].mprofile);
					$("#mgrade").text(categoryLabeling(json.mem[0].mgrade, 'mem'));
				}
				
				if(json.hasOwnProperty('recipe')) {
					
					console.log("조호된 recipe 데이터가 " + json.recipe.length + "건 있습니다.");
					let cnt = 0;
					
					$(".choiceTable").empty();
					
					for(let i=0; i < json.recipe.length; i++) {
						
						let choiceTable = $(".choiceTable");
						
						let choiceFour = $("<td>");
						choiceFour.addClass("choiceFour");
						
						let aTag = $("<a>");
						let rnum = json.recipe[i].rnum;
						aTag.attr("href", "javascript:selectRecipe('" + rnum + "')");
						
						let selectOne = $("<div>");
						selectOne.addClass("selectOne");
						
						let selectTable = $("<table>");
						selectTable.addClass("selectTable");
						
						let tr = $("<tr>");
						
						let optionTd = $("<td>");
						optionTd.addClass("optionTd");
						
						let hitDiv = $("<div>");
						
						let likeDiv = $("<div>");
						
						let span = $("<span>");
						let hitp = $("<p>").text(json.recipe[i].rhit);
						let likep = $("<p>").text(json.recipe[i].likecnt);
						
						let imgTd = $("<td>");
						imgTd.addClass("imgTd");
						
						let img = $("<img id='rphoto' style='width:200px; height:200px;'>")
						img.attr("src", ("/oneYo/img/recipe/") + json.recipe[i].rphoto);
						
						let cateTd = $("<td>");
						cateTd.addClass("cateTd");
						
						let cateP = $("<p>");
						cateP.text(categoryLabeling(json.recipe[i].rcategory, 'recipe'));
						
						let nameTd1 = $("<td>");
						nameTd1.addClass("nameTd");
						
						let nameTd2 = $("<td>");
						nameTd2.addClass("nameTd");
						
						let dayTd = $("<td>");
						dayTd.addClass("dayTd");
						
						let imgDiv = $("<div>");
						imgDiv.append(img);
						
						if(i % 4 == 0) {
							choiceTable.append($("<tr>").append(choiceFour));
							var newLine = $(".choiceFour").eq(cnt);
							cnt++;
						}

						newLine.append(aTag);
						aTag.append(selectOne);
						selectOne.append(selectTable);
						selectTable.append($("<tr>").append(optionTd));
						
						optionTd.append(hitDiv).append($("<span>").text("조회수 :"));
						optionTd.append(hitp);
						optionTd.append(likeDiv).append($("<span>").text("좋아요 :"));
						optionTd.append(likep);
						
						selectTable.append($("<tr>").append(imgTd));
						imgTd.append(img);
						
						selectTable.append($("<tr>").append(cateTd));
						cateTd.append(cateP);
						
						selectTable.append($("<tr>").append(nameTd1));
						nameTd1.append($("<div>").text(json.recipe[i].rsubject));
						
						selectTable.append($("<tr>").append(nameTd2));
						nameTd2.append($("<p>").text('작성자'));
						nameTd2.append($("<span>").text(json.recipe[i].mnick));
						
						selectTable.append($("<tr>").append(dayTd));
						dayTd.append($("<div>").text(json.recipe[i].insertdate));
						
						choiceTable.append(tr);
						
						if (i  % 4 == 3) {
							newLine.append("</td>").append("</tr>");
						}
						
						console.log(i + "번 index : " + json.recipe[i].rnum);
						console.log(i + "번 index : " + json.recipe[i].rsubject);
						console.log(i + "번 index : " + json.recipe[i].rcategory);
						console.log(i + "번 index : " + json.recipe[i].rphoto);
						console.log(i + "번 index : " + json.recipe[i].mnick);
						console.log(i + "번 index : " + json.recipe[i].rhit);
						console.log(i + "번 index : " + json.recipe[i].insertdate);
						console.log(i + "번 index : " + json.recipe[i].likecnt);
					} // end of for
					if (json.recipe.length % 4 != 0) {
						let notEnough = (4 - json.recipe.length % 4);
						alert(notEnough);
						
						for (let i=0; i < notEnough; i++) {
							newLine.append($("<a>"));
						}
					}
				}else{
					
				}
				
				if(json.hasOwnProperty('tip')) {
					
					console.log("조호된 recipe 데이터가 " + json.tip.length + "건 있습니다.");
					let cnt = 0;
					
					$(".choiceTable").empty();
					
					for(let i=0; i < json.tip.length; i++) {
						
						let choiceTable = $(".choiceTable");
						
						let choiceFour = $("<td>");
						choiceFour.addClass("choiceFour");
						
						let aTag = $("<a>");
						let tnum = json.tip[i].tnum;
						aTag.attr("href", "javascript:selectTip('" + tnum + "')");
						
						let selectOne = $("<div>");
						selectOne.addClass("selectOne");
						
						let selectTable = $("<table>");
						selectTable.addClass("selectTable");
						
						let tr = $("<tr>");
						
						let optionTd = $("<td>");
						optionTd.addClass("optionTd");
						
						let hitDiv = $("<div>");
						
						let likeDiv = $("<div>");
						
						let span = $("<span>");
						let hitp = $("<p>").text(json.tip[i].thit);
						let likep = $("<p>").text(json.tip[i].likecnt);
						
						let imgTd = $("<td>");
						imgTd.addClass("imgTd");
						
						let img = $("<img id='tphoto' style='width:200px; height:200px;'>")
						img.attr("src", ("/oneYo/img/tip/") + json.tip[i].tphoto);
						
						let cateTd = $("<td>");
						cateTd.addClass("cateTd");
						
						let cateP = $("<p>");
						cateP.text(categoryLabeling(json.tip[i].tcategory, 'tIp'));
						
						let nameTd1 = $("<td>");
						nameTd1.addClass("nameTd");
						
						let nameTd2 = $("<td>");
						nameTd2.addClass("nameTd");
						
						let dayTd = $("<td>");
						dayTd.addClass("dayTd");
						
						let imgDiv = $("<div>");
						imgDiv.append(img);
						
						if(i % 4 == 0) {
							choiceTable.append($("<tr>").append(choiceFour));
							var newLine = $(".choiceFour").eq(cnt);
							cnt++;
						}

						newLine.append(aTag);
						aTag.append(selectOne);
						selectOne.append(selectTable);
						selectTable.append($("<tr>").append(optionTd));
						
						optionTd.append(hitDiv).append($("<span>").text("조회수 :"));
						optionTd.append(hitp);
						optionTd.append(likeDiv).append($("<span>").text("좋아요 :"));
						optionTd.append(likep);
						
						selectTable.append($("<tr>").append(imgTd));
						imgTd.append(img);
						
						selectTable.append($("<tr>").append(cateTd));
						cateTd.append(cateP);
						
						selectTable.append($("<tr>").append(nameTd1));
						nameTd1.append($("<div>").text(json.tip[i].tsubject));
						
						selectTable.append($("<tr>").append(nameTd2));
						nameTd2.append($("<p>").text('작성자'));
						nameTd2.append($("<span>").text(json.tip[i].mnick));
						
						selectTable.append($("<tr>").append(dayTd));
						dayTd.append($("<div>").text(json.tip[i].insertdate));
						
						choiceTable.append(tr);
						
						if (i  % 4 == 3) {
							newLine.append("</td>").append("</tr>");
						}
						
						console.log(i + "번 index : " + json.tip[i].tnum);
						console.log(i + "번 index : " + json.tip[i].tsubject);
						console.log(i + "번 index : " + json.tip[i].tcategory);
						console.log(i + "번 index : " + json.tip[i].tphoto);
						console.log(i + "번 index : " + json.tip[i].mnick);
						console.log(i + "번 index : " + json.tip[i].thit);
						console.log(i + "번 index : " + json.tip[i].insertdate);
						console.log(i + "번 index : " + json.tip[i].likecnt);
					} // end of for
					if (json.tip.length % 4 != 0) {
						let notEnough = (4 - json.tip.length % 4);
						alert(notEnough);
						
						for (let i=0; i < notEnough; i++) {
							newLine.append($("<a>"));
						}
					}
				}else{
					
				}
				
				if(json.hasOwnProperty('community')) {
					
					console.log(json.community.length);
					
					for(var i=0; i < json.community.length; i++) {
						console.log(i + "번 index : " + json.community[i].cnum);
						console.log(i + "번 index : " + json.community[i].csubject);
						console.log(i + "번 index : " + json.community[i].cphoto);
					}
					console.log(recipe_html);
				}else{
					
				}
				
			}
			
			function whenError(request,status,error) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
			function selectRecipe(rnum) {
				location.href = "recipeSelectContent.ict?rnum=" + rnum;
			}
			
			function selectTip(tnum) {
				location.href = "tipSelectContent.ict?tnum=" + tnum;
			}
			
			function categoryLabeling(category, identifier) {
				console.log(identifier + '게시판의 카테고리 : ' + category);
				
				let recipe_category_label = {'00': '한식', '01': '중식', '02': '양식', '03': '일식', '04': '디저트', '99': '기타'};
				let tip_category_label = {'00': '요리', '01': '주방관리', '02': '재료정보', '99': '기타'};
				let mem_category_label = {'0': '일반', '1': '전문가'};
				
				if(identifier.toUpperCase() == 'RECIPE' && identifier !=null) {
					console.log('레시피 게시판');
					return recipe_category_label[category];
				}
				
				if(identifier.toUpperCase() == 'TIP' && identifier !=null) {
					console.log('전문가팁 게시판');
					return tip_category_label[category];
				}
				
				if(identifier.toUpperCase() == 'MEM' && identifier !=null) {
					console.log('회원 등급');
					return mem_category_label[category];
				}
			}
			
		</script>
	</head>
<body>

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
			<div class="mypageHome">
			<span>
			my<br>Page 
			</span>
			</div>
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
	검색바 여기에 넣기
	<input type="text" id="searchText" name="serchText">
	<input type="button" id="searchTextBtn" value="검색">
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
				<span class="Choonsik">:</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
<%
		} else {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik mypageHome">마이페이지</span>
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

<div id="center" style="text-align:center;">
		<div id="profile_div" style="display:table; margin-left:24px; width:100%;">
			<div style="display:flex; align-items:center; line-height:80%;">
				<div style="display:inline-block; text-align:center; float:left;">
					<img id="mprofile" style="width:102px; height:102px; border-radius: 10px;" />
				</div>
				<div style="display:inline-block; text-align:left; width: 360px;">
					<div style="display:inline-block; padding-left:15px;">
						<b>닉네임</b><br><br>
						<b>등&nbsp;&nbsp;&nbsp;급</b><br><br>
						<b>가입일</b>
					</div>
					<div style="display:inline-block; padding-left:8px;">
						<span id="mnick">
						
						</span>
						<br><br>
						<span id="mgrade">
						
						</span>
						<br><br>
						<span id="insertdate">
						
						</span>
					</div>
				</div>
			</div>
		</div>
<!--
쉐프 소개 페이지 작업할 공간
-->
<!-- 임시 버튼 -->
<div style="text-align:right;">
	<button type="button" id="recipeBtn" class="centerBtn">레시피 버튼</button>
	<button type="button" id="tipBtn" class="centerBtn">전문가팁 버튼</button>
	<button type="button" id="communityBtn" class="centerBtn">커뮤니티 버튼</button>
</div>

<div class="choiceAll">
		<div class="choiceTableDiv">
			<table class="choiceTable">
				
					
			</table>
		</div>
	</div>

</div>

<!-- common_count.js 자바스크립트 임포트하면 span태그에 값이 바인딩 됨. -->
<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
		<span>팀 소개: ~~~</span>
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