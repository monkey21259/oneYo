<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
**************************************
commentForm.jsp 인크루드할 때
jsp:param name="cotnum" value="각 게시글 번호"
위 태그 꼭 작성해주세요.
**************************************
※ 세션에 담길 mid, mnick도 가져올 예정
-->
<%
	request.setCharacterEncoding("UTF-8");
	String cotnum = null;
	//cotnum = request.getParameter("cotnum");
	
	//각 게시판 인크루드 전 임시로 사용하는 테스트 글번호
	cotnum = "N202212230013";
	
	//세션 적용 전 임시로 사용하는 테스트 닉네임 & 회원번호
	String mnick = "댓글테스터";
	String mnum = "M202212260014";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			/*
			필요한 로직
			 1. 댓글 전체 불러오기 함수 : selectAll -> ajax
			 2. 댓글 insert
			 3. 댓글 삭제하기(mnum값이랑 비교해야함)
			 4. 댓글 조립하는 함수 : addNewItem
			 5. 댓글 insert 후 입력창 초기화하는 함수
			 6. 댓글 내용 줄바꿈되면 textarea rows 하나 늘리는 함수
			*/
			$(document).ready(function(){
				
				//댓글 insert
				$(document).on('click', '#insertBtn', function(){
					
					let urlVal = "commentInsert.ict";
					let methodVal = "POST";
					let dataVal = { cotnum:$('#cotnum').val(),
									cocontent:$('#cocontent').text(),
									mnum:$('#mnum').val()};
					
					$.ajax({
						url: urlVal,
						method: methodVal,
						data: dataVal,
						success: whenSuccess,
						error: whenError
					});//end of ajax()
					
					function whenSuccess(resData){
						if(resData == "INSERT_YES"){
							
						}else{
							
						}//end of if-else
					}//end of whenSuccess() function
					
					function whenError(e){
						alert(e.responseText);
					}//end of whenError() function
					
				});//end of insertBtn click function
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<!-- 화면에 보일 div태그 -->
		<div id="commentdiv" style="width:50%">
		<!-- 게시글 사이즈에 따라 width 변경하기 -->
			<form id="commentForm" name="commentForm">
				<input type="hidden" id="cotnum" value="<%=cotnum %>">
				<input type="hidden" id="mnum" value="<%=mnum %>">
				<div><%=mnick %></div>
				<textarea id="cocontent" rows="1" cols="50" placeholder="댓글 내용"></textarea>
				<button type="button" id="insertBtn">댓글 달기</button>
				<hr>
				<ul id="commentList">
					<!-- 댓글 내용 li태그 들어갈 자리 -->
				</ul>
			</form>
		</div>
	</body>
</html>