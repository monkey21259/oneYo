<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.ict.mem.vo.MemVO" %>
<%@ page import="main.ict.common.CodeUtils" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ profileSelect.jsp ~~");
%>

<%
Object obj = null;
obj = request.getAttribute("list");

if (obj == null) return;

List<MemVO> list = null;
list = (List<MemVO>)obj;

if (list != null && list.size() > 0) {
	logger.info("list.size() >>> : " + list.size());
	
	for (int i = 0; i < list.size(); i++) {
		
		MemVO mvo = list.get(i);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profileSelect.jsp</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert("profileSelect.jsp");
	
	$(document).on('click', '.mprBtn', function(){
		alert("mprBtn");
	});	//	.mprBtn 프로필 버튼
	
	$(document).on('click', '.mgrBtn', function(){
		alert("mgrBtn");
	});	//	.mgrBtn 등업 버튼
	
	$(document).on('click', '.mpwBtn', function(){
		alert("mpwBtn");
	});	//	.mpwBtn 비번 변경 버튼
	
	$(document).on('click', '.memailBtn', function(){
		alert("memailBtn");
	});	//	.memailBtn 이메일 버튼
	
	$(document).on('click', '.memBtn', function(){
		alert("memBtn");
	});	//	.memBtn 기타 버튼
});
</script>
</head>
<body>
profileSelect.jsp
<hr>
<div id="all_div">

<form id="profileSelect">


<table>
<!-- 프로필 -->
<tr>
	<td>
	닉네임
	</td>
	<td>
	<%= mvo.getMnick() %>
	</td>
	<td rowspan="2">
	<input type="button" class="mprBtn" value="사진 및 닉네임 변경">
	</td>
</tr>
<tr>
	<td>
	프로필 사진
	</td>
	<td>
	<img src="/oneYo/img/mem/<%= mvo.getMprofile() %>" width="150" height="150" alt="image">
	<br><%= mvo.getMprofile() %>
	</td>
</tr>
<tr>
	<td>
	등급
	</td>
	<td>
	<%= CodeUtils.getMgradeVal(mvo.getMgrade()) %>
	</td>
	<td>
	<input type="button" class="mgrBtn" value="등업 신청">
	</td>
</tr>
<!-- 인증절차? 필요?? -->
<tr>
	<td>
	비밀번호
	</td>
	<td>
	<%= mvo.getMpw() %>
	</td>
	<td>
	<input type="button" class="mpwBtn" value="비밀번호 변경">
	</td>
</tr>
<tr>
	<td>
	이메일
	</td>
	<td>
	<%= mvo.getMemail() %>
	</td>
	<td>
	<input type="button" class="memailBtn" value="이메일 변경">
	</td>
</tr>

<!-- 고정값 -->
<tr>
	<td>
	아이디
	</td>
	<td>
	<input type="hidden" id="mnum" name="mnum" value="<%= mvo.getMnum() %>">
	<%= mvo.getMid() %>
	</td>
	<td rowspan="4">
	<input type="button" class="memBtn" value="개인정보 수정">
	</td>
</tr>
<!-- 기타 -->
<tr>
	<td>
	이름
	</td>
	<td>
	<%= mvo.getMname() %>
	</td>
</tr>
<tr>
	<td>
	전화번호
	</td>
	<td>
	<%= mvo.getMhp() %>
	</td>
</tr>
<tr>
	<td>
	선호하는 요리분야
	</td>
	<td>
	<%= CodeUtils.getMCategorys(mvo.getMcategory()) %>
	</td>
</tr>

<!-- 유저 변경 불가능 -->
<tr>
	<td>
	경고 누적 횟수
	</td>
	<td>
	<%= mvo.getMwarning() %> 회
	</td>
</tr>
<tr>
	<td>
	가입일
	</td>
	<td>
	<%= mvo.getInsertdate() %>
	</td>
</tr>
<tr>
	<td>
	수정일
	</td>
	<td>
	<%= mvo.getUpdatedate() %>
	</td>
</tr>
</table>

</form>

</div>

<hr>
 MNUM<br>
<%= mvo.getMnum() %>
<hr>
,DELETEYN<br>
<%= mvo.getDeleteyn() %>
<hr>

<%
	}
}
%>
</body>
</html>