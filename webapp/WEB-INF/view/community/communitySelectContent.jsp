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
	
	CommunityVO _cvo = null;
	
	if(nCnt == 1){
		_cvo = list.get(0);
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

			//update
				$(document).on("click", "#communityUpdate", function(){
					alert("수정버튼클릭");
					$("#communitySelectContent").attr({
						"action":"communityUpdateForm.ict",			
						"method":"GET",
						"enctype":"application/x-www=form=urlencoded"
						
					}).submit();
					
				}); //update
				
// 			//delete
// 				$(document).on("click", "#communityDelete", function(){
// 					alert("삭제버튼클릭");
					
					
// 				}); //delete
 			}); //ready
		
		</script>
	</head>
	<body>
	<h3>게시글 보기</h3>
	<hr>
	
		<form id="communitySelectContent" name="communitySelectContent">
			<input type="hidden" id="cnum" name="cnum" value="<%= _cvo.getCnum() %>">
			<table>
				<div>
					<tr>
						<td>글제목</td>
						<td colspan="2"><%=_cvo.getCsubject() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= _cvo.getMnick()%></td>
					</tr>
					<tr>
						<td>작성시간</td>
						<td colspan="2"><%= _cvo.getUpdatedate()%></td>
					</tr>
				</div>
				
				<div>
					<tr>
						<td>좋아요</td>
						<td>조회수</td>
						<td><button type="button" id="warning">신고</button></td>
					</tr>
					
					<tr>
						<td colspan="3">글내용</td>
					</tr>	
					<tr>
						<td>
							<img src="/oneYo/img/community/<%=_cvo.getCphoto()%>"></td>
							<td colspan="2"><%= _cvo.getCcontent() %></td>
						
					</tr>
					<tr>
						<td colspan="3">
							<button type="button" id="communityUpdate">수정</button>
							<button type="button" id="communityDelete">삭제</button>
						</td>
					</tr>
				</div>
			</table>
		</form>
	</body>
</html>