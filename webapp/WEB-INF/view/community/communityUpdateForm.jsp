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
	//model.addAttribute("listU", listU);
	Object obj = request.getAttribute("listU");
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
<title>커뮤니티 게시글 수정</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			alert("게시글조회 자바스크립트");
			$(document).ready(function(){
				alert("게시글조회 제이쿼리");
				
		</script>
</head>
<body>
<h3>게시글 보기</h3>
	<hr>
	
		<form id="communitySelectContent" name="communitySelectContent">
			<input type="hidden" id="cnum" name="cnum" value="<%= _cvo.getCnum() %>">
			<table border="1 solid">
			<tr>
					<td>제목</td>
					<td>
						<input type="text" id="csubject" name="csubject" value="<%= _cvo.getCsubject() %>">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea id="ccontent" name="ccontent" value="<%= _cvo.getCcontent()%>" rows="10" cols="60"></textarea></td>
				</tr>
				<tr>
					<td>사진</td>
					<td>
						<img src="/oneYo/img/community/<%= _cvo.getCphoto()%>">
<%-- 						<input type="hidden" id="nphoto1" name="nphoto1" value="<%= _cvo.getCphoto()%>"> --%>
						<input type="file" id="cphoto" name="cphoto">
					</td>
				</tr>
					<tr>
						<td colspan="2">
							<button type="button" id="communityUpdate">수정</button>
							<button type="button" id="communityDelete">삭제</button>
						</td>
					</tr>
			</table>
		</form>
</body>
</html>