<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>
<%@ page import="main.ict.common.O_Session" %>

<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunitySelectAll 진입 >>> : "); 
%>
<%

	//	model.addAttribute("listAll", listAll);
	Object obj = request.getAttribute("listAll");
	logger.info("******************" + obj);
	if (obj == null) {
		out.println("<script>alert('검색된 게시글이 없습니다.'); location.href='communitySelectAll.ict';</script>");
	}
	List<CommunityVO> listAll = (List<CommunityVO>)obj;	
	
	//세션
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
%>
<%
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;
	
	//searching
	String searchFilter = "";
	String keyword = "";
	String startDate= "";
	String endDate = "";
%>

<!DOCTYPE html> 
<html>
	<head>
		<meta charset="UTF-8">
		<title>oneYo(오내요)</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0
							maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<!-- 제이쿼리cdn -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- communitySelectAll.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/community/communitySelectAll.css">		
		
		<!-- 페이징 기능 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/common/paging.css">
		
		<!-- 검색 -->
		<link rel="stylesheet" href="/oneYo/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
		
		<script src="/oneYo/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
		<script src="/oneYo/calendar_datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		
		<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
	
		<script type="text/javascript">
		
		$(document).ready(function(){

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
			
			//검색 항목 변경에 따른 검색 관련 값 초기화
			$('#searchFilter').change(function(){
				$('#keyword').val('');
				$('#startDate').val('');
				$('#endDate').val('');
				$('#keyword').focus();
			});//end of searchFilter change function
			
			//검색 시작일 텍스트 박스 누르면 나오는 달력
			$('#startDate').datepicker({
				dateFormat:'yy-mm-dd',
			});//end of startDate datepicker()
			
			//검색 종료일 텍스트 박스 누르면 나오는 달력
			$('#endDate').datepicker({
				dateFormat:'yy-mm-dd',
			});//end of startDate datepicker()
			
			//SEARCH를 위한 form 보내기
			$('#searchBtn').click(function(){
				if (($('#keyword').val() == '') && ($('#startDate').val() == '') && ($('#endDate').val() == '')) {
					alert("검색할 키워드나 날짜를 설정하세요.");
					$('#keyword').focus();
				}else if(($('#keyword').val() == '') && ($('#startDate').val() == '') && ($('#endDate').val() != '')){
					alert("검색 시작일을 설정하세요.");
					$('#startDate').focus();
				}else if(($('#keyword').val() == '') && ($('#startDate').val() != '') && ($('#endDate').val() == '')){
					alert("검색 종료일을 설정하세요.");
					$('#endDate').focus();
				}else{
					$('#communitySelectAll').attr({
						'action':'communitySelectAll.ict',
						'method':'GET',
						'enctype':'application/x-www-form-urlencoded'
					}).submit();//end of memList submit()
				}//end of if-else
			});//end of searchBtn click function
			
			//search 관련 input에 기존 값 적용하기
			var searchFilterVal = $('#searchFilterVal').val();
			var keywordVal = $('#keywordVal').val();
			var startDateVal = $('#startDateVal').val();
			var endDateVal = $('#endDateVal').val();
			
			$('#' + searchFilterVal).prop('selected', true);
			$('#keyword').val(keywordVal);
			$('#startDate').val(startDateVal);
			$('#endDate').val(endDateVal);
			
			if(keywordVal == null || keywordVal == "" || keywordVal == "null"){
				$('#keyword').val('');
			}//end of if
			if(startDateVal == null || startDateVal == "" || startDateVal == "null"){
				$('#startDate').val('');
			}//end of if
			if(endDateVal == null || endDateVal == "" || endDateVal == "null"){
				$('#endDate').val('');
			}//end of if
			
			//검색
			function communitySearch() {
				
				location.href = "recipeSearchForm.ict";
			}
		
			
			
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
			
		
		}); //ready
	
		</script>
	</head>
 	<body>
 	<form id="communitySelectAll" name="communitySelectAll">
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
		<li class="item">
			<div class="warningForm">
			<span>
			신고
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
						<div class="divClick">
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
						<a href="entertainment.ict" class="menu_link">
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
							엔터테인먼트
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
	
</div> <!-- header -->

<div id="center">
<!-- -------------------------------페이지 전용 center------------------------------- -->
	<div id="anne">
	<p id="subject">커뮤니티</p>
	</div>
	
