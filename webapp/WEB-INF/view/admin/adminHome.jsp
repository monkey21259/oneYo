<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="java.util.List" %>

<%@ page import="main.ict.warning.vo.WarningVO" %>




<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunitySelectAll 진입 >>> : "); 
%>    
<%

//신고 : model.addAttribute("adminWarningSelectAll", list);
	Object obj = request.getAttribute("adminWarningSelectAll");
		if(obj == null){return; }
		List<WarningVO> list = (List<WarningVO>)obj;
		
		WarningVO wvo = null;
		
		logger.info("신고글 갯수 >>> : " + list.size());

%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head> 
	<body>
	<div class="container">
	<form id="adminForm" name="adminForm">
<!-- 등업  -->	

	<h3>등업</h3>
		<hr>
		
			<table border="1 solid">
				<thead>
					<tr>
						<th>NO</th>
						<th>등업번호</th>
						<th>등업제목</th>
						<th>등업사진</th>
						<th>등업신청자</th> <!-- 회원이름 -->
						<th>등업신청일</th> <!-- 작성일 -->
						<th>등업처리여부</th>						
					</tr>					
				</thead>
				
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			
<!-- 신고  -->	
	<h3>신고</h3>
		<hr>
			<table border="1 solid">
				<thead>
					<tr>
						<th>NO</th>
						<th>신고글번호</th> <!-- 신고당한 글번호 -->
						<th>신고글제목</th> <!-- 신고당한 글제목 -->
						<th>신고분야</th>
						<th>신고내용</th>
						<th>신고날짜</th> 
					</tr>					
				</thead>
<%
			if(list.size() > 0){
				for(int i=0; i<list.size(); i++){
					wvo = list.get(i);
					
%>
				<tbody>
					<tr>
						<td><%= wvo.getWtnum() %></td>
						<td><% %></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
<%
				} //for
			}//if
%>
				</tbody>
			</table>
						
<!-- 레시피  -->	
	<h3>레시피</h3>
		<hr>
			<table border="1 solid">
				<thead>
					<tr>
						<th>NO</th>
						<th>요리분야</th>
						<th>작성자</th>
						<th>제목</th>
						<th>사진</th>
						<th>조회수</th>
						<th>등록일</th>
						<th>신고</th>
					</tr>					
				</thead>
				
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			
<!-- 전문가팁 -->	
		
	<h3>전문가팁</h3>
		<hr>
			<table border="1 solid">
				<thead>
					<tr>
						<th>NO</th>
						<th>팁분야</th>
						<th>작성자</th>
						<th>제목</th>
						<th>사진</th>
						<th>조회수</th>
						<th>등록일</th>
						<th>신고</th>
					</tr>					
				</thead>
					
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			
<!-- 커뮤니티 -->	
	<h3>커뮤니티</h3>
		<hr>
			<table border="1 solid">
				<thead>
					<tr>
						<th>NO</th>
						<th>작성자</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>신고</th>
					</tr>					
				</thead>
					
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			
		<div>
			<button type="button">공지사항</button>
			<button type="button">회원목록</button>
		</div>	
		
		</form>
		</div>
	</body>
</html>