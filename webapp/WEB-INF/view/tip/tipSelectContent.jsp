<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.tip.vo.TipVO" %>
<%@ page import="main.ict.common.ConstPack" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("tipSelectContent.jsp 페이지 진입");
	TipVO tvo = null;
	
	
	if(request.getAttribute("list") !=null) {
		List<TipVO> list = (List<TipVO>)request.getAttribute("list");
		if(list !=null && list.size() == 1) {
			tvo = list.get(0);
			logger.info("tvo : \n" + tvo.toString());
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
		
		console.log("tipSelectContent.jsp 페이지 진입");
		
		$(document).on("click", "#updateBtn", function(){
			if(confirm("수정 페이지로 이동하시겠습니까?")){
				$("#tipSelectContentForm").attr({
					'action': 'tipUpdateForm.ict',
					'method': 'GET'
				}).submit();
			}
		});
		
		$(document).on("click", "#deleteBtn", function(){
			if(confirm("글을 삭제하시겠습니까?")){
				$("#tipSelectContentForm").attr({
					'action': 'tipDelete.ict',
					'method': 'GET'
				}).submit();
			}
		});
		
	});

</script>
<style type="text/css">

	#container {
		text-align: center;
	}
	
	#tip_area {
		display: inlineblock;
	}

</style>
</head>
<body>
<div id="container">
	<div id="tip_area">
		<div id="subject">
			제목 : <%= tvo.getTsubject() %>
		</div>
		<form id="tipSelectContentForm">
			<input id="tnum" name="tnum" type="hidden" value="<%= tvo.getTnum() %>">
			<div id="content">사진 : 
				<img src="/oneYo/img/tip/<%= tvo.getTphoto() %>">
				<br>
				내용 : <%= tvo.getTcontent() %>
				<br>
				좋아요 : <%= tvo.getLikecnt() %>
				<br>
				조회수 : <%= tvo.getThit() %>
				<br>
				카테고리 : <%= tvo.getTcategory() %>
				<br>
				작성일 : <%= tvo.getInsertdate() %>
				<br>
				작성자 : <%= tvo.getMnick() %>
				<br>
				<input id="updateBtn" type="button" value="수정">
				<input id="deleteBtn" type="button" value="삭제">
			</div>
		</form>
		<jsp:include page="/WEB-INF/view/comment/commentForm.jsp" flush="true">
			<jsp:param name="cotnum" value="<%=tvo.getTnum() %>"/>
		</jsp:include>
	</div>
</div>
</body>
</html>