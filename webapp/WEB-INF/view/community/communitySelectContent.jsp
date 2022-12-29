<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>

<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunitySelect 진입 >>> : "); 
%>    
<%
	//	model.addAttribute("listS", listS);
	Object obj = request.getAttribute("listS");
	if (obj == null){ return; }
	
	List<CommunityVO> list = (List<CommunityVO>)obj;
	int nCnt = list.size();
	logger.info("nCnt >>> : " + nCnt);
	
	CommunityVO cvo = null;
	
	if(nCnt == 1){
		cvo = list.get(0);
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>커뮤니티 게시글 조회</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
			//조회수 추가하기

			//수정
				$(document).on("click", "#communityUpdateBtn", function(){
					$("#communitySelectContent").attr({
						"action":"communityUpdateForm.ict",
						"method":"GET",
						"enctype":"application/x-www=form=urlencoded"
					}).submit();
					
				}); //Update

			//삭제
				$(document).on("click", "#communityDeleteBtn", function(){
					$("#communitySelectContent").attr({
						"action":"communityDelete.ict",
						"method":"GET",
						"enctype":"application/x-www=form=urlencoded"	
					}).submit();
				}); //delete
				
				
			//신고
				$(document).on("click", "#warning", function(){
						alert("삭제버튼클릭");
						$("#communitySelectContent").attr({
							"action":"communityWarningForm.ict",
							"method":"GET",
							"enctype":"application/x-www=form=urlencoded"	
						}).submit();
				}); //신고
				
 			}); //ready
		
		</script>
	</head>
	<body>
	<h3>게시글 보기</h3>
	<hr>
	
		<form id="communitySelectContent" name="communitySelectContent">
			<input type="hidden" id="cnum" name="cnum" value="<%= cvo.getCnum() %>">
			<table>
				<div>
					<tr>
						<td>글제목</td>
						<td colspan="2"><%=cvo.getCsubject() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= cvo.getMnick()%></td>
					</tr>
					<tr>
						<td>작성시간</td>
						<td colspan="2"><%= cvo.getInsertdate()%></td>
					</tr>
				</div>
				
				<div>
					<tr>
						<td><%= cvo.getLikecnt() %></td>
						<td>조회수</td>
						<td><button type="button" id="warning">신고</button></td>
					</tr>
					
					<tr>
						<td colspan="3">글내용</td>
					</tr>	
					<tr>
						<td>
							<img src="/oneYo/img/community/<%=cvo.getCphoto()%>">
							<input type="hidden" id="cphoto" name="cphoto" value="<%= cvo.getCphoto()%>"></td>
							<td colspan="2"><%= cvo.getCcontent() %></td>
						
					</tr>
					<tr>
						<td colspan="3">
							<button type="button" id="communityUpdateBtn">수정</button>
							<button type="button" id="communityDeleteBtn">삭제</button>
						</td>
					</tr>
				</div>
			</table>
		</form>
		<jsp:include page="/WEB-INF/view/comment/commentForm.jsp" flush="true">
			<jsp:param name="cotnum" value="<%=cvo.getCnum() %>"/>
		</jsp:include>
	</body>
</html>