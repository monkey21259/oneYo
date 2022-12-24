<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="main.ict.tip.vo.TipVO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("tipUpdateForm.jsp 페이지 진입");
	
	TipVO tvo = null;
	List<TipVO> list = null;

	if(request.getAttribute("list") !=null) {
		list = (List<TipVO>)request.getAttribute("list");
		
		if(list !=null && list.size() == 1 ){
			tvo = list.get(0);
			logger.info("글 번호 : " + tvo.getTnum());
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>
<style type="text/css">

	#container {
		text-align: center;
	}
	
	#tipSelectContentForm {
		display: inline-block;
	}
	

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		console.log("tipUpdateForm.jsp");
		
		var options = $("#tcategory").children();
		console.log(options);
		options.each(function(i){
			console.log(options[i].value);
			option = options[i].value;
			if(option == <%= tvo.getTcategory() %>){
				$(this).prop("selected", true);
			}
		});
		
		$(document).on("click", "#inputBtn", function(){
			
			console.log("inputBtn 버튼 클릭 이벤트 발생");
			alert("inputBtn 버튼 클릭 이벤트 발생");
			
			var tsubject_val = $("#tsubject").val();
			console.log("글제목 : " + tsubject_val);
			
			var tcontent_val = $("#tcontent").val();
			console.log("글내용 : " + tcontent_val);
			
			var tsubject_chk = !(tsubject_val == null || tsubject_val == "" || tsubject_val.length == 0 || typeof tsubject_val == "undefined");
			console.log("글 제목 작성여부 : " + tsubject_chk);
			
			var tcontent_chk = !(tcontent_val == null || tcontent_val == "" || tcontent_val.length == 0 || typeof tcontent_val == "undefined");
			console.log("글 내용 작성여부 : " + tcontent_val);
			
			if(tsubject_chk && tcontent_chk){
				$("#tipUpdateForm").attr({
					"action": "tipUpdate.ict",
					"method": "POST",
					"enctype": "multipart/form-data"
				}).submit();
			}else{
				if(!tsubject_chk && !tcontent_chk){
					alert("글 제목과 내용을 입력하세요.");
					$("#tsubject").focus();
				}else if(!tcontent_chk){
					alert("글 내용을 입력하세요.");
					$("#tcontent").focus();
				}else if(!tsubject_chk){
					alert("글 제목을 입력하세요");
					$("#tsubject").focus();
				}
			}
		});
		
		$(document).on("click", "#resetBtn", function(){
			if(confirm("글 제목과 내용이 지워집니다. 계속 하시겠습니까?")){
				$("#tsubject").val("");
				$("#tcontent").val("");
				$("#tsubject").focus();
			}
		});
	});

</script>
</head>
<body>
<div id="container">
	<form id="tipUpdateForm">
		<table>
			<tr>
				<td>글제목</td>
				<td>
					<input type="text" id="tsubject" name="tsubject" placeholder="글 제목" size="50" value="<%= tvo.getTsubject() %>">
					<input type="hidden" id="tnum" name="tnum" value="<%= tvo.getTnum() %>">
				</td>
			</tr>
			<tr>
				<td>팁 분야</td>
				<td>
				<select id="tcategory" name="tcategory">
					<option value="00">요리
					<option value="01">주방관리
					<option value="02">재료정보
					<option value="99">기타
				</select>
				</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td>
					<textarea rows="10" cols="50" id="tcontent" name="tcontent" placeholder="글 내용" ><%= tvo.getTcontent() %></textarea>
					<br>
					<img src="/oneYo/img/tip/<%= tvo.getTphoto() %>">
				</td>
			</tr>
			<tr>
				<td>사진 선택</td>
				<td><input type="file" name="tphoto"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id="resetBtn" value="다시 쓰기" style="float:right;">
					<input type="button" id="inputBtn" value="글 수정" style="float:right;">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>