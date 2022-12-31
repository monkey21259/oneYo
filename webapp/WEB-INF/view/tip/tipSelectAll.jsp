<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.tip.vo.TipVO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("tipSelectAll.jsp 페이지 진입");
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
<html>
<head>
	<meta charset="UTF-8">
	<title>oneYo(오내요)</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0
						maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<!-- 전체 css -->
	<link rel="stylesheet" href="/oneYo/resource/css/all.css">
	
	<!-- tipSelectAll.jsp 전용 -->
	<link rel="stylesheet" href="/oneYo/resource/css/tip/tipSelectAll.css">		
	
	<!-- 페이징 기능 전용 -->
	<link rel="stylesheet" href="/oneYo/resource/css/common/paging.css">
	
	<!-- 제이쿼리 -->
	<link rel="stylesheet" href="/oneYo/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="/oneYo/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script src="/oneYo/calendar_datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>
	
	<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
	<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){		
			console.log("tipSelectAll.jsp 페이지 진입");
			
			$(document).on("click", ".tsubject", function(){
				let tnum = $(this).children(1).val();
				console.log("tnum : " + tnum);
				
				location.href = "tipSelectContent.ict?tnum=" + tnum;
				
				<%--
				$("#tipSelectAllForm").attr({
					"action": "#tipSelectContent.ict",
					"method": "GET"
				}).submit();
				--%>
			});
			
			$(document).on("click", ".tcontent", function(){
				let tnum = $(this).children(1).val();
				console.log("tnum : " + tnum);
				
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
			$('#searchBtn').click(function(){
				var cate = document.getElementsByName('searchCategory');
				var bool = false;
				for(var i=0; i<cate.length; i++){
					if(cate[i].hasAttribute('data')){
						bool = true;
					}//end of if
				}//end of for
				
				if (($('#keyword').val() == '') && ($('#startDate').val() == '') && ($('#endDate').val() == '') && ($('.category').prop('checked') == false) && !bool) {
					alert("검색할 카테고리, 키워드 또는 날짜를 설정하세요.");
					$('#keyword').focus();
				}else if(($('#keyword').val() == '') && ($('#startDate').val() == '') && ($('#endDate').val() != '')){
					alert("검색 시작일을 설정하세요.");
					$('#startDate').focus();
				}else if(($('#keyword').val() == '') && ($('#startDate').val() != '') && ($('#endDate').val() == '')){
					alert("검색 종료일을 설정하세요.");
					$('#endDate').focus();
				}else{
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
			
			//	검색 바 없어졌다 생기기 액션주는 all.js 함수
			hiddenAction();
			
		});// ready
		
	</script>
	</head>
	<body>
	<form id="tipSelectAllForm">
	<div id="sideBar">
		<div id="warningForm">
		신고
		</div>
		
		<div class="searchBarBtn">
		검색
		</div>
		
		<a href="javascript:window.scrollTo(0,0);">
		<div id="go_top">
		TOP▲
		</div>
		</a>
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
	
	<div id="all_div">
	
		<div id="header">
		<div id="logoLeft" class="logoSide">
		로고 옆공간 좌측
		</div>
		<div id="logoCenter">
			<a href="home.ict">
				<div id="logo">
				<img alt="오내요" src="/oneYo/resource/img/oneYo_logo.png">
				<!-- 379 X 186 -->
				</div>
			</a>
		</div>
		<div id="logoRight" class="logoSide">
		로고 옆공간 우측
		</div>
		
		<hr>
		
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
		
		<hr>
	</div>
	
	<div id="left">
	좌측
	</div>
	
	<div id="center">
	<!-- -------------------------------페이지 전용 center------------------------------- -->
	<table>
		<thead>
			<tr>
				<td colspan="4">
					<input type="checkbox" id="searchCategory" name="searchCategory" class="category" value="00">요리&nbsp;
					<input type="checkbox" id="searchCategory" name="searchCategory" class="category" value="01">주방관리&nbsp;
					<input type="checkbox" id="searchCategory" name="searchCategory" class="category" value="02">재료정보&nbsp;
					<input type="checkbox" id="searchCategory" name="searchCategory" class="category" value="99">기타<br>
					<input type="text" id="keyword" name="keyword" placeholder="제목 검색">
					<input type="text" id="startDate" name="startDate" size="8" placeholder="검색 시작일" autocomplete="off"> ~
					<input type="text" id="endDate" name="endDate" size="8" placeholder="검색 종료일" autocomplete="off">
					<input type="button" id="searchBtn" value="검색">
				</td>
			</tr>
			<tr>
				<th>글 번호</th>
				<th>글 제목</th>
				<th>글 내용</th>
				<th>글 조회수</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
	<% 
		for(int i=0; i < list.size(); i++) {
			tvo = list.get(i);
			
			totalCount = Integer.parseInt(tvo.getTotalCount());
			
			searchCategory = tvo.getSearchCategory();
			keyword = tvo.getKeyword();
			startDate = tvo.getStartDate();
			endDate = tvo.getEndDate();
	%>
			<tr>
				<td>
					<%= tvo.getTipnum() %>
				</td>
				<td class="tsubject">
					<%= tvo.getTsubject() %>
					<input type="hidden" class="tnum" name="tnum" value="<%= tvo.getTnum() %>">
				</td>
				<td class="tcontent">
					<%= tvo.getTcontent() %>
					<input type="hidden" class="tnum" name="tnum" value="<%= tvo.getTnum() %>">
				</td>
				<td>
					<%= tvo.getThit() %>
				</td>
				<td>
					<%= tvo.getMnick() %>
				</td>
				<td>
					<%= tvo.getInsertdate() %>
				</td>
			</tr>
	<%
		}
	%>
			<tr>
				<td colspan="4">
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

<div id="right">
우측
</div>

<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
		<span>팀 소개: ~~~</span>
	</div>
	<div>
		<span>회원 수: </span> / <span>레시피글 수: </span><br />
		<span>전문가팁글 수: </span> / <span>커뮤니티글 수: </span><br />
	</div>
</div>

</div>
			
		</form>
	</body>
</html>