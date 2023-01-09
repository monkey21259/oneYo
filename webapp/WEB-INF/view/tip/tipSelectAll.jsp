<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="java.util.List" %>

<%@ page import="main.ict.tip.vo.TipVO" %>
<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("tipSelectAll.jsp 페이지 진입");
%>
<%
	O_Session mSession = O_Session.getInstance();
	String mnum = mSession.getSession(request);
	String mid = (String)mSession.getAttribute(request, "mid");
	logger.info("mid >>> : " + mid);
	logger.info("mnum >>>>>>> : " + mnum);
%>
<%
	List<TipVO> list = null;
	TipVO tvo = null;
	TipVO pagingVO = null;
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;
	
	//searching
	String searchCategory = "";
	String keyword = "";
	String startDate= "";
	String endDate = "";
	
	if(request.getAttribute("list") !=null) {
		list = (List<TipVO>)request.getAttribute("list");
		if(list !=null && list.size() > 0) {
			for(int i=0; i < list.size(); i++) {
				tvo = list.get(i);
				logger.info("VO : " + tvo.toString());
			}
		}else if(list.size() == 0){
			out.println("<script>alert('검색된 게시글이 없습니다.'); location.href='tipSelectAll.ict';</script>");
		}
	}
	
	if(request.getAttribute("pagingVO") != null){
		pagingVO = (TipVO)request.getAttribute("pagingVO");
		pageSize = Integer.parseInt(pagingVO.getPageSize());
		groupSize = Integer.parseInt(pagingVO.getGroupSize());
		curPage = Integer.parseInt(pagingVO.getCurPage());
	}
%>

<!DOCTYPE html>
<html lang='ko'>
<head>
	<meta charset="UTF-8">
	<title>oneYo(오내요)</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	
<!-- 제이쿼리 -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="/oneYo/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="/oneYo/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script src="/oneYo/calendar_datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>
<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
	<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
<!-- 전체 css -->
	<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<!-- tipSelectAll.jsp 전용 -->
	<link rel="stylesheet" href="/oneYo/resource/css/tip/tipSelectAll.css">		
<!-- 페이징 기능 전용 -->
	<link rel="stylesheet" href="/oneYo/resource/css/common/paging.css">
