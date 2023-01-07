<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<table border="1">
<tr><td>
<h3 align="center">신고하기</h3>
</td></tr>
<tr><td>
<select name="wcategory">
<option>선택하세요 </option>
<option value="00">욕설 및 비방 </option>
<option value="01">음란물</option>
<option value="02">불법광고</option>
<option value="03">도배성</option>
<option value="04">주제와 맞지 않음 </option>
<option value="99">기타</option>
</select>
</td></tr>
<tr><td>
<select id="wc" name="wc">
<option value="99">선택하세요 </option>
<option value="00">레시피 </option>
<option value="01">전문가 팁</option>
<option value="02">커뮤니티</option>
</select>
</td></tr>
<tr><td>
<div id="subject" name="subject">
<select id="sub" name="wtnum">
<option>선택하세요</option>
</select>
</div>
</td></tr>
<tr><td>
<textarea rows="30" cols="80" name="wcontent"></textarea>
</td></tr>
<tr><td colspan="2">
<input type="button" id="datain" value="신고">
<input type="reset" value="다시쓰기">
</td></tr>
</table>
</form>


</body>
</html>