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
	
	//	아이디 중복 검사 이후 재 입력 시도
	$(document).on('click', '#mid', function(){
		
		if ($('#mid').attr('readonly')) {
			
			$('#mid').attr('readonly', false);
			$('#mid').focus();
			$('#midBtn').attr('disabled', false);
		}
		
	});
	
	//	ID 아이디 중복 검사
	$(document).on('click', '#midBtn', function(){
		
		alert("아이디 확인 중! >>> ");
		
		let idCheckURL = "memIdCheck.ict";
		let reqType = "POST";
		let dataParam = { mid : $('#mid').val(), };
		
		$.ajax({
			 url 	: idCheckURL
			,type	: reqType
			,data	: dataParam
			,success: whenSuccess
			,error	: whenError
		});
		
		function whenSuccess(resData) {
			console.log("resData >>> : " + resData);
			
			if ("ID_YES" == resData) {
				
				alert("아이디 사용 가능 : ID_YES");
				console.log("아이디 사용 가능 : ID_YES");
				
				$('#mid').attr('readonly', true);
				$('#mpw').focus();
				$('#midBtn').attr('disabled', true);
				
			}else if("ID_NO" == resData) {
				
				alert("아이디 사용 불가능 : ID_NO");
				console.log("아이디 사용 불가능 : ID_NO");
				
				$('#mid').val('');
				$('#mid').focus();
			}
		}	//	ajax 수행문
		
		function whenError() {
			alert("에러 발생, 콘솔을 확인 해 주세요.");
			console.log("에러 발생 e >>> : " + e.responseText);
		}
		
	});	//	ID 아이디 중복 검사
	
	//	비밀번호 입력 확인
	$(document).on('click', '#mpw', function(){
		if ($('#mpw').prop('readonly') && $('#mpw_r_tr').prop('hidden')) {

			$('#mpw').attr('readonly', false);
			$('.mpw_td').each(function(){
				$(this).attr('rowspan', '2');
			});
			$('#mpw_r_tr').prop('hidden', false);
			$('#mpwBtn').attr('disabled', false);
			
			$('#mpw_r').val($('#mpw').val());
		}
	});
	
	//	비밀번호 확인
	$(document).on('click', '#mpwBtn', function(){
		alert("비밀번호 확인 중입니다.");
		
		let pw = $('#mpw').val();
		let pw_r = $('#mpw_r').val();
		
		
		if (pw == pw_r) {
			alert("비밀번호가 일치합니다.");
			
			$('#mpw_r').val('');
			
			$('#mpw').attr('readonly', true);
			$('.mpw_td').each(function(){
				$(this).attr('rowspan', '');
			});
			$('#mpw_r_tr').prop('hidden', true);
			$('#mpwBtn').attr('disabled', true);
			
			$('#mname').focus();
		} else {
			alert("비밀번호가 일치하지 않습니다.");
			
			$('#mpw').val('');
			$('#mpw_r').val('');
			$('#mpw').focus();
			
		}
	});	//	비밀번호 확인
	
	
	//	form 전송 버튼
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
		
		
		if (!$('#mid').prop('readonly')) {
			
			alert("아이디 중복 검사를 하지 않았습니다.");	//	아이디 중복 검사 여부를 알려줌
			$('#mid').focus();	//	아이디에 커서 올려줌
			
		}
		
		if (!$('#mpw').prop('readonly')) {
			
			alert("비밀번호 검사를 하지 않았습니다.");	//	비밀번호 완료를 확인함
			$('#mpw_r').focus();	//	비번 확인 란에 커서 올려줌
			
		}
		
		if (cnt != 0) {	//	NOT NULL항목중 null이 있었을 경우
			
			alert("미작성 한 필수 입력 항목이 " + cnt + "개 있습니다. 마저 작성해주세요.");	//	미작성 항목 수를 알려줌
			thisNull.focus();	//	미작성 한 것 중 가장 앞에 커서를 올려둠
			
		//	NOT NULL 데이터 NULL 체크			=====================
			
		}
		
		//	아이디 중복 검사  & 비밀번호 확인 & 필수작성항목 전부 작성시
		if (cnt == 0 && $('#mid').prop('readonly') && $('#mpw').prop('readonly')){
			
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
		
	});	//	form 전송 버튼
	
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
		<input type="button" id="testID" name="testID" value="ㅌㅅㅌ">
	</td>
</tr>
<!-- mpw 비밀번호 -->
<tr>
	<td class="mpw_td" rowspan='2'>
		PW
	</td>
	<td>
		<input type="text" id="mpw" name="mpw" class="notNull">
	</td>
	<td class="mpw_td" rowspan='2'>
		<input type="button" id="mpwBtn" name="mpwBtn" value="비밀번호 확인">
	</td>
</tr>
<tr id="mpw_r_tr">
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