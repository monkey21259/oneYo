<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="main.ict.notice.vo.NoticeVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	Object obj = request.getAttribute("scontList");
	if (obj == null) return;
	List<NoticeVO> scontList = (List<NoticeVO>)obj;
	NoticeVO nvo = scontList.get(0);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지글</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				
				$(document).on('click', '#updateBtn', function(){
					$('#selectContentForm').attr({
						'action':'noticeUpdateForm.ict',
						'method':'GET'
					}).submit();//end of submit
				});//end of updateBtn click function
				
				$(document).on('click', '#deleteBtn', function(){
					$('#selectContentForm').attr({
						'action':'noticeDelete.ict',
						'method':'GET'
					}).submit();//end of submit
				});//end of deleteBtn click function
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="selectContentForm" name="selectContentForm">
			<input type="hidden" id="nnum" name="nnum" value="<%=nvo.getNnum() %>">
			<table>
				<tr>
					<td>제목</td>
					<td><%=nvo.getNsubject() %></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=nvo.getUpdatedate() %></td>
				</tr>
				<tr>
					<td colspan="2">
						<img src="/oneYo/img/notice/<%=nvo.getNphoto()%>"><br>
						<%=nvo.getNcontent() %>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button id="updateBtn">수정</button>
						<button id="deleteBtn">삭제</button>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>