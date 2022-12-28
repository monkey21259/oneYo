<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.ict.mem.vo.MemVO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = null;
	logger = LogManager.getLogger(this.getClass());
	
	logger.info("~~ profilePWUpdateForm.jsp ~~");
%>

<%
	String mkey = "";
	mkey = request.getParameter("mkey");
	
	logger.info("mkey >>> : " + mkey);
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
<title>profilePWUpdateForm.jsp</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert("profilePWUpdateForm.jsp");
	$('#reMpw').hide();	//	div 감추기 나중에 class와 css로 조작합니다ㅏㅏㅏ
	$('#newPW').hide();	//	div 감추기 나중에 class와 css로 조작합니다ㅏㅏㅏ
	
	var mpw_old = '<%= mvo.getMpw() %>';
	
	$(document).on('click', '.mpwBtn', function(){
		
		let chk = $('#mpw_old_r').prop('readonly');
		let mpw = $('#mpw').val();
		
		if (!chk) {	// 구 비밀번호 확인 안했을 시
			alert("test!! >>> " + chk);

			if (mpw_old == $('#mpw_old_r').val()) {
				alert("비밀번호 확인 성공");
				$('#reMpw').show();
				$('#reCheck').hide();
				$('#newPW').show();
				$('#textPW').hide();
				$('#mpw_old_r').prop('readonly', true);
				$('#mpwBtn').val("비밀번호 변경");
			}
			
		}else {	//	구 비밀번호 확인 이후
			
			if (mpw != null && mpw.length > 0 && mpw == $('#mpw_r').val()) {
				alert("새 비밀번호 확인 성공");
				$('#mpw').prop('readonly', true);
				$('#mpw_r').prop('readonly', true);
				
				alert("mkey >>> : " + $('#mkey').val());
				$('#profileUpdateForm').attr({
					 "action"	: "memUpdate.ict"
					,"method"	: "POST"
					,"enctype"	: "multipart/form-data"
				}).submit();
				
			}else {
				
				alert("새 비밀번호가 일치하지 않습니다.");
				
				$('#mpw').val('');
				$('#mpw_r').val('');
				$('#mpw').focus();
			}
			
		}
		
	});	//	#mpwBtn 비번 변경 시
	
});
</script>
</head>
<body>

<form id="profileUpdateForm">

profilePWUpdateForm.jsp<hr>
<input type="hidden" id="mkey" name="mkey" value="<%= mkey %>">
<input type="hidden" id="mnum" name="mnum" value="<%= mvo.getMnum() %>">

<span id="textPW">비밀번호 확인 >>> : <%= mvo.getMpw() %></span>
<span id="newPW">새 비밀번호</span>

<div id="reCheck">
<table>
<tr>
	<td>
	<input type="text" id="mpw_old_r" name="mpw_old_r">
	</td>
</tr>
</table>
</div>

<div id="reMpw">
<table>
<tr>
	<td>
	<input type="text" id="mpw" name="mpw">
	</td>
</tr>
<tr>
	<td>
	<input type="text" id="mpw_r" name="mpw_r">
	</td>
</tr>
</table>
</div>

<input type="button" class="mpwBtn" value="비밀번호 확인">
<%
		}
	}
%>

</form>

</body>
</html>