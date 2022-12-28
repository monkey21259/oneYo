<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.levelup.vo.LevelupVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="adminForm" name="adminForm">
<!-- 등업  -->	

	<h3>등업</h3>
		<hr>
		<button type="button" id="levelupmoreBtn" style="float: right;">더보기</button><br>
			<table border="1 solid">
				<thead>
					<tr>
						<th>NO</th>
						<th>등업번호</th>
						<th>등업제목</th>
						<th>등업사진</th>
						<th>등업신청자</th>
						<th>등업신청일</th> <!-- 작성일 -->
						<th>등업처리여부</th>						
					</tr>					
				</thead>
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
				<tbody>
					<tr>
						<td><%= i+1 %></td>
						<td><%= lvo.getLvnum()%></td>
						<td><%= lvo.getLvsubject()%></td>
						<td><img src="oneYo/img/levelup/<%= lvo.getLvphoto()%>"></td>
						<td><%= lvo.getMnick()%></td> <!-- 닉네임 -->
						<td><%= lvo.getInsertdate()%></td>
						<td><%= process%></td>
					</tr>
				</tbody>
				<%
				} //for
 			} //if				
				%>
			</table>
</body>
</html>