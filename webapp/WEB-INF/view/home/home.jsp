<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="main.ict.common.O_Session" %>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.tip.vo.TipVO" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>
<%@ page import="main.ict.notice.vo.NoticeVO" %>
<%@ page import="main.ict.home.vo.HomeVO" %>
<%@ page import="main.ict.mem.vo.MemVO" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% Logger logger = LogManager.getLogger(this.getClass()); %>
<% logger.info(".jsp 진입"); %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
	
	logger.info("mid: " + mid);
	logger.info("mnum: " + mnum);
%>

<c:set var="MemList" value="${ DataMap['MemList'] }" />

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
		<link rel="stylesheet" href="/oneYo/resource/css/home/home.css">
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<script type="text/javascript" src="/oneYo/resource/js/home/home.js" charset="UTF-8"></script>
		<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		<script type="text/javascript">
		
			alert("[home.jsp] JS");
			
			$(document).ready(function() {
				
				alert("[home.jsp] jQuery");

				// 게시글 관련 ---------------------------------
				$(".favorPostTitle").on("click", function() {  // 타이틀 클릭
					postClick($(this));
					homeRESTCateCond();
				});
				
				$('.pa').on("click", function() {				// 게시글 클릭 시
// 					console.log($(this).attr('data-value'));	// 게시글의 고유번호
					$('#num').val($(this).attr('data-value'));	// 보낼 내용 지정하기
					$("#goSelectForm").attr({					// hidden 태그 받아서 사용하기
						"action": "/oneYo/goSelectContent.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				// ------------------------------------------
				
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
				// ------------------------------------------
				// 일간/주간/월간 + 게시판별 조건 조회하기 ------------
				$("#favorCond").on("change", function() {
					homeRESTCateCond();
				});
				// ------------------------------------------
				
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
				
				// 배너 --------------------------------------
				const s1 = new Slider(".banner");
				
				setInterval( function() {
					  s1.next();
				}, 3500);
				
				// 배너 이미지 클릭 시 이벤트 호출
				$(".box").on("click", function() {
					let category = $(this).attr('data-value');
					if (category == "none") { return false; }
					let ban_url = "/oneYo/" + category + "SelectAll.ict";
					
					location.href=ban_url;
				});
				
				// 이미지 길이 리사이즈 --------------------------
				$(".p11").each(function(i, element) {
					let width = $(element).css('width');
					let length = $(element).css('width').length;
					
					if (parseInt(width.substring(0, length - 2)) > 145) {
						$(element).css('width', 145);
					}
				});
				
				// 초기화면설정 >> recipe + 월간
				postClick($(".postTitles:first-child"));
				homeRESTCateCond();
				
			});
			
			function postClick(obj) {  // favorPostTitle
				
				let before_num = $(".postTitles").attr('data-num');
				let after_num = obj.attr("data-num");  // 1 ~ 4
				$(".postTitles").val(after_num);
				
				if (before_num == after_num) {
					console.log("동일한 카테고리입니다.");
					return false;
				}
				
				// 값 갱신
				$(".postTitles").attr('data-num', after_num);

// 				클릭한 것에 해당하는 게시판 글 z-index 변경하기.
				$(".favorPost").each(function(i, elem) {
// 					console.log($(elem).attr("data-value"));
// 					console.log($(obj).attr("data-value"));
					if ($(elem).attr("data-value") == $(obj).attr("data-value")) {
						$(elem).css("z-index", 11);
					} else {
						$(elem).css("z-index", 10);
					}
				});
			}
			
			function chefIntroduce(mnum) {
				location.href = "chefIntroduce.ict?mnum=" + mnum;
			}
			
			function homeRESTCateCond() {
				
				let dateCondition = $("#favorCond option:selected").val();	// W, M, D
				let boardCategory = $(".postTitles").attr("data-num");		// 1, 2, 3
				let condCategory = dateCondition + boardCategory;

				let urlV = "/oneYo/condCategory/" + condCategory + ".ict";
				let typeV = "GET";
				let dataTypeV = "json";
				$.ajax({
					url: urlV,
					type: typeV,
					dataType: dataTypeV,
					success: whenSuccess
				});
				
				function whenSuccess(retData) {
					let jsonArr = retData.jsonArr;  // JSON Array
					// 글 별로 분기처리 >> 1(레시피), 2(전문가팁), 3(커뮤니티), 4(공지사항)
// 					console.log(boardCategory);		// 분기할 카테고리 숫자
					
					// favorPost + 숫자인 element 찾기
					let _condPost = $(".favorPost" + boardCategory);
					let _condPostDV = _condPost.attr("data-value");
					
					_condPost.empty();
// 					console.log(jsonArr.length);  // 1 ~ 8
					if ((boardCategory == 1 || boardCategory == 2)
							&& jsonArr !== null && jsonArr[0].num !== undefined) {
						for (let i=0; i<jsonArr.length; i++) {
							let pa = $("<a>");
							pa.addClass("pa");
							pa.attr("data-value", jsonArr[i].num);
							
							let p1 = $("<div>");
							p1.addClass("p1");
							
							let imgCover = $("<div>");
							imgCover.addClass("imgCover");
							
							let p11 = $("<img>");
							p11.addClass("p11");
							p11.attr("src", "/oneYo/img/" + _condPostDV + "/" + jsonArr[i].photo);
							p11.attr("onerror", "this.src='/oneYo/img/잔망루피.jpg'");
							
							let psubj = $("<div>");
							psubj.addClass("psubj pcom");
							psubj.text(jsonArr[i].subject);
							
							let br = $("<br>");
							
							let pcom1 = $("<div>");
							pcom1.addClass("pcom");
							pcom1.text("조회수: " + jsonArr[i].hit);
							
							let pcom2 =  $("<div>");
							pcom2.addClass("pcom");
							pcom2.text("추천수: " + jsonArr[i].likecnt);
	
							imgCover.append(p11);
							p1.append(imgCover);
							p1.append(psubj);
							p1.append(br);
							p1.append(pcom1);
							p1.append(pcom2);
							pa.append(p1);
							_condPost.append(pa);
						}
					}
					
					if (boardCategory == 3 || boardCategory == 4) {
						_condPost.html('<div class="psubj2 pcont" style="text-align:center;">작성자</div><div class="psubj2" style="width:200px;text-align:center;">제목</div><div class="psubj2" style="text-align:center;">조회수</div><div class="psubj2" style="text-align:center;">좋아요</div><div class="psubj2 pins" style="text-align:center;">등록일</div><br /><hr class="favorhr"/>');
						for (let i=0; i<jsonArr.length; i++) {
							let pa = $("<a>");
							pa.addClass("pa");
							pa.attr("data-value", jsonArr[i].num);
							
							let p2 = $("<div>");
							p2.addClass("p2");
							
							let psubj = $("<div>");
							psubj.addClass("psubj2");
							psubj.css({
								"width": "200px",
								"text-align": "left"
							});
							psubj.text(jsonArr[i].subject);
							
							let pcont = $("<div>");
							pcont.addClass("psubj2 pcont");
							pcont.text(jsonArr[i].content);
							
							let phit =  $("<div>");
							phit.addClass("psubj2");
							phit.text(jsonArr[i].hit);
							
							let plike =  $("<div>");
							plike.addClass("psubj2");
							plike.text(jsonArr[i].likecnt);
							
							let pinsertdate = $("<div>");
							pinsertdate.addClass("psubj2 pins");
							pinsertdate.text(jsonArr[i].insertdate);
	 
							p2.append(psubj);
							p2.append(pcont);
							p2.append(phit);
							p2.append(plike);
							p2.append(pinsertdate);
							pa.append(p2);
							_condPost.append(pa);
						}
					}
				};
				
			}
			
		</script>
	</head>
<body>

<!--			all_div		-->
<!--	┌─────────────────┐	-->
<!--	│      header 	  │	-->
<!--	├─────┬─────┬─────┤	-->
<!--	│  l  │  c  │  r  │	-->
<!--	│  e  │  e  │  i  │	-->
<!--	│  f  │  n  │  g  │	-->
<!--	│  t  │  t  │  h  │	-->
<!--	│     │  e  │  t  │	-->
<!--	│     │  r  │ 	  │	-->
<!--	├─────┴─────┴─────┤	-->
<!--	│    footer	 	  │	-->
<!--	└─────────────────┘	-->
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
	
		logger.info("mid>>>>>>>>>>>>>" + mid);
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
	<!-- 
	4. 넷째 라인: 레시피 분류 >> 한식,중식,양식,일식,디저트, 기타- 00,01,02,03,04,99(기타)
	 -->
	 	<!-- form & input(hidden) -->
	 	<div id="slider" class="banner slider">  <!-- inner-list -->
	 		<div class="box" data-value="none"> <!-- inner -->
				<img src="/oneYo/resource/img/001.png">
	 		</div>
	 		<div class="box" data-value="recipe">
				<img src="/oneYo/resource/img/002.png">
	 		</div>
	 		<div class="box" data-value="tip">
				<img src="/oneYo/resource/img/003.png">
	 		</div>
	 		<div class="box" data-value="community">
				<img src="/oneYo/resource/img/004.png">
	 		</div>
	 		<div class="box" data-value="notice">
				<img src="/oneYo/resource/img/005.png">
	 		</div>
	 	</div>
	 	<div class="favorContainer">
	 		<div class="postTitles" data-num="1">
			 	<div class="favorPostTitle" data-value="recipe" data-num="1">
			 		<span style="text-shadow: 2px 2px 8px red;">레시피</span>
			 	</div>
			 	<div class="favorPostTitle" data-value="tip" data-num="2">
			 		<span style="text-shadow: 2px 2px 8px blue;">전문가</span>
			 	</div>
			 	<div class="favorPostTitle" data-value="community" data-num="3">
			 		<span style="text-shadow: 2px 2px 8px green;">커뮤니티</span>
			 	</div>
			 	<div class="favorPostTitle" data-value="notice" data-num="4">
			 		<span style="text-shadow: 2px 2px 8px purple;">공지사항</span>
			 	</div>
		 	</div>
		 	<div>
		 		<select id="favorCond" class="favorCond">
		 			<option value="D">일간&nbsp;</option>
		 			<option value="W">주간&nbsp;</option>
		 			<option value="M" selected>월간&nbsp;</option>
		 		</select>
		 	</div>
		 	<hr class="favorhr" />
	 		<div class="favorPost favorPost1" data-value="recipe"></div>
	 		<div class="favorPost favorPost2" data-value="tip"></div>
	 		<div class="favorPost favorPost3" data-value="community"></div>
	 		<div class="favorPost favorPost4" data-value="notice"></div>
	 		<form id="goSelectForm">
	 			<input type="hidden" id="num" name="num" value="" />
	 		</form>
		 </div>
		 <div class="chefInfo">
		 	<div class="chefTop">
		 		<span class="chefTitle" style="position:relative;left:5%;font-size:25px;">
		 			<span style="color:#93A603;">쉐프</span> 소개
		 		</span>
		 		<span class="chefTitle" style="position:relative;left:75%;font-size:25px;cursor:pointer;">
		 			더 보기
		 		</span>
		 	</div>
		 	<%-- 2023-01-02 이성일 쉐프소개 임시  --%>
		 	<div class="chefBody">
			 	<c:forEach items="${ MemList }" var="mvo">
			 		<c:if test="${ mvo !=null }" >
			 			<a onclick="chefIntroduce('${ mvo.mnum }')" style="height:120px;">
				 			<div class="chefIcon">
				 				<c:if test="${ mvo.mprofile != null }">
					 				<img class="chefImg" style="box-shadow: 1px 1px 3px #AAA;"
					 					 src="/oneYo/img/mem/${ mvo.mprofile }">
				 				</c:if>
				 				<div class="chefName">${ mvo.mnick }</div>
				 			</div>
			 			</a>
			 		</c:if>
			 	</c:forEach>
		 	</div>
		 </div>
		 <div class="recipeInfo">
			<div class="recipeTop">
		 		<span class="recipeTitle" style="position:relative;left:5%;font-size:25px;">
		 			<span style="color:#93A603;">레시피</span> 분류
		 		</span>
		 		<span class="recipeTitle" style="position:relative;left:73%;font-size:25px;cursor:pointer;">
		 			더 보기
		 		</span>
			</div>
			<div class="recipeBody">
				<!-- 한식 -->
		 		<div class="recipeIcon">
		 			<a href="recipeCategorySelectAll.ict?rcategory=00">
		 				<img class="recipeImg" src="/oneYo/img/home/rcategory/00.png">
		 			</a>
		 		</div>
		 		<!-- 중식 -->
		 		<div class="recipeIcon">
		 			<a href="recipeCategorySelectAll.ict?rcategory=01">
		 				<img class="recipeImg" src="/oneYo/img/home/rcategory/01.png">
		 			</a>
		 		</div>
		 		<!-- 양식 -->
		 		<div class="recipeIcon">
		 			<a href="recipeCategorySelectAll.ict?rcategory=02">
		 				<img class="recipeImg" src="/oneYo/img/home/rcategory/02.png">
		 			</a>
		 		</div>
		 		<!-- 일식 -->
		 		<div class="recipeIcon">
		 			<a href="recipeCategorySelectAll.ict?rcategory=03">
		 				<img class="recipeImg" src="/oneYo/img/home/rcategory/03.png">
		 			</a>
		 		</div>
		 		<!-- 디저트 -->
		 		<div class="recipeIcon">
		 			<a href="recipeCategorySelectAll.ict?rcategory=04">
		 				<img class="recipeImg" src="/oneYo/img/home/rcategory/04.png">
		 			</a>
		 		</div>
		 		<!-- 기타 -->
		 		<div class="recipeIcon">
		 			<a href="recipeCategorySelectAll.ict?rcategory=99">
		 				<img class="recipeImg" src="/oneYo/img/home/rcategory/99.png">
		 			</a>
		 		</div>
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