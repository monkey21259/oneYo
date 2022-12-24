<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ memGrade.jsp ~~");
%>

<%
	String memail = null;
	memail = request.getParameter("memail");
	logger.info(memail);
%>
<%
	String mgrade = null;
	mgrade = request.getParameter("mgrade");
	logger.info(mgrade);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memInsertForm.jsp</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert("hihi, <%= memail %>. 회원가입 진행합니다.");
	
// 	//	mcategory 단수	=====================
// 	$(document).on('click', '.mcategory', function(){
		
// 		$('.mcategory').prop('checked', false);
// 		$(this).prop('checked', true);
// 	});	//	mcategory 단수	=====================
	
	
	$(document).on('click', '#formBtn', function(){
		
		//	NOT NULL 데이터 NULL 체크			=====================
			
		let cnt = 0;			//	null갯수 체크 변수
		let thisNull = null;	//	포커싱 위한 변수
		
		$('.notNull').each(function(){	//	null이면 안되는 input을 돌며 null데이터를 체크한다.
			if ($(this).val() == null || $(this).val() == '') {	//	input null 체크 if
				
				cnt += 1;	//	input null 이면 cnt가 올라간다.
				
				if (cnt == 1) {	//	null 항목 중 가장 첫번째라면
					thisNull = $(this);	//	가장 처음 null인 대상을 thisNull에 입력
				}	//	포커싱 위한 this 선택 if
				
			}	//	input null 체크 if
		});	//	null이면 안되는 input을 돌며 null데이터를 체크한다.
		
		if (cnt != 0) {	//	NOT NULL항목중 null이 있었을 경우
			
			alert("미작성 한 필수 입력 항목이 " + cnt + "개 있습니다. 마저 작성해주세요.");	//	미작성 항목 수를 알려줌
			thisNull.focus();	//	미작성 한 것 중 가장 앞에 커서를 올려둠
			
		//	NOT NULL 데이터 NULL 체크			=====================
			
		} else {	//	NOT NULL 항목 중 null이 없었을 경우
			
			//	mhp			=====================
			let mhp = $('#mhp0').val();
				mhp += "-" + $('#mhp1').val();
				mhp += "-" + $('#mhp2').val();
			$('#mhp').val(mhp);		//	mhp합치기..
			console.log('mhp >>> : ' + $('#mhp').val());
			//	mhp			=====================
				
			//	mcategory 복수	=====================
			let mcategory = "";
			$('.mcategory').each(function(){
				if ($(this).is(':checked') == true) {
					mcategory += "#" + $(this).val();
				}
			});
			$('#mcategory').val(mcategory);
			console.log("mcategory >>> : " + $('#mcategory').val());
			//	mcategory 복수	=====================
			
			alert("mid >>> : " + $('#mid').val());
			
			$('#memInsertForm').attr({
				 'action'	: 'memInsert.ict'
				,'method'	: 'POST'
				,'enctype'	: 'multipart/form-data'
			}).submit();
		}
		
		
		
	});
	
});
</script>
<style type="text/css">
.mhp {
	width	: 40px;
}
</style>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<div>
<form id="memInsertForm" name="memInsertForm">


회원가입 포오옴
<table border=1>
<!-- mid 아이디 -->
<tr>
	<td>
		ID
	</td>
	<td>
		<input type="text" id="mid" name="mid" class="notNull">
	</td>
	<td>
		<input type="button" id="midBtn" name="midBtn" value="아이디 확인">
	</td>
</tr>
<!-- mpw 비밀번호 -->
<tr>
	<td rowspan='2'>
		PW
	</td>
	<td>
		<input type="text" id="mpw" name="mpw" class="notNull">
	</td>
	<td rowspan='2'>
		<input type="button" id="mpwBtn" name="mpwBtn" value="비밀번호 확인">
	</td>
</tr>
<tr>
	<td>
		<input type="text" id="mpw_r" name="mpw_r">
	</td>
</tr>
<!-- mname 이름 -->
<tr>
	<td>
		이름
	</td>
	<td>
		<input type="text" id="mname" name="mname">
	</td>
	<td>
	</td>
</tr>
<!-- mnick 닉네임 -->
<tr>
	<td>
		닉네임
	</td>
	<td>
		<input type="text" id="mnick" name="mnick">
	</td>
	<td>
	</td>
</tr>
<!-- mhp 휴대폰 -->
<tr>
	<td>
		휴대폰
	</td>
	<td>
		<input type="text" id="mhp0" name="mhp0" class="mhp notNull">
		- <input type="text" id="mhp1" name="mhp1" class="mhp notNull">
		- <input type="text" id="mhp2" name="mhp2" class="mhp notNull">
		<input type="hidden" id="mhp" name="mhp" value="">
	</td>
	<td>
	</td>
</tr>
<!-- memail 이메일 -->
<tr>
	<td>
		이메일
	</td>
	<td>
		<%= memail %>
		<input type="hidden" id="memail" name="memail" value="<%= memail %>">
		<input type="hidden" id="mgrade" name="mgrade" value="<%= mgrade %>">
	</td>
	<td>
	</td>
</tr>
<!-- mprofile 프로필 사진 -->
<tr>
	<td>
		프로필 사진
	</td>
	<td>
		<input type="file" id="mprofile" name="mprofile">
	</td>
	<td>
	</td>
</tr>
<!-- mcategory 요리 분야 -->
<tr>
	<td>
		LIKE
	</td>
	<td>
		<ul>
		<li>
			<input type="checkbox" class="mcategory" value="00">한식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="01">중식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="02">양식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="03">일식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="04">간식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="99">기타
		</li>
		</ul>
		<input type="hidden" id="mcategory" name="mcategory" value="">
	</td>
	<td>
	</td>
</tr>
<tr>
	<td colspan="3">
		<input type="button" id="formBtn" name="formBtn" value="회원가입">
	</td>
</tr>
</table>

</form>
</div>
</body>
</html>