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
	
	logger.info("~~ profileInfoUpdateForm.jsp ~~");
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
<%
	String[] mhps = null;
	mhps = mvo.getMhp().split("-");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profileInfoUpdateForm.jsp</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	alert("profileInfoUpdateForm.jsp");
	
	var mcat = '<%= mvo.getMcategory() %>';
	if (mcat != null && mcat.length > 0) {
		
		var mcate = mcat.split("#");
		
		for (var i = 1; i < mcate.length; i++) {
			
			console.log("mcate[" + i + "] >>> : " + mcate[i]);
			
			$('.mcategory').each(function(){
				if ($(this).val() == mcate[i]) {
					$(this).prop("checked",true);
				}
			});
		}
	}
	
	$(document).on('click', '.memBtn', function(){

		//	NOT NULL 데이터 NULL 체크			=====================
			
		let cnt = 0;			//	null갯수 체크 변수
		let thisNull = null;	//	포커싱 위한 변수
		
		$('.notNull').each(function(){	//	null이면 안되는 input을 돌며 null데이터를 체크한다.
			if ($(this).val() == null || $(this).val() == '') {	//	input null 체크 if
				
				cnt += 1;	//	input null 이면 cnt가 올라간다.
				
				if (cnt == 1) {	//	null 항목 중 가장 첫번째라면
					thisNull = $(this);	//	가장 처음 null인 대상을 thisNull에 입력
				}	//	포커싱 위한 this 선택 if
				
			}	//	input null 체크 if
		});	//	null이면 안되는 input을 돌며 null데이터를 체크한다.

		if (cnt != 0) {	//	NOT NULL항목중 null이 있었을 경우
			
			alert("미작성 한 필수 입력 항목이 " + cnt + "개 있습니다. 마저 작성해주세요.");	//	미작성 항목 수를 알려줌
			thisNull.focus();	//	미작성 한 것 중 가장 앞에 커서를 올려둠
			
		//	NOT NULL 데이터 NULL 체크			=====================
			
		}else {
			
			let mhp = $('#mhp0').val();
				mhp += "-" + $('#mhp1').val();
				mhp += "-" + $('#mhp2').val();
			$('#mhp').val(mhp);		//	mhp합치기..
			console.log('mhp >>> : ' + $('#mhp').val());
			
			let mcategory = "";
			$('.mcategory').each(function(){
				if ($(this).is(':checked') == true) {
					mcategory += "#" + $(this).val();
				}
			});
			$('#mcategory').val(mcategory);
			console.log("mcategory >>> : " + $('#mcategory').val());
			
			alert("mkey >>> : " + $('#mkey').val());
			
			$('#profileUpdateForm').attr({
				 "action"	: "memUpdate.ict"
				,"method"	: "POST"
				,"enctype"	: "multipart/form-data"
			}).submit();
		}
	});
	
});
</script>
</head>
<body>

<form id="profileUpdateForm">

profileInfoUpdateForm.jsp
<input type="hidden" id="mnum" name="mnum" value="<%= mvo.getMnum() %>">
<input type="hidden" id="mkey" name="mkey" value="<%= mkey %>">
<table>
<!-- 기타 -->
<tr>
	<td>
	이름
	</td>
	<td>
	<input type="text" id="mname" name="mname" value="<%= mvo.getMname() %>">
	</td>
</tr>
<tr>
	<td>
	전화번호
	</td>
	<td>
		<input type="text" id="mhp0" name="mhp0" class="mhp notNull" value="<%= mhps[0] %>">
		- <input type="text" id="mhp1" name="mhp1" class="mhp notNull" value="<%= mhps[1] %>">
		- <input type="text" id="mhp2" name="mhp2" class="mhp notNull" value="<%= mhps[2] %>">
		<input type="hidden" id="mhp" name="mhp" value="">
	</td>
</tr>
<tr>
	<td>
	선호하는 요리분야
	</td>
	<td>
	<ul>
		<li>
			<input type="checkbox" class="mcategory" value="00">한식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="01">중식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="02">양식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="03">일식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="04">간식
		</li>
		<li>
			<input type="checkbox" class="mcategory" value="99">기타
		</li>
	</ul>
	<input type="hidden" id="mcategory" name="mcategory" value="">
	</td>
</tr>
</table>

<input type="button" class="memBtn" value="회원 정보 수정">

<%
		}
	}
%>

</form>

</body>
</html>