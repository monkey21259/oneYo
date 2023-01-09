<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>oneYo(오내요)</title>
	
<meta name="viewport" content="width=device-width, initial-scale=1.0
						maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<!-- warningPage.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/warning/warningPage.css">		
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#wc").change(function(){
			
			$("#sub").text("");
			
			var value = $("#wc").val()
			
			console.log(value);
			if(value == null){return false;}
			
			
			let urL = "wcSelect.ict";
			let reqType = "GET";
			let dataParam={value : $("#wc").val(),};
			
			$.ajax({url:urL,
					type:reqType,
					data:dataParam,
					success:whenSuccess,
					error:whenError
					});
			
			function whenSuccess(data){
				
				data = data.split("&");
				for(let i=0; i < data.length; i++){
					let value = data[i].split("/");
				
					addSubject(value[0], value[1]);
				}
			
			}
			function whenError(e){
				
			}
		
		}); 	
		
		function addSubject(subject, number){
			
			
			var option = $("<option value=" + number + "/>");
			var subnum = subject;
			option.append(subnum);
		
			$("#sub").append(option);
		
		}

	$("#datain").click(function(){
		
		$("#submit").attr({
			"action":"warningInsert.ict",
			"method":"GET",
			"enctype":"application/x-www-form-urlencoded"
		}).submit();
		
		alert("신고 되었습니다");
	});
	
	
	});
	
</script>
</head>
<body>
<form id="submit" name="submit">


<!-- -------------------------------페이지 전용 center------------------------------- -->
	<div id="anne_w">
		<p id="subject_w">신고하기</p>
	</div>

<table class="table_fill_w">
	<tr>
		<td class="table_subject_w">신고분야</td>
		<td class="warning_subject_w">
			<select name="wcategory" class="warming_select">
				<option>선택하세요 </option>
				<option value="00">욕설 및 비방 </option>
				<option value="01">음란물</option>
				<option value="02">불법광고</option>
				<option value="03">도배성</option>
				<option value="04">주제와 맞지 않음 </option>
				<option value="99">기타</option>
			</select>
		</td>
	</tr>
	<tr>
	<td class="table_subject_w">카테고리</td>
		<td>
			<select id="wc" name="wc" class="warming_select">
				<option value="99">선택하세요 </option>
				<option value="00">레시피 </option>
				<option value="01">전문가 팁</option>
				<option value="02">커뮤니티</option>
			</select>
		</td>
	</tr>
	<tr>
	<td class="table_subject_w">제목</td>
		<td>
			<div id="subject_ww" name="subject_ww">
				<select id="sub" name="wtnum" class="warming_select">
					<option>선택하세요</option>
				</select>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="table_subject_w_content">신고할 내용</td>
	</tr>
	<tr>
		<td colspan="2">
		<textarea rows="30" cols="80" name="wcontent" placeholder="신고할 내용을 입력하여주세요."></textarea>
		</td>
	</tr>
	
</table>

<div id="buttontable_w">
	<input type="button" id="datain" class="btn_w" value="신고">
	<input type="reset" class="btn_w" value="다시쓰기">

</div>


</form>


</body>
</html>