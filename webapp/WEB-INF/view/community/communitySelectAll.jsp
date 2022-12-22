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
<%
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;
%>

<!DOCTYPE html> 
<html>
	<head>
		<meta charset="UTF-8">
		<title>CommunitySelectAll.jsp</title>
	</head>
<<<<<<< HEAD
	<body>
	<h3>커뮤니티 게시판</h3>
	<hr>
	<div>
		<div>
			<button type="button">인기글</button>
		</div>
		
		<div>
			<button type="button">글 등록 </button>
		</div>
	</div>
=======
	<body>
	<button type="button">글 등록</button>


>>>>>>> branch 'main' of https://github.com/monkey21259/oneYo.git
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
			if(obj == null){return; }
			List<CommunityVO> listAll = (List<CommunityVO>)obj;	
		
			CommunityVO cvo = null;
		
			if(listAll.size() > 0){
				for(int i=0; i<listAll.size(); i++){ 
					cvo = listAll.get(i);
		%>
				<tbody>
					<tr>
						<td><%= i + 1 %></td>
						<td><%= cvo.getCsubject() %></td>
						<td><%= cvo.getMnick() %></td>
						<td><%= cvo.getChit() %></td>
						<td><%= 1 %></td>                 <!-- 나중에 추가하기 -->
						<td><%= cvo.getInsertdate()%></td>
					</tr>
				<%
				} //for
				%>	
				<%
				//페이징 세팅
				//model.addAttribute("pagingCVO", cvo);
				Object obj_p = request.getAttribute("pagingCVO");
				CommunityVO pagingCPVO = (CommunityVO)obj_p;
				
				pageSize = Integer.parseInt(pagingCPVO.getPageSize());
				logger.info("pageSize >>> : " + pageSize );
				
				groupSize = Integer.parseInt(pagingCPVO.getGroupSize());
				logger.info("groupSize >>> : " + groupSize );
				
				curPage = Integer.parseInt(pagingCPVO.getCurPage());
				logger.info("curPage >>> : " + curPage );
				
				logger.info("cvo.getTotalCount() >>>>>>>>>>>>>>> : " + cvo.getTotalCount());
				totalCount = Integer.parseInt(cvo.getTotalCount());
				logger.info("totalCount >>> : " + totalCount );
				
				%>
				<tr>
				<td colspan="6">
				<jsp:include page="communityPaging.jsp" flush="true">
					<jsp:param name="url" value="communitySelectAll.ict" />
					<jsp:param name="pageSize" value="<%=pageSize %>" />
					<jsp:param name="groupSize" value="<%=groupSize %>" />
					<jsp:param name="curPage" value="<%=curPage %>"/>
					<jsp:param name="totalCount" value="<%=totalCount %>"/>
					</jsp:include>
				</td>
			</tr>
			<%
			}//if
			%>
				</tbody>	
	
			</table>
		</form>
	</body>
</html>