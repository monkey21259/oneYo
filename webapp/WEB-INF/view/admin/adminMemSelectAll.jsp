<%@page import="main.ict.common.CodeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="java.util.List" %>

<%@ page import="main.ict.mem.vo.MemVO" %>
<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("회원목록(adminMemSelectAll) 진입 >>> : "); 
%>        
<%
	//model.addAttribute("adminMemSelectAll", list);
	Object obj = request.getAttribute("adminMemSelectAll");
	if(obj == null){return; }
	
	List<MemVO> list = (List<MemVO>)obj;
	//vo호출
	MemVO mvo = null;
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
		<!-- 제이쿼리cdn -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				alert("제이쿼리");
				
// 				$(document).on("click", "#deleteBtn", function(){
					
					
					
					
// 				}); //deleteBtn
				
			}); //ready
		</script>
		
</head>
<body>
	<h3>회원목록</h3>
		<hr>
			<table border="1 solid">
				<thead>
					<tr>
						<th>NO</th>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>회원등급</th>
						<th>프로필사진</th>
						<th>관심요리분야</th>
						<th>경고횟수</th>
						<th>등록일</th>
						<th>탈퇴</th>
					</tr>					
				</thead>
<%
			if(list.size() > 0){
				for(int i=0; i<list.size(); i++){
						mvo = list.get(i);
					
%>				
				<tbody>
					<tr>
						<td><%= mvo.getMemnum() %></td>
						<td><%= mvo.getMid() %></td>
						<td><%= mvo.getMname() %></td>
						<td><%= mvo.getMnick() %></td>
						<td><%= mvo.getMemail() %></td>
						<td><%= CodeUtils.getMgradeVal(mvo.getMgrade()) %></td>
						<td><img src="/oneYo/img/mem/<%= mvo.getMprofile() %>" style="width:50px; height:50px;"></td>
						<td><%= CodeUtils.getMCategorys(mvo.getMcategory()) %></td>
						<td><%= mvo.getMwarning() %></td>
						<td><%= mvo.getInsertdate() %></td>
						<td><button type="button" id="deleteBtn">탈퇴</button></td>
					</tr>
				</tbody>
<%
				}//for
			}//if
%>
			</table>
		
</body>
</html>