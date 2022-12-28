<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(document).on("click", "#insertBtn", function(){
			alert("insertBtn 버튼 클릭 이벤트 발생");
			
			let mnum = $("#mnum").val();
			let lvsubject = $("#lvsubject").val();
			let lvcontent = $("#lvcontent").val();
			let lvphoto = $("#lvphoto").val();
			
			console.log("mnum : " + mnum);
			console.log("lvsubject : " + lvsubject);
			console.log("lvcontent : " + lvcontent);
			console.log("lvphoto : " + lvphoto);
			
			var lvsubject_chk = !(lvsubject == null || lvsubject == "" || lvsubject.length == 0 || typeof lvsubject == "undefined");
			var lvcontent_chk = !(lvcontent == null || lvcontent == "" || lvcontent.length == 0 || typeof lvcontent == "undefined");
			console.log(lvsubject_chk);
			console.log(lvcontent_chk);
			
			if(lvsubject_chk && lvcontent_chk){
				
				$("#levelupInsertForm").attr({
					'action': 'levelupInsert.ict',
					'method': 'POST',
					'enctype': 'multipart/form-data'
				}).submit();
			}
		});
	});

</script>
</head>
<body>
<div id="container" style="text-align:center;">
<form id="levelupInsertForm">
	<table style="display:inline-block;">
		<tr>
			<td>
				<input type="hidden" id="mnum" name="mnum" value="${mvo.mnum}" />
				제목
			</td>
			<td>
				<input type="text" id="lvsubject" name="lvsubject" />
			</td>
		</tr>
		<tr>
			<td>
				내용
			</td>
			<td>
				<textarea rows="10" cols="22" id="lvcontent" name="lvcontent"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				사진
			</td>
			<td>
				<input type="file" id="lvphoto" name="lvphoto">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" id="insertBtn" value="등록하기" />
				<input type="reset"  value="다시쓰기" />
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>