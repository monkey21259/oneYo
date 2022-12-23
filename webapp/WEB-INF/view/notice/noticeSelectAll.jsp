<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="main.ict.notice.vo.NoticeVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	Object obj = request.getAttribute("sallList");
	if (obj == null) return;
	List<NoticeVO> sallList = (List<NoticeVO>)obj;
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
		%>
				<tr>
					<td>
						<%= sallList.size() - i %>
					</td>
					<td>
						<a href="noticeSelectContent.ict?nnum=<%=nvo.getNnum()%>"><%=nvo.getNsubject() %></a>
					</td>
					<td>
						<%=nvo.getUpdatedate() %>
					</td>
					<td>
						<%=nvo.getNhit() %>
					</td>
				</tr>
		<%
			}//end of for
		%>
			</table>
			<input type="hidden" id="nnum" name="nnum">
		</form>
	</body>
</html>