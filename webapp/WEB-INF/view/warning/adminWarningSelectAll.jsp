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
	
	//content로 전송
		$(".warningSelect").click(function(){
			
				let info = $(this).siblings();
				let info0 = info.get(0).value;
				let info1 = info.get(1).value;
				let info2 = info.get(2).value;
				let info3 = info.get(3).value;
				let info4 = info.get(4).value;
			
				console.log(info0);
				console.log(info1);
				console.log(info2);
				console.log(info3);
				console.log(info4);
				
				$("#wtnum").val(info0);
				$("#wcategory").val(info1);
				$("#wcontent").val(info2);
				$("#mnick").val(info3);
				$("#insertdate").val(info4);
				
			$("#adminWarningSelectAll").attr({
				'action':'adminWarningSelectContent.ict',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
			
		}); //warningSelect 클릭
	});	//ready
	
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
						<input type="hidden" name="wtnum1" value="<%= wvo.getWtnum() %>">
						<input type="hidden" name="wcategory1" value="<%=wvo.getWcategory()%>">
						<input type="hidden" name="wcontent1" value="<%= wvo.getWcontent() %>">
						<input type="hidden" name="mnick1" value="<%= wvo.getMnick()%>">
						<input type="hidden" name="insertdate1" value="<%= wvo.getInsertdate()%>">
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
			<input type="hidden" id="wtnum" name="wtnum" value="">
			<input type="hidden" id="wcategory" name="wcategory" value="">
			<input type="hidden" id="wcontent" name="wcontent" value="">
			<input type="hidden" id="mnick" name="mnick" value="">
			<input type="hidden" id="insertdate" name="insertdate" value="">
		</form>
	</body>
</html>