<!-- 검색바 -->
	<div class="SearchPeriodContainer">
		<div>
			<div class="search_fill">
				<div>
					<span>
						<select id="searchFilter" name="searchFilter">
							<option id="00" value="00">전체</option>
							<option id="01" value="01">제목</option>
							<option id="02" value="02">작성자</option>
						</select>
						<input type="text" id="keyword" name="keyword" placeholder="검색어 입력">
					</span>
						
					<span class="date_style">
					검색기간조회:
						<input type="text" id="startDate" name="startDate" size="8" placeholder="검색 시작일" autocomplete="off"> ~
						<input type="text" id="endDate" name="endDate" size="8" placeholder="검색 종료일" autocomplete="off">
					</span>
					
					<span class="BtnTwo">
						<span class="SearchBtnDiv tright searchBtn">	
						<button type="button" id="searchBtn">검색</button>
						</span>
					<%
					if(mnum.length() > 0){
					%>
						<span class="SearchBtnDiv tright">
							<button type="button" onclick="location.href='/oneYo/communityInsertForm.ict'">글등록</button>
						</span>
					<%
					}
					%>
					</span>
				</div>
			</div>
		</div>
	</div>		
	
	
<!-- 게시판 부분 -->
	<div>
			<table class="table-fill">
				<thead>
					<tr>
						<th width="10%">NO</th>
						<th width="40%">제목</th>
						<th width="25%">작성자</th>
						<th width="10%">조회수</th>
						<th width="15%">작성일</th>
					</tr>
				</thead>

		<%
			CommunityVO cvo = null;
		
			if(listAll.size() > 0){
				for(int i=0; i<listAll.size(); i++){ 
					cvo = listAll.get(i); 
		
		%>
				<tbody>
					<tr>
						<td><%= cvo.getCommunitynum()%></td>
						<td class="table_subject"><a href="communitySelectContent.ict?cnum=<%= cvo.getCnum()%>"><%= cvo.getCsubject() %></a></td>
						<td><%= cvo.getMnick() %></td>
						<td><%= cvo.getChit() %></td>
						<td><%= cvo.getInsertdate()%></td>
					</tr>
		<%
		totalCount = Integer.parseInt(cvo.getTotalCount());
		searchFilter = cvo.getSearchFilter();
		keyword = cvo.getKeyword();
		startDate = cvo.getStartDate();
		endDate = cvo.getEndDate();
		} //for
		%>	
		<%
				//페이징 세팅
				//model.addAttribute("pagingCVO", cvo);
				Object obj_p = request.getAttribute("pagingCVO");
				CommunityVO pagingCPVO = (CommunityVO)obj_p;
				
				pageSize = Integer.parseInt(pagingCPVO.getPageSize());
				logger.info("pageSize >>> : " + pageSize );
				
				groupSize = Integer.parseInt(pagingCPVO.getGroupSize());
				logger.info("groupSize >>> : " + groupSize );
				
				curPage = Integer.parseInt(pagingCPVO.getCurPage());
				logger.info("curPage >>> : " + curPage );
				
				logger.info("cvo.getTotalCount() >>>>>>>>>>>>>>> : " + cvo.getTotalCount());
				
				logger.info("totalCount >>> : " + totalCount );
				
				
		
				%>
				</tbody>	
				
			</table>

				<div>
					<span>
					<br><br>
					<input type="hidden" id="searchFilterVal" value="<%=searchFilter %>">
					<input type="hidden" id="keywordVal" value="<%=keyword %>">
					<input type="hidden" id="startDateVal" value="<%=startDate %>">
					<input type="hidden" id="endDateVal" value="<%=endDate %>">
					<jsp:include page="/WEB-INF/view/paging/paging.jsp" flush="true">
						<jsp:param name="url" value="communitySelectAll.ict" />
						<jsp:param value="" name="str"/>
						<jsp:param name="pageSize" value="<%=pageSize %>" />
						<jsp:param name="groupSize" value="<%=groupSize %>" />
						<jsp:param name="curPage" value="<%=curPage %>"/>
						<jsp:param name="totalCount" value="<%=totalCount %>"/>
						<jsp:param value="<%=searchFilter %>" name="searchFilter"/>
						<jsp:param value="<%=keyword %>" name="keyword"/>
						<jsp:param value="<%=startDate %>" name="startDate"/>
						<jsp:param value="<%=endDate %>" name="endDate"/>
						</jsp:include>
					</span>
				</div>
			<%
			}else{
				out.println("<script>alert('검색된 게시글이 없습니다.'); location.href='communitySelectAll.ict';</script>");
			}//if else
			%>
	</div>
		
	<!-- -------------------------------페이지 전용 center------------------------------- -->
</div> <!-- center -->

<!-- common_count.js 자바스크립트 임포트하면 span태그에 값이 바인딩 됨. -->
<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
	</div>
	<div>
		<span></span> / <span></span><br />
		<span></span> / <span></span><br />
	</div>
</div> <!-- footer -->

</div><!-- all_div -->
</div> <!-- realall -->
</form>
	<form id="logoutForm">
 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
 		</form>
</body>
</html>