<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="main.ict.notice.vo.NoticeVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	
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
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>공지사항</title>
		<link rel="stylesheet" href="/oneYo/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="/oneYo/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
		<script src="/oneYo/calendar_datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				//jQuery 충돌 방지(datepicker 때문)
				//var $j = jQuery.noConflict();
				
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
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="selectAllForm" name="selectAllForm">
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
						</jsp:include>
					</td>
				</tr>
			</table>
			<input type="hidden" id="nnum" name="nnum">
		</form>
	</body>
</html>