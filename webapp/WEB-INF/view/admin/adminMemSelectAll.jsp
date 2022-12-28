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
						
				$(document).on("click", ".deleteBtn", function(){
					
					let info = $(this).parent().find(".mid");
					//let info = $(this).siblings();
					console.log("info >>> : " + info);
					let mid = info.get(0).value;
					console.log("mid >>> : " + mid);
					
					let result = confirm(mid + '님을 탈퇴 하시겠습니까? ')
					if(result == true){
					
					let url = "memDelete.ict";
					let reqType= "GET";
					let dataParam ={
							
							mid : info.get(0).value,
					};
					
					console.log("url : " + url);
					console.log("reqType : " + reqType);
					console.log("dataParam : " + dataParam);
					
					$.ajax({
						
						url:url,
						type:reqType,
						data:dataParam,
						success:whenSuccess,
						error:whenError		
						
					}); //ajax
				}else{
					alert("취소되었습니다");
				}
					
					
				function whenSuccess(resData){
							if(resData == 'deleteOK'){
								alert("탈퇴되었습니다.");
							} 
						
					} //sucess
					
				function whenError(e){
					console("탈퇴실패 >>> : "  + e.responseText);
				} //whenError	
				
					
				}); //deleteBtn
				
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
						
						<td class="info"><%= mvo.getMemnum() %></td>
						<td><%= mvo.getMid() %></td>
						<td><%= mvo.getMname() %></td>
						<td><%= mvo.getMnick() %></td>
						<td><%= mvo.getMemail() %></td>
						<td><%= CodeUtils.getMgradeVal(mvo.getMgrade()) %></td>
						<td><img src="/oneYo/img/mem/<%= mvo.getMprofile() %>" style="width:50px; height:50px;"></td>
						<td><%= CodeUtils.getAdminRcate(mvo.getMcategory()) %></td>
						<td><%= mvo.getMwarning() %></td>
						<td><%= mvo.getInsertdate() %></td>
						<td class="delBtn">
							<input type="hidden" class="mid" value="<%= mvo.getMid() %>" />
							<button type="button" class="deleteBtn">탈퇴</button>
						</td>
					</tr>
				</tbody>
<%
				}//for
			}//if
%>
			</table>
		
</body>
</html>