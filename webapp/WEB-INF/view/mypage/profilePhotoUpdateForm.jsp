<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.ict.mem.vo.MemVO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ profilePhotoUpdateForm.jsp ~~");
%>

<%
	String mkey = "";
	mkey = request.getParameter("mkey");
	
	logger.info("mkey >>> : " + mkey);
%>

<%
Object obj = null;
obj = request.getAttribute("list");

if (obj == null) return;

List<MemVO> list = null;
list = (List<MemVO>)obj;

if (list != null && list.size() > 0) {
	logger.info("list.size() >>> : " + list.size());
	
	for (int i = 0; i < list.size(); i++) {
		
		MemVO mvo = list.get(i);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profilePhotoUpdateForm.jsp</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert("profilePhotoUpdateForm.jsp");
	
	//	처음 로딩시에는 기존 닉네임이 입력되어 있으나 클릭하면 사라지게 하는 함수
	$(document).on('click', '#mnick', function(){
		if ($('#mnick').prop('readonly')) {
			
			$('#mnick').val('');
			$('#mnick').prop('readonly', false);
			$('#mnick').focus();
		}
	});
	
	//	가린 input대신 지금 넣은 파일 이름 보이게 하는 함수
	$(document).on('input', '#mprofile', function(){
		if(!$('#mprofile').val()) {
			$("#fileName").html('');
		}else {
			alert("입력o >>> : " + $('#mprofile').val());
			
			var fileValue = $("#mprofile").val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명
			$("#fileName").html(fileName);
		}
	});
	
	//	정보 보내기
	$(document).on('click', '.mprBtn', function(){

		alert("mkey >>> : " + $('#mkey').val());
		$('#profileUpdateForm').attr({
			 "action"	: "memUpdate.ict"
			,"method"	: "POST"
			,"enctype"	: "multipart/form-data"
		}).submit();
	});
	
});
</script>
</head>
<body>

<form id="profileUpdateForm">

profilePhotoUpdateForm.jsp
<input type="hidden" id="mnum" name="mnum" value="<%= mvo.getMnum() %>">
<input type="hidden" id="mkey" name="mkey" value="<%= mkey %>">
<table>
<tr>
	<td rowspan="2">
	프로필 사진
	</td>
	<td>
	<label class="mphtoBtn" for="mprofile">
	<img src="/oneYo/img/mem/<%= mvo.getMprofile() %>" width="150" height="150" alt="image">
	</label>
	</td>
</tr>
<tr>
	<td>
	<label class="mphtoBtn" for="mprofile">사진 선택</label>
	<br><span id="fileName"></span>
	<input type="file" id="mprofile" name="mprofile" hidden="true">
	</td>
</tr>
<tr>
	<td>
	닉네임
	</td>
	<td>
	<input type="text" id="mnick" name="mnick" value="<%= mvo.getMnick() %>" readonly>
	</td>
</tr>
</table>

<input type="button" class="mprBtn" value="사진 및 닉네임 변경">

<%
	}
}
%>

</form>

</body>
</html>