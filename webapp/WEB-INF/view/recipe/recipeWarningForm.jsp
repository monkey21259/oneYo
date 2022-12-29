<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<% 
	RecipeVO rvo = (RecipeVO)request.getAttribute("rvo");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	
	$("#datain").click(function(){
		
		let box = $("#box").val();
		
		if(box != '50'){
		
		$("#submit").attr({
			"action":"recipeWarningInsert.ict",
			"method":"GET",
			"enctype":"application/x-www-form-urlencoded"
		}).submit();
		
		alert("신고 되었습니다");
	
		}else{
			alert("신고할 카테고리를 선택해주세요");
			return false;
		}
		});
	
	$("#content").click(function(){
		
		$("#content").text("");
		$("#content").prop("readonly", false);
		
		
		
	});
	
	
	
	
	});
	
</script>
</head>
<body>
<form id="submit" name="submit">
<input type="hidden" name="mnum" value="<%= rvo.getMnum()%>">
<input type="hidden" name="wtnum" value="<%= rvo.getRnum() %>">
<table border="1">
<tr><td>
<h3 align="center">신고하기</h3>
</td></tr>
<tr><td>
<select id="box" name="wcategory">
<option value="50">선택하세요 </option>
<option value="00">욕설 및 비방 </option>
<option value="01">음란물</option>
<option value="02">불법광고</option>
<option value="03">도배성</option>
<option value="04">주제와 맞지 않음 </option>
<option value="99">기타</option>
</td></tr>
<tr><td colspan="2">
글 카테고리
: 레시피</td>
</tr>
<tr><td colspan="2">
글 제목 : 

<%= rvo.getRsubject() %>
</td></tr>
<tr><td>
<textarea id="content" rows="30" cols="80" name="wcontent" readonly>신고할 내용을 작성해주세요</textarea>
</td></tr>
<tr><td colspan="2">
<input type="button" id="datain" value="신고">
<input type="reset" value="다시쓰기">
</td></tr>
</table>
</form>

</body>
</html>