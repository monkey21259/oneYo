<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="main.ict.common.O_Session"%>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.notice.vo.NoticeVO" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%
	request.setCharacterEncoding("UTF-8");
	Logger logger = LogManager.getLogger(this.getClass());
	
	
	Object obj = request.getAttribute("sallList");
	if (obj == null) {
		out.println("<script>alert('검색된 게시글이 없습니다.'); location.href='noticeSelectAll.ict';</script>");
	}//end of if
	List<NoticeVO> sallList = (List<NoticeVO>)obj;
	
	Object pagingObj = request.getAttribute("pagingVO");
	if (pagingObj == null) return;
	NoticeVO pagingVO = (NoticeVO)pagingObj;
	
	//페이징
	int pageSize = Integer.parseInt(pagingVO.getPageSize());
	int groupSize = Integer.parseInt(pagingVO.getGroupSize());
	int curPage = Integer.parseInt(pagingVO.getCurPage());
	int totalCount = 0;
	
	//searching
	String searchFilter = "";
	String keyword = "";
	String startDate= "";
	String endDate = "";
	
	O_Session mSession = O_Session.getInstance();
	String mnum = mSession.getSession(request);
	logger.info("mnum >>> : " + mnum);
		
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>공지사항</title>
		
		<!-- jQuery -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- jQuery 캘린더 -->
		<script src="/oneYo/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
		<script src="/oneYo/calendar_datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>
		<link rel="stylesheet" href="/oneYo/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		<!-- noticeSelectAll.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/notice/noticeSelectAll.css">		
		<!-- 페이징 기능 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/common/paging.css">
		
		<script type="text/javascript">
			$(document).ready(function(){
				//jQuery 충돌 방지(datepicker 때문)
				//var $j = jQuery.noConflict();
				
				$(document).on("click", "#insertBtn", function(){
					location.href="noticeInsertForm.ict";					
				}); 
				
				
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
						$('#selectAllForm').attr({
							'action':'noticeSelectAll.ict',
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
				
				//	검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
				//	홈으로 보내주는 all.js 함수
				homeAction();
				//	메뉴바 클릭액션 all.js 함수
				divClickAction();
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="selectAllForm" name="selectAllForm">
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
			
			<table>
				<tr>
					<td colspan="4">
						<select id="searchFilter" name="searchFilter">
							<option id="00" value="00">전체</option>
							<option id="01" value="01">제목</option>
							<option id="02" value="02">내용</option>
						</select>
						<input type="text" id="keyword" name="keyword" placeholder="검색어 입력">
						<input type="text" id="startDate" name="startDate" size="8" placeholder="검색 시작일" autocomplete="off"> ~
						<input type="text" id="endDate" name="endDate" size="8" placeholder="검색 종료일" autocomplete="off">
						<input type="button" id="searchBtn" value="검색">
					</td>
				</tr>
				<tr>
					<td>순번</td>
					<td>제목</td>
					<td>일자</td>
					<td>조회 수</td>
				</tr>
		<%
			for(int i=0; i<sallList.size(); i++){
				NoticeVO nvo = sallList.get(i);
				
				totalCount = Integer.parseInt(nvo.getTotalCount());
				
				searchFilter = nvo.getSearchFilter();
				keyword = nvo.getKeyword();
				startDate = nvo.getStartDate();
				endDate = nvo.getEndDate();
		%>
				<tr>
					<td>
						<%= nvo.getNoticeno() %>
					</td>
					<td>
						<a href="noticeSelectContent.ict?nnum=<%=nvo.getNnum()%>"><%=nvo.getNsubject() %></a>
					</td>
					<td>
						<%=nvo.getInsertdate() %>
					</td>
					<td>
						<%=nvo.getNhit() %>
					</td>
				</tr>
		<%
			}//end of for
		%>
				<tr>
					<td colspan="4">
						<input type="hidden" id="searchFilterVal" value="<%=searchFilter %>">
						<input type="hidden" id="keywordVal" value="<%=keyword %>">
						<input type="hidden" id="startDateVal" value="<%=startDate %>">
						<input type="hidden" id="endDateVal" value="<%=endDate %>">
						<jsp:include page="/WEB-INF/view/paging/paging.jsp" flush="true">
							<jsp:param value="noticeSelectAll.ict" name="url"/>
								<jsp:param value="" name="str"/>
								<jsp:param value="<%=pageSize %>" name="pageSize"/>
								<jsp:param value="<%=groupSize %>" name="groupSize"/>
								<jsp:param value="<%=curPage %>" name="curPage"/>
								<jsp:param value="<%=totalCount %>" name="totalCount"/>
								<jsp:param value="<%=searchFilter %>" name="searchFilter"/>
								<jsp:param value="<%=keyword %>" name="keyword"/>
								<jsp:param value="<%=startDate %>" name="startDate"/>
								<jsp:param value="<%=endDate %>" name="endDate"/>
						</jsp:include>
					</td>
				</tr>
			</table>
			
			<%
				if(mnum.equals("M000000000000")){
			%>
				<button type="button" id="insertBtn" name="insertBtn">글등록</button>
				<%
				}
				%>
				<input type="hidden" id="nnum" name="nnum">
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
	</body>
</html>