<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("tipInsertForm.jsp 페이지 진입");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		console.log("tipInsertForm.jsp 페이지 스크립트 블럭");
		
		$(document).on("click", "#inputBtn", function(){
			console.log("inputBtn 버튼 클릭 이벤트 발생");
			alert("inputBtn 버튼 클릭 이벤트 발생");
			
			var tsubject_val = $("#tsubject").val();
			console.log("글제목 : " + tsubject_val);
			
			var tcontent_val = $("#tcontent").val();
			console.log("글내용 : " + tcontent_val);
			
			var tsubject_chk = !(tsubject_val == null || tsubject_val == "" || tsubject_val.length == 0 || typeof tsubject_val == "undefined");
			console.log("글 제목 작성여부 : " + tsubject_chk);
			
			var tcontent_chk = !(tcontent_val == null || tcontent_val == "" || tcontent_val.length == 0 || typeof tcontent_val == "undefined");
			console.log("글 내용 작성여부 : " + tcontent_val);
			
			if(tsubject_chk && tcontent_chk){
				$("#tipInsertForm").attr({
					"action": "tipInsert.ict",
					"method": "POST",
					"enctype": "multipart/form-data"
				}).submit();
			}else{
				if(!tsubject_chk && !tcontent_chk){
					alert("글 제목과 내용을 입력하세요.");
					$("#tsubject").focus();
				}else if(!tcontent_chk){
					alert("글 내용을 입력하세요.");
					$("#tcontent").focus();
				}else if(!tsubject_chk){
					alert("글 제목을 입력하세요");
					$("#tsubject").focus();
				}
			}
		});
		
	});

</script>
<title>오내요(oneYo)</title>
</head>
<body>
<h3>전문가 팁 게시판 글 쓰기</h3>
<hr>
<form id="tipInsertForm">
<table>
	<tr>
		<td>글제목</td>
		<td><input type="text" id="tsubject" name="tsubject" placeholder="글 제목" size="50"></td>
	</tr>
	<tr>
		<td>팁 분야</td>
		<td>
		<select name="tcategory">
			<option value="00">요리
			<option value="01">주방관리
			<option value="02">재료정보
			<option value="99">기타
		</select>
		</td>
	</tr>
	<tr>
		<td>글내용</td>
		<td><textarea rows="10" cols="50" id="tcontent" name="tcontent" placeholder="글 내용"></textarea></td>
	</tr>
	<tr>
		<td>사진 선택</td>
		<td><input type="file" name="tphoto"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="reset" id="resetBtn" value="다시 쓰기" style="float:right;">
			<input type="button" id="inputBtn" value="글 등록" style="float:right;">
		</td>
	</tr>
</table>
</form>
</body>
</html>