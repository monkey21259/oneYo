<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ memGrade.jsp ~~");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memGrade.jsp</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- <script type="text/javascript" src="/oneYo/resource/js/mem/memGrade.js" charset="UTF-8"></script> -->
<script type="text/javascript">
alert("test3");
$(document).ready(function(){
	alert("test4");
	
	//	일반/전문가 등급 정하기				=====
	$(document).on('click', '.btn', function(){
		alert("plz 한글 주시오");
		let grade = $(this).text();
		
		if (grade == '일반') { $('#mgrade').val('0'); }
		if (grade == '전문가') { $('#mgrade').val('1'); }
		
		$('#testtest').html($('#mgrade').val());
	});	//	$('.btn').click()		=====
	
	//	이메일 선택 박스 변경시 text변경되는 함수		=====
	$(document).on('change', '#memail2', function(){
		alert("memail2 >>> : " + $('#memail2').val());
		
		let emails = ["", "gmail.com", "naver.com", "kakao.com", ""];
		let emailKey = parseInt($('#memail2').val());
		alert("email2 >>> : " + emails[emailKey]);
		
		$('#memail1').val(emails[emailKey]);
		if (emailKey == '4') {
			$('#memail1').attr("readonly", false);
			$('#memail1').focus();
		} else {
			$('#memail1').attr("readonly", true);
		}
	});	//	$('#memail2').change()		=====
	
	
	//	form 전송하기						=====
	$(document).on('click', '#memailBtn', function(){
		alert("#memailBtn >>> : "
				+ $('#memail0').val() + "@" + $('#memail1').val()
				+ "/" + $('#mgrade').val());
		
		let cnt = 0;
		
		$('.memail').each(function(){
			
			if ($(this).val() == "" || $(this).val() == null) {
				cnt += 1;
				
				alert("이메일을 마저 작성 해주세요.");
				$("#memail0").focus();
				
				return false;
			}
		});
		
		if (cnt == 0) {
			
			let memail = $('#memail0').val() + "@" + $('#memail1').val();
			
			$('#memail').val(memail);
			
			console.log("#memail >>> : " + $('#memail').val());
			
			let link = "/oneYo/memInsertEmail.ict"
								+ "?mgrade=" + $('#mgrade').val()
								+ "&memail=" + $('#memail').val();
			
			alert(link);
		
			location.href = link;
		}
		
	});	//	$('#memailBtn').click()		=====
	
});
</script>
</head>
<body>


<div>
<form id="memGradeForm">
이거 다른건디 일단 쓰던거 마저 쓰기 ㅎㅎ;;

<p id="testtest">
일반
</p>
<button type="button" class="btn">일반</button>
<button type="button" class="btn">전문가</button>
<input type="hidden" id="mgrade" value="0">

<table>
<tr>
<td>
	<input type="text" id="memail0" name="memail0">
	@ <input type="text" id="memail1" name="memail1" readonly>
	<select id="memail2">
		<option value="0">선택해주세요.</option>
		<option value="1">gmail.com</option>
		<option value="2">naver.com</option>
		<option value="3">kakao.com</option>
		<option value="4">직접 입력</option>
	</select>
	<input type="hidden" id="memail" name="memail" value="">
</td>
</tr>
<tr>
<td>
	<input type="button" id="memailBtn" name="memailBtn" value="이메일 인증">
</td>
</tr>
</table>

</form>
</div>
</body>
</html>