<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
	<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){		
			console.log("tipSelectAll.jsp 페이지 진입");
			
// 			$(document).on("click", ".tsubject", function(){
// 				let tnum = $(this).children(1).val();
// 				console.log("tnum : " + tnum);
				
// 				location.href = "tipSelectContent.ict?tnum=" + tnum;
				
 				
<%-- 				$("#tipSelectAllForm").attr({ --%>
<%-- 					"action": "#tipSelectContent.ict", --%>
<%-- 					"method": "GET" --%>
<%-- 				}).submit(); --%>
<%-- 				--%>
// 			});
			
// 			$(document).on("click", ".tcontent", function(){
// 				let tnum = $(this).children(1).val();
// 				console.log("tnum : " + tnum);
				
// 				location.href = "tipSelectContent.ict?tnum=" + tnum;
// 			});

			$(document).on("click", ".selectOne", function(){
				let tnum = $(this).children(1).val();
				
				location.href = "tipSelectContent.ict?tnum=" + tnum;
			});
			
			//서칭 카테고리 checkbox 하나만 선택되게 하는 로직
			$('.category').click(function(){
				if($(this).prop('checked') == true){
					$('.category').prop('checked', false);
					$(this).prop('checked', true);
					$(this).attr('data', 'T');
				}else{
					$('.category').prop('checked', false);
				}
			});//end of mnum click function
			
			//datepicker 한글화
			$.datepicker.setDefaults({
				dateFormat: 'yymmdd',
				prevText: '이전 달',
				nextText: '다음 달',
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				showMonthAfterYear: true,
				yearSuffix: '년'
			});
			
			//검색 시작일 텍스트 박스 누르면 나오는 달력
			$('#startDate').datepicker({
				dateFormat:'yy-mm-dd',
			});//end of startDate datepicker()
			
			//검색 종료일 텍스트 박스 누르면 나오는 달력
			$('#endDate').datepicker({
				dateFormat:'yy-mm-dd',
			});//end of startDate datepicker()
			
			//SEARCH를 위한 form 보내기
			$('#searchBtn').click(function() {
				var cate = document.getElementsByName('searchCategory');
				var bool = false;
				for (var i=0; i<cate.length; i++) {
					if(cate[i].hasAttribute('data')){
						bool = true;
					}//end of if
				}//end of for
				
				if (($('#keyword').val() == '') && ($('#startDate').val() == '') && ($('#endDate').val() == '') && ($('.category').prop('checked') == false) && !bool) {
					alert("검색할 카테고리, 키워드 또는 날짜를 설정하세요.");
					$('#keyword').focus();
				} else if (($('#keyword').val() == '') && ($('#startDate').val() == '') && ($('#endDate').val() != '')) {
					alert("검색 시작일을 설정하세요.");
					$('#startDate').focus();
				} else if (($('#keyword').val() == '') && ($('#startDate').val() != '') && ($('#endDate').val() == '')) {
					alert("검색 종료일을 설정하세요.");
					$('#endDate').focus();
				} else {
					$('#tipSelectAllForm').attr({
						'action':'tipSelectAll.ict',
						'method':'GET',
						'enctype':'application/x-www-form-urlencoded'
					}).submit();//end of memList submit()
				}//end of if-else
			});//end of searchBtn click function
			
			//search 관련 input에 기존 값 적용하기
			var searchCategoryVal = $('#searchCategoryVal').val();
			var keywordVal = $('#keywordVal').val();
			var startDateVal = $('#startDateVal').val();
			var endDateVal = $('#endDateVal').val();
			
			$('.category[value=' + searchCategoryVal + ']').prop('checked', true);
			$('#keyword').val(keywordVal);
			$('#startDate').val(startDateVal);
			$('#endDate').val(endDateVal);
			
			if(searchCategoryVal == null || searchCategoryVal == "" || searchCategoryVal == "null"){
				$('.category').prop('checked', false);
			}//end of if
			if(keywordVal == null || keywordVal == "" || keywordVal == "null"){
				$('#keyword').val('');
			}//end of if
			if(startDateVal == null || startDateVal == "" || startDateVal == "null"){
				$('#startDate').val('');
			}//end of if
			if(endDateVal == null || endDateVal == "" || endDateVal == "null"){
				$('#endDate').val('');
			}//end of if
			
			
			let mnum ="";
			
			//글등록
			$(document).on("click", "#insertBtn", function(){

				let url ="tipsession.ict";
				let reqType="GET";
				let dataParam={
						mnum : "<%= mnum %>",
				}
				
				$.ajax({
					url:url,
					type:reqType,
					data:dataParam,
					success:whenSuccess,
					error:whenError		
				}); //ajax
				
				
				function whenSuccess(resData){
				//전문가
					if ("1" == resData|| "9" == resData){
						location.href ="tipInsertForm.ict";
								
				}	else{
					alert("전문가 등급만 등록할 수 있습니다.");
					 $("#insertBtn").hide();
				}
					
				} //success
				
				function whenError(e){
					console("경고 처리 되지 않았습니다(error) : "  + e.responseText);
				} //whenError	
				
				
			}); //insertBtn
			
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

// 			//all.js 에 있는 모든 함수 연결
<%-- 			allJavaScript("<%=mnum%>"); --%>

			// 검색 카테고리 클릭 시 이벤트 처리
			// 1. 중복 선택 불가(O)
			// 2. divClick on/off -> input:checkbox 선택/해제(O)
			// 3. 안보이게 만들기(O)
			$(".divCate").on("click", function() {
				let thisObj = this;					// 클릭한 객체
				let cate_span = $(this).children();		// 카테고리 박스
				let hidden_box = cate_span.children();	// 카테고리에 숨겨진 Checkbox
// 				console.log(thisObj);
// 				console.log(cate_span);
// 				console.log(hidden_box);
// 				console.log(hidden_box.prop("checked"));
// 				console.log(typeof hidden_box.prop("checked"));
				if (hidden_box.prop("checked") == false) {		// [미선택 상태] false -> true
					cate_span.css({
						"width": "204px",
						"height": "30px",
						"border": "3px solid #AC7B53"
					});
					// 체크박스 클릭하기
					hidden_box.prop("checked", true);
// 					console.log(hidden_box.prop("checked"));
				} else if (hidden_box.prop("checked") == true) {	// [선택 상태] true -> false
					cate_span.css({
						"width": "210px",
						"height": "36px",
						"border": "none"
					});
					// 체크박스 해제하기
					hidden_box.prop("checked", false);
// 					console.log(hidden_box.prop("checked"));
				}
				
				$(".divCate").each(function(i, elem) {
					if (elem != thisObj) {
						$(elem).find('input').prop("checked", false);
						$(elem).children().css({
							"width": "210px",
							"height": "36px",
							"border": "none"
						});
					}
				});
			});
			
		});// ready
		
	</script>
		<style>
		
			.link {
				margin:2px;
				list-style-type:none;
				float:left;
				padding:9px 15px 9px 15px;
				border:1px solid #ebebeb; 
			}
				
			.hi {
				color:#888;
				text-decoration: none;
				font-weight: 500;
			}
		
			.hello {
			color:#ff5e5e;
				text-decoration: none;
				
			}
			#list {
				text-align:center;
				
			}
			
			#block {
			display:inline-block;
			
			}
		
		</style>
	</head>
	<body>
	<form id="tipSelectAllForm">
	
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
				<a href="recipeSelectAll.ict" class="menu_link">
				<div>
				레시피
				</div>
				</a>
			</li>
			<li>
				<a href="tipSelectAll.ict" class="menu_link">
				<div class="divClick">
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
	<div class="category_fillContainer">
		<div class="category_cond">
			<input type="text" id="keyword" name="keyword" style="width:120px;" placeholder="제목 검색">
			<span> | </span>
			<input type="text" id="startDate" name="startDate" size="8" placeholder="검색 시작일" autocomplete="off"> ~
			<input type="text" id="endDate" name="endDate" size="8" placeholder="검색 종료일" autocomplete="off">
			<input type="button" id="searchBtn" value="검색">
			<button type="button" id="insertBtn" style="position:relative;left:30px;">글등록</button>
		</div>
		<div class="category">
			<div class="divCate">
				<!-- 요소 한개만! jQuery -->
				<span class="category_btn">
					<input type="checkbox" id="searchCategory" name="searchCategory" class="searchCategory" value="00" />요리
				</span>
			</div>
			<div class="divCate">
				<!-- 요소 한개만! jQuery -->
				<span class="category_btn">
					<input type="checkbox" id="searchCategory" name="searchCategory" class="searchCategory" value="01" />주방관리
				</span>
			</div>
			<div class="divCate">
				<!-- 요소 한개만! jQuery -->
				<span class="category_btn">
					<input type="checkbox" id="searchCategory" name="searchCategory" class="searchCategory" value="02" />재료정보
				</span>
			</div>
			<div class="divCate">
				<!-- 요소 한개만! jQuery -->
				<span class="category_btn">
					<input type="checkbox" id="searchCategory" name="searchCategory" class="searchCategory" value="99" />기타
				</span>
			</div>
		</div>
	</div>
	<div class="choiceAll">
		<div class="choiceTableDiv">
			<table class="choiceTable">
				<tbody>
