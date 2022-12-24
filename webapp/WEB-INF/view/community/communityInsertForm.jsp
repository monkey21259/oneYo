<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>커뮤니티 게시판 글쓰기</title>
		<!-- 제이쿼리cdn -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">		
		$(document).ready(function(){
			console.log("cphoto >>> : " + cphoto);
			
			$(document).on("click","#communityInsertbBtn", function(){
				var csubject = $("#csubject").val();
				console.log("csubject" + csubject);
				if(csubject !=null && csubject.length > 0 && typeof csubject !="undefinded"){		
						alert("글쓰기 버튼 클릭 >>> : ");
						$("#communityForm").attr({
								"action":"communityInsert.ict",
								"method":"POST",
								"enctype":"multipart/form-data"	
						}).submit();
				}else {
					alert("제목을 입력하세요!");
				}
				
			}); //communityInsertbBtn
		}); //ready

</script>
	</head>
	<body>
		<h3>커뮤니티 게시판 글쓰기</h3>
		<hr>
			<form name="communityForm" id="communityForm">
				<table> 
				<tr>
					<td>제목</td>
					<td><input type="text" id="csubject" name="csubject"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea id="ccontent" name="ccontent" rows="10" cols="60"></textarea></td>
				</tr>
				<tr>
					<td>사진</td>
					<td><input type="file" id="cphoto" name="cphoto"></td>
				</tr>
				</table>
			
			<button type="button" id="communityInsertbBtn" name="communityInsertbBtn">글쓰기</button>
		
		</form>
	</body>
</html>