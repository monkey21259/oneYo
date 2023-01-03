<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String mnum = "";
	String likethis = "";
	String likeyn = "";
	mnum = request.getParameter("mnum");
	likethis = request.getParameter("likethis");
	likeyn = request.getParameter("likeyn");
	System.out.println("mnum : " + mnum);
	System.out.println("likethis : " + likethis);
	System.out.println("likeyn : " + likeyn);
%>
<!--
jsp:param name="mnum" value="세션에 담긴 mnum"
jsp:param name="likethis" value="조회된 게시글"
jsp:param name="likeyn" value="DB에서 조회된 회원의 좋아요 여부 / Y : 이미 좋아요했음 / N : 좋아요 안 했음"
-->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- jQuery -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				
				//페이지 최초로 넘어왔을 때 좋아요 개수 표시하기
				likeCount();
				
				//좋아요 insert
				$(document).on('click', '#notlike', function(){
					let urlVal = "likeInsert.ict";
					let mnumVal = $('#mnum').val();
					let likethisVal = $('#likethis').val();
					alert(mnumVal);
					
					if(mnumVal == null || mnumVal == 'null' || typeof mnumVal == 'undefined' || mnumVal == ''){
						alert('로그인이 필요한 기능입니다.');
						return;
					}//end of if
					
					$.ajax({
						url: urlVal,
						method: "POST",
						data: { mnum: mnumVal,
								likethis: likethisVal},
						success: whenSuccess,
						error: whenError
					});//end of ajax
					
					function whenSuccess(resData){
						if(resData == "LIKE_YES"){
							$('#notlike').replaceWith('<span id="like"><img src="/oneYo/img/like/like.png" width="20" height="20"></span>');
							likeCount();
						}else{
							alert("예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
						}//end of if-else
					}//end of whenSuccess() function
					
					function whenError(e){
						alert("예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
					}//end of whenError() function
					
				});//end of notlike click function
				
				//좋아요 취소
				$(document).on('click', '#like', function(){
					let urlVal = "likeDelete.ict";
					let mnumVal = $('#mnum').val();
					let likethisVal = $('#likethis').val();
					
					$.ajax({
						url: urlVal,
						method: "POST",
						data: { mnum: mnumVal,
								likethis: likethisVal},
						success: whenSuccess,
						error: whenError
					});//end of ajax
					
					function whenSuccess(resData){
						if(resData == "DEL_YES"){
							$('#like').replaceWith('<span id="notlike"><img src="/oneYo/img/like/notlike.png" width="20" height="20"></span>');
							likeCount();
						}else{
							alert("예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
						}//end of if-else
					}//end of whenSuccess() function
					
					function whenError(e){
						alert("예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
					}//end of whenError() function
					
				});//end of like click function
				
				//좋아요 카운트
				function likeCount(){
					let urlVal = "likeCount.ict"
					let likethisVal = $('#likethis').val();
					
					$.ajax({
						url: urlVal,
						method: "POST",
						data: {likethis: likethisVal},
						success: whenSuccess,
						error: whenError
					});//end of ajax
					
					function whenSuccess(resData){
						$('#likeCount').text(resData);
					}//end of whenSuccess() function
					
					function whenError(e){
						alert("예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
					}//end of whenError() function
					
				}//end of likeCount() function
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<%
			if (likeyn.equals("N")){
				System.out.println("if null -> likeyn : " + likeyn);
		%>
		<span id='notlike'><img src='/oneYo/img/like/notlike.png' width='20' height='20'></span>
		<%
			}else{
				System.out.println("if not null -> likeyn : " + likeyn);
		%>
		<span id='like'><img src='/oneYo/img/like/like.png' width='20' height='20'></span>
		<%
			}
		%>
		&nbsp;<span id="likeCount"></span>명이 좋아합니다
		<input type="hidden" id="mnum" value="<%=mnum%>">
		<input type="hidden" id="likethis" value="<%=likethis%>">
	</body>
</html>