<%
					TipVO _tipVO = null;
					for (int i=0; i<list.size(); i++) {
						_tipVO = list.get(i);
						totalCount = Integer.parseInt(tvo.getTotalCount());
						
						searchCategory = _tipVO.getSearchCategory();
						keyword = _tipVO.getKeyword();
						startDate = _tipVO.getStartDate();
						endDate = _tipVO.getEndDate();
						
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
								<input type="hidden" class="tnum" name="tnum" value="<%= _tipVO.getTnum() %>">
								<table class="selectTable">
									<!-- 조회수/좋아요 -->
									<tr>
										<td class="optionTd">
											<div>
												<span>조회수 :</span>
												<p><%= _tipVO.getThit() %></p>
	 										</div>
										</td>
									</tr>
									<!-- 썸네일 -->
									<tr>
										<td class="imgTd">
											<div class="imgTdSub1">
												<img src="/oneYo/img/tip/<%= _tipVO.getTphoto() %>" id="rphoto">
											</div>
										</td>
									</tr>
									<!-- 분류 -->
									<tr>
										<td class="cateTd" style="text-align:left;">
											<p>
												<%= CodeUtils.getTcategory(_tipVO.getTcategory()) %>
											</p>
										</td>
									</tr>
									<!-- 제목 -->
									<tr>
										<td class="nameTd" style="height:42px;overflow-y:hidden;">
											<div>
												<%= _tipVO.getTsubject() %>
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
												<%= _tipVO.getMnick() %>
											</span>
										</td>
									</tr>
									<!-- 작성일 -->
									<tr>
										<td class="dayTd">
											<div>
												<%= _tipVO.getInsertdate() %>
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
					} else if (list.size() == i + 1 && (i + 1) % 4 > 0) {
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
		</tbody>
	</table>
	<table style="margin: 0px auto">
		<tbody>
			<tr>			
				<td colspan="4">
				<br>
					<input type="hidden" id="searchCategoryVal" value="<%=searchCategory %>">
					<input type="hidden" id="keywordVal" value="<%=keyword %>">
					<input type="hidden" id="startDateVal" value="<%=startDate %>">
					<input type="hidden" id="endDateVal" value="<%=endDate %>">
					<jsp:include page="/WEB-INF/view/tip/tipPaging.jsp" flush="true">
						<jsp:param value="tipSelectAll.ict" name="url"/>
							<jsp:param value="" name="str"/>
							<jsp:param value="<%=pageSize %>" name="pageSize"/>
							<jsp:param value="<%=groupSize %>" name="groupSize"/>
							<jsp:param value="<%=curPage %>" name="curPage"/>
							<jsp:param value="<%=totalCount %>" name="totalCount"/>
							<jsp:param value="<%=searchCategory %>" name="searchCategory"/>
							<jsp:param value="<%=keyword %>" name="keyword"/>
							<jsp:param value="<%=startDate %>" name="startDate"/>
							<jsp:param value="<%=endDate %>" name="endDate"/>
					</jsp:include>
				</td>
			</tr>
		</tbody>
	</table>
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
	 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
	 		</form>
	</body>
</html>