<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>

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
		<title>커뮤니티 전체 조회</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0
							maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<!-- 제이쿼리cdn -->
		<link rel="stylesheet" href="/oneYo/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="/oneYo/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
		<script src="/oneYo/calendar_datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>
		<script type="text/javascript">
		
		$(document).ready(function(){
			$(document).on("click", "#communityInsertBtn", function(){
				$("#communitySelectAll").attr({
					"action":"communityInsertForm.ict",
					"method":"GET",
					"enctype":"application/x-www=form=urlencoded"	
				}).submit();
			}); //insertSelectAllBtn
			
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
			
		}); //ready
	
		</script>
	</head>
 	<body>
	<h3>커뮤니티 게시판</h3>
	<hr>
	<div>
		<div>
			<button type="button">인기글</button> 			
			<button type="button" id="communityInsertBtn" name="communityInsertBtn">글 등록 </button>
		</div>
	</div>

		<form id="communitySelectAll" name="communitySelectAll">
			<table>
				<thead>
					<tr>
						<td colspan="4">
							<select id="searchFilter" name="searchFilter">
								<option id="00" value="00">전체</option>
								<option id="01" value="01">제목</option>
								<option id="02" value="02">작성자</option>
							</select>
							<input type="text" id="keyword" name="keyword" placeholder="검색어 입력">
							<input type="text" id="startDate" name="startDate" size="8" placeholder="검색 시작일" autocomplete="off"> ~
							<input type="text" id="endDate" name="endDate" size="8" placeholder="검색 종료일" autocomplete="off">
							<input type="button" id="searchBtn" value="검색">
						</td>
					</tr>
					<tr>
						<th>NO</th>
						<th>글제목</th>
						<th>닉네임</th>
						<th>조회수</th>
						<th>좋아요</th>
						<th>날짜</th>
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
						<td><a href="communitySelectContent.ict?cnum=<%= cvo.getCnum()%>"><%= cvo.getCsubject() %></a></td>
						<td><%= cvo.getMnick() %></td>
						<td><%= cvo.getChit() %></td>
						<td><%= 1 %></td>                 <!-- 나중에 추가하기 -->
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
				<tr>
				<td colspan="6">
				<input type="hidden" id="searchFilterVal" value="<%=searchFilter %>">
				<input type="hidden" id="keywordVal" value="<%=keyword %>">
				<input type="hidden" id="startDateVal" value="<%=startDate %>">
				<input type="hidden" id="endDateVal" value="<%=endDate %>">
				<jsp:include page="/WEB-INF/view/paging/paging.jsp" flush="true">
					<jsp:param name="url" value="communitySelectAll.ict" />
					<jsp:param name="pageSize" value="<%=pageSize %>" />
					<jsp:param name="groupSize" value="<%=groupSize %>" />
					<jsp:param name="curPage" value="<%=curPage %>"/>
					<jsp:param name="totalCount" value="<%=totalCount %>"/>
					</jsp:include>
				</td>
			</tr>
			<%
			}else{
				out.println("<script>alert('검색된 게시글이 없습니다.'); location.href='communitySelectAll.ict';</script>");
			}//if else
			%>
				</tbody>	
	
			</table>
		</form>
	</body>
</html>