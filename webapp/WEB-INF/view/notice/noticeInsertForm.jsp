<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 글 쓰기</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				
				$(document).on('click', '#insertBtn', function(){
					
					$('#noticeInsertForm').attr({
						'action':'noticeInsert.ict',
						'method':'POST',
						'enctype':'multipart/form-data'
					}).submit();//end of submit
					
				});//end of insertBtn click function
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<form id="noticeInsertForm" name="noticeInsertForm">
			<table>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" id="nsubject" name="nsubject">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea id="ncontent" name="ncontent" rows="50" cols="40"></textarea>
					</td>
				</tr>
				<tr>
					<td>사진</td>
					<td>
						<input type="file" id="nphoto" name="nphoto">
					</td>
				</tr>
			</table>
			<button id="insertBtn" name="insertBtn">글 쓰기</button>
		</form>
	</body>
</html>