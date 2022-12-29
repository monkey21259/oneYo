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
	
	logger.info("~~ profileEmailUpdateForm.jsp ~~");
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
<title>profileEmailUpdateForm.jsp</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert("profileEmailUpdateForm.jsp");
	
	var random = Math.floor(Math.random() * 1000000 + 1);
	var mkey = "<%= mkey %>";
	
	$('#mkey').val(random);

	//	이메일 선택 박스 변경시 text변경되는 함수		=====
	$(document).on('change', '#memail2', function(){
		alert("memail2 >>> : " + $('#memail2').val());
		
		let emails = ["", "gmail.com", "naver.com", "kakao.com", ""];
		let emailKey = parseInt($('#memail2').val());
		alert("email2 >>> : " + emails[emailKey]);
		
		$('#memail1').val(emails[emailKey]);
		if (emailKey == '4') {
			$('#memail1').prop("readonly", false);
			$('#memail1').focus();
		} else {
			$('#memail1').prop("readonly", true);
		}
	});	//	$('#memail2').change()		=====
	
	//	form 전송하기						=====
	$(document).on('click', '.memailBtn', function(){
		alert("#memailBtn >>> : "
				+ $('#memail0').val() + "@" + $('#memail1').val()
				+ "/" + $('#mailKey').val());
		
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
			
			if (!$('.memail').prop('readonly')) {
				$('.memail').prop("readonly", true);
				
				// ajax로 보내기
				let emailCheckURL = "profileEmailCheck.ict";
				let reqType = "POST";
				let dataParam = {
					 memail		: $('#memail').val()
					,mkey		: $('#mkey').val()
				};
				
				$.ajax({
					 url 	: emailCheckURL
					,type	: reqType
					,data	: dataParam
					,success: whenSuccess
					,error	: whenError
				});
				
				function whenSuccess(resData) {
					console.log("resData >>> : " + resData);
					
					if ("GOMAIL" == resData) {
						
						alert("메일 인증 발송 성공");
						console.log("메일 인증 발송 성공 : GOMAIL");
						
						$('#mailKey_r').prop('hidden', false);
						$('#mailKey_r').focus();
						
					}else if("NOTMAIL" == resData) {
						
						alert("메일 인증 정상 발송 실패");
						console.log("메일 인증 정상 발송 실패 : NOTMAIL");
						
						$('#memail0').val('');
						$('#memail1').val('');
						$('#memail2').attr('select', '0');
						$('#memail0').prop("readonly", false);
						$('#memail0').focus();
						
					}
				}	//	ajax 수행문
				
				function whenError() {
					alert("에러 발생, 콘솔을 확인 해 주세요.");
					console.log("에러 발생 e >>> : " + e.responseText);
				}
				
			}else {
				//	이메일 변경하기
				
				if ($('#mkey').val() == $('#mailKey_r').val()) {
					//	인증번호를 올바르게 기입하는데에 성공하였다면
					
					$('#mkey').val(mkey);
					alert("mkey >>> : " + $('#mkey').val());
					
					$('#profileUpdateForm').attr({
						 "action"	: "memUpdate.ict"
						,"method"	: "POST"
						,"enctype"	: "multipart/form-data"
					}).submit();
					
				}else {
					//	인증번호를 올바르게 기입하는데에 실패하였다면
					
					alert("인증에 실패하였습니다. 올바른 값을 입력해주십시오.");
					
					$('#mailKey_r').val('');
					$('#mailKey_r').focus();
				}
				
			}
		}
		
	});	//	$('#memailBtn').click()		=====
	
});
</script>
</head>
<body>

<form id="profileUpdateForm">

profileEmailUpdateForm.jsp
<input type="hidden" id="mnum" name="mnum" value="<%= mvo.getMnum() %>">
<input type="hidden" id="mkey" name="mkey" value="">
<table>
<tr>
	<td>
	이메일 >>> : <%= mvo.getMemail() %>
	</td>
</tr>
<tr>
	<td>
	<input type="text" id="memail0" name="memail0" class="memail">
	@ <input type="text" id="memail1" name="memail1" class="memail" readonly>
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
	<input type="text" id="mailKey_r" name="mailKey_r" hidden="true">
	</td>
</tr>
</table>

<input type="button" class="memailBtn" value="이메일 변경">
<input type="button" class="testBtn" value="test">

<%
		}
	}
%>

</form>

</body>
</html>