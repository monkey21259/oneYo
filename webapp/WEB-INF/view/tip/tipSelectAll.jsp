<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.tip.vo.TipVO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("tipSelectAll.jsp 페이지 진입");
	List<TipVO> list = null;
	TipVO tvo = null;
	
	if(request.getAttribute("list") !=null) {
		list = (List<TipVO>)request.getAttribute("list");
		if(list !=null && list.size() > 0) {
			for(int i=0; i < list.size(); i++) {
				tvo = list.get(i);
				logger.info("VO : " + tvo.toString());
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){		
		console.log("tipSelectAll.jsp 페이지 진입");
		
		$(document).on("click", ".tsubject", function(){
			let tnum = $(this).children(1).val();
			console.log("tsubject : " + tsubject);
			
			location.href = "tipSelectContent.ict?tnum=" + tsubject;
			
			<%--
			$("#tipSelectAllForm").attr({
				"action": "#tipSelectContent.ict",
				"method": "GET"
			}).submit();
			--%>
		});
		
		$(document).on("click", ".tcontent", function(){
			let tnum = $(this).children(1).val();
			console.log("tcontent : " + tcontent);
			
			location.href = "tipSelectContent.ict?tnum=" + tcontent;
		});
	});
	
</script>
</head>
<body>
<form id="tipSelectAllForm">
<table>
	<thead>
		<tr>
			<th>글 번호</th>
			<th>글 제목</th>
			<th>글 내용</th>
			<th>글 조회수</th>
			<th>작성자</th>
			<th>등록일</th>
		</tr>
	</thead>
	<tbody>
<% 
	for(int i=0; i < list.size(); i++) {
		tvo = list.get(i);
%>
		<tr>
			<td>
				<%= tvo.getTipnum() %>
			</td>
			<td class="tsubject">
				<%= tvo.getTsubject() %>
				<input type="hidden" class="tnum" name="tnum" value="<%= tvo.getTnum() %>">
			</td>
			<td class="tcontent">
				<%= tvo.getTcontent() %>
				<input type="hidden" class="tnum" name="tnum" value="<%= tvo.getTnum() %>">
			</td>
			<td>
				<%= tvo.getThit() %>
			</td>
			<td>
				<%= tvo.getMnick() %>
			</td>
			<td>
				<%= tvo.getInsertdate() %>
			</td>
		</tr>
<%
	}
%>
	</tbody>
</table>
</form>
</body>
</html>