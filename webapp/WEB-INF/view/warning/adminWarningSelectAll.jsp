<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.warning.vo.WarningVO" %>

<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("adminWarningSelectAll 진입 >>> : "); 
%>
<%
	//model.addAttribute("listAll", listAll)
	Object obj = request.getAttribute("listAll");
			if(obj == null){return; }
			List<WarningVO> listAll = (List<WarningVO>)obj;	
		
			WarningVO wvo = null;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0
						maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<title>신고글조회</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
		
	$(document).ready(function(){
		
		$(".warningSelect").click(function(){
			
				
			$("#adminWarningSelectAll").attr({
				'action':'adminWarningSelectContent.ict',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
			
		});
		
		
	});		
		
		
</script>
	</head>
	<body>
	
		<form id="adminWarningSelectAll" name="adminWarningSelectAll">
			<table border="1 solid">
				<thead>
					<tr>
						<th>NO</th>
						<th>신고글번호</th> <!-- 신고당한 글번호 -->
						<th>신고분야</th>
						<th>신고내용</th>
						<th>신고자</th>
						<th>신고날짜</th> 
					</tr>					
				</thead>
	<%

			if(listAll.size() > 0){
				for(int i=0; i<listAll.size(); i++){ 
					wvo = listAll.get(i);
						
	%>
				<tbody>
					<tr>
						<input type="hidden" name="wtnum" value="<%= wvo.getWtnum() %>">
						<input type="hidden" name="wcategory" value="<%=wvo.getWcategory()%>">
						<input type="hidden" name="wcontent" value="<%= wvo.getWcontent() %>">
						<input type="hidden" name="mnick" value="<%= wvo.getMnick()%>">
						<input type="hidden" name="insertdate" value="<%= wvo.getInsertdate()%>">
						<td><%= wvo.getWarningnum() %></td>
						<td><%= wvo.getWtnum() %></td>
						<td><%= CodeUtils.getWcategory(wvo.getWcategory())%></td>
						<td class="warningSelect"><%= wvo.getWcontent() %></td>
						<!--  -->
						<td><%= wvo.getMnick()%></td> <!-- 신고자 닉네임 -->
						<td><%= wvo.getInsertdate()%></td> <!-- 등록일 -->
					</tr>
<%
				} //for
			}//if
%>
				</tbody>
			</table>
		</form>
	</body>
</html>