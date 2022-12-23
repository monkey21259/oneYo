<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="main.ict.notice.vo.NoticeVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	Object obj = request.getAttribute("updateList");
	if (obj == null) return;
	List<NoticeVO> scontList = (List<NoticeVO>)obj;
	NoticeVO nvo = scontList.get(0);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 글 수정</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				
				$(document).on('click', '#updateBtn', function(){
					
					$('#noticeUpdateForm').attr({
						'action':'noticeUpdate.ict',
						'method':'POST',
						'enctype':'multipart/form-data'
					}).submit();//end of submit
					
				});//end of updateBtn click function
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="noticeUpdateForm" name="noticeUpdateForm">
			<input type="hidden" id="nnum" name="nnum" value="<%=nvo.getNnum() %>">
			<table>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" id="nsubject" name="nsubject" value="<%=nvo.getNsubject()%>">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea id="ncontent" name="ncontent" rows="50" cols="40"><%=nvo.getNcontent() %></textarea>
					</td>
				</tr>
				<tr>
					<td>사진</td>
					<td>
						<img src="/oneYo/img/notice/<%=nvo.getNphoto()%>">
						<input type="hidden" id="nphoto1" name="nphoto1" value="<%=nvo.getNphoto()%>">
						<input type="file" id="nphoto" name="nphoto">
					</td>
				</tr>
			</table>
			<button id="updateBtn" name="updateBtn">글 수정</button>
		</form>
	</body>
</html>