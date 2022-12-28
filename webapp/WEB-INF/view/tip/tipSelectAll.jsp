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
	
	TipVO pagingVO = null;
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;
	
	if(request.getAttribute("list") !=null) {
		list = (List<TipVO>)request.getAttribute("list");
		if(list !=null && list.size() > 0) {
			for(int i=0; i < list.size(); i++) {
				tvo = list.get(i);
				logger.info("VO : " + tvo.toString());
			}
		}
	}
	
	if(request.getAttribute("pagingVO") != null){
		pagingVO = (TipVO)request.getAttribute("pagingVO");
		pageSize = Integer.parseInt(pagingVO.getPageSize());
		groupSize = Integer.parseInt(pagingVO.getGroupSize());
		curPage = Integer.parseInt(pagingVO.getCurPage());
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
			console.log("tnum : " + tnum);
			
			location.href = "tipSelectContent.ict?tnum=" + tnum;
			
			<%--
			$("#tipSelectAllForm").attr({
				"action": "#tipSelectContent.ict",
				"method": "GET"
			}).submit();
			--%>
		});
		
		$(document).on("click", ".tcontent", function(){
			let tnum = $(this).children(1).val();
			console.log("tnum : " + tnum);
			
			location.href = "tipSelectContent.ict?tnum=" + tnum;
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
		
		totalCount = Integer.parseInt(tvo.getTotalCount());
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
		<tr>
			<td colspan="4">
				<jsp:include page="/WEB-INF/view/paging/paging.jsp" flush="true">
					<jsp:param value="tipSelectAll.ict" name="url"/>
						<jsp:param value="" name="str"/>
						<jsp:param value="<%=pageSize %>" name="pageSize"/>
						<jsp:param value="<%=groupSize %>" name="groupSize"/>
						<jsp:param value="<%=curPage %>" name="curPage"/>
						<jsp:param value="<%=totalCount %>" name="totalCount"/>
				</jsp:include>
			</td>
		</tr>
	</tbody>
</table>
</form>
</body>
</html>