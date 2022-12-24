<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>    
<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunityUpdate 진입 >>> : "); 
%>     
<%
	//	model.addAttribute("communityUpdate", _cvo);
	Object obj = request.getAttribute("communityUpdate");
	if (obj == null){ return; }
	
	CommunityVO cvo = (CommunityVO)obj;

	logger.info("csubject >>>>>>>>>>>>> : " + cvo.getCsubject());
	logger.info("ccontent >>>>>>>>>>>>> : " + cvo.getCcontent());
	logger.info("cphoto >>>>>>>>>>>>> : " + cvo.getCphoto());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>communityUpdate</title>
</head>
<body>
	<script type="text/javascript">
		alert("글이 수정되었습니다.");
		location.href="communitySelectContent.ict?cnum=<%= cvo.getCnum()%>";
	</script>
</body>
</html>