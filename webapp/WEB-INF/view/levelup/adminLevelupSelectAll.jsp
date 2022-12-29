<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.levelup.vo.LevelupVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(".content").click(function(){
			
			
			let info = $(this).siblings();
			console.log(info);
			
			let mnum = info.get(1).value;
			let mnick = info.get(0).value;
			
			console.log(mnum);
			console.log(mnick);
			
			location.href="adminLevelupSelectContent.ict?mnick="+mnick+"&mnum="+mnum;
		});
		
		
		
		
	});
	









</script>

</head>
<body>
<form id="adminForm" name="adminForm">
<!-- 등업  -->	

	<h3>등업</h3>
		<hr>
		<button type="button" id="levelupmoreBtn" style="float: right;">더보기</button><br>
			<table border="1 solid">
			
					<tr>
						<td>NO</td>
						<td>등업번호</td>
						<td>등업제목</td>
						<td>등업사진</td>
						<td>등업신청자</td>
						<td>등업신청일</td> <!-- 작성일 -->
						<td>등업처리여부</td>						
					</tr>					
				
<%
 			
				List<LevelupVO> list = (List<LevelupVO>)request.getAttribute("list");

				String process = null;
				if(list.size() > 0){
				for(int i=0; i<list.size(); i++){
					LevelupVO lvo = list.get(i);
					
					
					if(lvo.getProcessyn().equals("0")){
						process = "대기 중";
					};
%>
			
						
					<tr>
						<input type="hidden" value="<%= lvo.getMnick()%>" id="mnick">
						<input type="hidden" value="<%= lvo.getMnum()%>" id="mnum">
						<td><%= i+1 %></td>
						<td><%= lvo.getLvnum()%></td>
						<td class="content"><%= lvo.getLvsubject()%></td>
						<td><img src="oneYo/img/levelup/<%= lvo.getLvphoto()%>"></td>
						<td><%= lvo.getMnick()%></td> <!-- 닉네임 -->
						<td><%= lvo.getInsertdate()%></td>
						<td><%= process%></td>
					</tr>
				
				<%
				} //for
 			} //if				
				%>
			</table>
</body>
</html>