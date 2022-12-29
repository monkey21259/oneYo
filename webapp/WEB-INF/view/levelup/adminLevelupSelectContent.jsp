<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.levelup.vo.LevelupVO" %>
<%

	List<LevelupVO> list = (List<LevelupVO>)request.getAttribute("list");
	
	LevelupVO lvo = list.get(0);

	String mnick = (String)request.getAttribute("mnick");


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#nopeBtn").click(function(){
			
			let result = confirm('등업을 거부하시겠습니까?');
			if(result == true){
			
			$("#levelupForm").attr({
				"action":"levelupNope.ict",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
			alert("등업이 거부되었습니다.");
			
			}else{
				alert("취소되었습니다.");
			}
		});
		
		
		$("#okeyBtn").click(function(){
			
			let result = confirm('등업을 승인하시겠습니까?');
			if(result == true){
			
			$("#levelupForm").attr({
				"action":"levelupOkey.ict",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"		
			}).submit();
				
			alert("등업이 승인되었습니다.");
			
			}else{
				alert("취소되었습니다.");
			}	
		});
		
	});



</script>
<style type="text/css">
	@font-face{
		src:url(/jshSpring/font/EF_Diary.ttf);
		font-family: "EF_Diary";
	}

	body{
   background-color:#e6e6e6;
   color: #0c186d;
   font-family:EF_Diary;
   }
   #hi{
   	  border:20px solid white;
      border-radius: 20px;
      background-color:white;
      box-shadow: 2px 2px 10px black;
      width:900px;
  
 }
 
 #rbwritediv{
 		border-radius: 20px;
 		background-color:white;
 		font-family:EF_Diary;		 
 		color: #0c186d;
		margin: 0 auto; 		
		border:10px solid white;
		box-shadow: 2px 2px 10px black;
		width:900px;
	}	
	
	 .btns{
      border: 2px solid #0c186d;
      border-radius: 5px;
      background-color: white;
      color: #0c186d;
      font-weight: bold;
      padding:0px 10px;
   }
</style>
</head>
<body>
<br>
<h1 align="center">등업</h1>

<form name="levelupForm" id="levelupForm">
<table id="hi" align="center">
	<tr>
		<td>제목</td>
		<td colspan="4" style="text-align:left; width:400;">
			<font size="4" style="color:black"><%= lvo.getLvsubject() %></font>
		</td>
		<td class="td_2"> 작성일자 :<%= lvo.getInsertdate() %>
		</td>
		</tr>
		<tr>
			<input type="hidden" name="lvnum" value="<%=lvo.getLvnum() %>">
			<input type="hidden" name="mnum" value="<%=lvo.getMnum() %>">
			<td>작성자</td>
			<td><%= mnick %></td>
		</tr>
		<tr>
			<td colspan="6" style="text-align:left">
			<img src="/oneYo/img/levelup/<%=lvo.getLvphoto() %>" border="1" width="100" height="100" alt="image"><br>
			</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align:left" >
			<span name="kbcontent" id="kbcontent" rows="5" cols="100"><%= lvo.getLvcontent() %></span>
			</td>
		</tr>		
</tr>
<tr>
<td colspan="6" align="center">
<br><br>
<button type="button" class="btns" id="nopeBtn">거부</button>
<button type="button" class="btns" id="okeyBtn">승인</button>
</td>				
</tr>
</table>
</form>

</body>
</html>