<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="main.ict.notice.vo.NoticeVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	Object obj = request.getAttribute("sallList");
	if (obj == null) return;
	List<NoticeVO> sallList = (List<NoticeVO>)obj;
	
	Object pagingObj = request.getAttribute("pagingVO");
	if (pagingObj == null) return;
	NoticeVO pagingVO = (NoticeVO)pagingObj;
	
	int pageSize = Integer.parseInt(pagingVO.getPageSize());
	int groupSize = Integer.parseInt(pagingVO.getGroupSize());
	int curPage = Integer.parseInt(pagingVO.getCurPage());
	int totalCount = 0;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<form id="selectAllForm" name="selectAllForm">
			<table>
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
						<jsp:include page="noticePaging.jsp" flush="true">
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