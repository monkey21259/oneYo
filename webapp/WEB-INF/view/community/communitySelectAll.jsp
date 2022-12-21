<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>

<%
	request.setCharacterEncoding("UTF-8");

	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunitySelectAll 진입 >>> : "); 
%>

<!DOCTYPE html> 
<html>
	<head>
		<meta charset="UTF-8">
		<title>CommunitySelectAll.jsp</title>
	</head>
	<body>
	<button type="button">글 등록</button>
		<form>
			<table>
				<thead>
					<tr>
						<th>NO</th>
						<th>글제목</th>
						<th>닉네임</th>
						<th>조회수</th>
						<th>좋아요</th>
						<th>날짜</th>
					</tr>
				</thead>
		<%
		
		//	model.addAttribute("listAll", listAll);
		Object obj = request.getAttribute("listAll");
		
			List<CommunityVO> listAll = (List<CommunityVO>)obj;
			
				for(int i=0; i<listAll.size(); i++){ 
					CommunityVO cvo = listAll.get(i);
		%>
			
				<tbody>
					<tr>
						<td><%= cvo.getRow_num() %></td>
						<td><%= cvo.getCsubject() %></td>
						<td><%= cvo.getMnick() %></td>
						<td><%= cvo.getChit() %></td>
						<td><%= 1 %></td>                 <!-- 나중에 추가하기 -->
						<td><%= cvo.getInsertdate()%></td>
					</tr>
				<%
					} //for
				%>
					
				</tbody>
	
	
			</table>
		</form>
	</body>
</html>