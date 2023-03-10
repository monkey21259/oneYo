<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
**************************************
commentForm.jsp 인크루드할 때
jsp:param name="cotnum" value="각 게시글 번호"
위 태그 꼭 작성해주세요.
**************************************
세션 적용 후
jsp:param name="clientMnick" value="세션에 담긴 mnick"
위 태그 작성해주세요.
-->
<%
	request.setCharacterEncoding("UTF-8");
	String cotnum = null;
	cotnum = request.getParameter("cotnum");
	String clientMnick = request.getParameter("clientMnick");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			/*
			필요한 로직
			 1. 댓글 전체 불러오기 함수 : selectAll -> ajax-------------완료
			 2. 댓글 insert------------완료
			 3. 댓글 삭제하기(mnum값이랑 비교해야함)-------------완료
			 4. 댓글 조립하고 ul에 추가하는 함수 : addNewItem-----------완료
			 5. 댓글 insert 후 입력창 초기화하는 함수---------------삭제
			 6. 댓글 내용 줄바꿈되면 textarea rows 하나 늘리는 함수
			*/
			$(document).ready(function(){
				
				//selectContent 페이지 들어왔을 때 댓글 전체 조회
				commentSelectAll();
				
				//문자열 byte 수 반환하는 함수
				function getStringBytes(s){
					var bytes = 0;
					for(var i=0; i<s.length; i++){
						if(escape(s.charAt(i)).length == 6){
							bytes++;
						}//end of if
						bytes++;
					}//end of for
					console.log(bytes);
					return bytes;
				}//end of getStringBytes() function
				
				//textarea rows 1씩 늘리기--------추가해야함
				
				//댓글 insert
				$(document).on('click', '#insertBtn', function(){
					
					let urlVal = "commentInsert.ict";
					let methodVal = "POST";
					let dataVal = { cotnum:$('#cotnum').val(),
									cocontent:$('#cocontent').val(),
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
							$('#cocontent').val('');
							location.reload();
							commentSelectAll();
						}else{
							alert("댓글 달기 중 예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
						}//end of if-else
					}//end of whenSuccess() function
					
					function whenError(e){
						alert("댓글 달기 중 예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
					}//end of whenError() function
					
				});//end of insertBtn click function
				
				//댓글 select all 함수
				function commentSelectAll(){
					
					let urlVal = "commentSelectAll.ict";
					let methodVal = "POST";
					let dataVal = {cotnum: $('#cotnum').val()};
					
					$.ajax({
						url: urlVal,
						method: methodVal,
						data: dataVal,
						success: whenSuccess,
						error: whenError
					});//end of ajax()
					
					function whenSuccess(resData){
						console.log(typeof resData);
						if(resData == null || typeof resData == "undefined" || resData == ""){
							
							$('.hrhr').addClass('hidden_X');
							$('.nullDiv').addClass('hidden_X');
							
							return false;
						}else{
							let commentList = resData.split("&");
							
							var chongGul = $('<span>');
							chongGul.html('댓글');
							var chongCnt = $('<p>');
							chongCnt.html(commentList.length + ' 개');
							$('#chong').append(chongGul).append(chongCnt);
							
							for(let i=0; i<commentList.length; i++){
								let row = commentList[i].split(",");
								console.log(row);
								/*
								row[0] : conum
								row[1] : cocontent
								row[2] : mnum
								row[3] : mnick
								row[4] : insertdate
								*/
								
								if(i > 0) {
									$('#commentList').append($('<hr>'));
								}
								//댓글 조립하고 ul에 추가하기
								addNewItem(row[0], row[1], row[2], row[3], row[4]);
							}//end of for
						}//end of if-else
					}//end of whenSuccess() function
					
					function whenError(e){
						alert("댓글 조회 중 예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
					}//end of whenError() function
					
				}//end of commentSelectAll()
				
				//댓글 조립하고 ul에 추가하는 함수
				function addNewItem(conum, cocontent, mnum, mnick, insertdate){
					
					if(conum == null || typeof conum == "undefined" || conum == ""){
						return false;
					}//end of if
					
					
					//새로운 댓글이 담겨질 div태그
					var newDiv = $('<div>');
					newDiv.addClass('item');
					
					//	닉네임+작성일
					var wridayDiv = $('<div>');
					wridayDiv.addClass('wriday');
					
					//작성자 닉네임, 삭제 버튼이 담길 div태그
					var writerDiv = $('<div>');
					writerDiv.addClass('writer');
					
					//댓글 삭제 버튼 input태그
// 					var deleteBtn = $('<input>');
					
// 					//접속한 고객 회원번호와 조회된 댓글 작성자의 회원번호가 같다면 삭제 버튼 보이기
// 					if(mnum == $('#mnum').val()){
// 						deleteBtn.attr({'type':'button', 'value':'삭제'});
// 						deleteBtn.addClass('deleteBtn');
// 					}else{
// 						deleteBtn.attr({'type':'hidden'});
// 					}//end of if-else
					
					//댓글 삭제 버튼 input태그
					var deleteBtn = $('<div>');
					deleteBtn.html('삭제');
					//접속한 고객 닉네임과 조회된 댓글 작성자의 닉네임이 같다면 삭제 버튼 보이기
					if(mnick == $('#inputNick').text().trim()){
						deleteBtn.addClass('deleteBtn');
					}else{
						deleteBtn.addClass('deleteBtn');
						deleteBtn.addClass('hidden_O');
					}//end of if-else
					
					writerDiv.html(decodeURIComponent(mnick));
					
					//댓글번호가 담길 hidden타입 input태그
					var conumHidden = $('<input>');
					conumHidden.attr({'type':'hidden', 'value':conum});
					conumHidden.addClass('conum');
					
					//댓글 작성자 회원번호가 담길 hidden타입 input태그
					var mnumHidden = $('<input>');
					mnumHidden.attr({'type':'hidden', 'value':mnum});
					mnumHidden.addClass('mnum');
					
					//댓글 내용이 담길 div태그
					var cocontentDiv = $('<div>');
					cocontentDiv.html(decodeURIComponent(cocontent));
					cocontentDiv.addClass('cocontent');
					
					//댓글 작성일이 담길 p태그
					var insertdateDiv = $('<div>');
					insertdateDiv.html(decodeURIComponent(insertdate));
// 					insertdateDiv.html(decodeURIComponent(insertdate) + "&nbsp;&nbsp;&nbsp;");
					insertdateDiv.addClass('insertdate');
					
					
					//생성한 태그들 조립하기
					writerDiv.append(conumHidden).append(mnumHidden);
// 					insertdateDiv.append(deleteBtn);
// 					newDiv.append(writerDiv).append(cocontentDiv).append(insertdateDiv);
// 					newDiv.append(writerDiv).append(insertdateDiv).append(cocontentDiv).append(deleteBtn);
					wridayDiv.append(writerDiv).append(insertdateDiv);
					newDiv.append(wridayDiv).append(deleteBtn).append(cocontentDiv);
					$('#commentList').append(newDiv);
					
				}//end of addNewItem() function
				
				//댓글 delete
				$(document).on('click', '.deleteBtn', function(){
					//deleteBtn태그 바로 뒤에 있는 conumHidden태그 선택
					var conumVal = $(this).next().val();
					//deleteBtn태그의 부모 태그 중 클래스가 item인 li태그 선택
					var target = $(this).parents('.item');
					
					let urlVal = "commentDelete.ict";
					let methodVal = "POST";
					let dataVal = {conum: conumVal};
					
					$.ajax({
						url: urlVal,
						method: methodVal,
						data: dataVal,
						success: whenSuccess,
						error: whenError
					});//end of ajax()
					
					function whenSuccess(resData){
						if(resData == "DELETE_YES"){
							alert("댓글이 삭제되었습니다.");
							target.remove();
						}else{
							alert("댓글 삭제 중 예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
						}//end of if-else
					}//end of whenSuccess() function
					
					function whenError(e){
						alert("댓글 삭제 중 예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
					}//end of whenError() function
					
				});//end of .deleteBtn click function
				
			});//end of jQuery
		</script>
	</head>
	<body>
		<div class="comments">
		<!-- 화면에 보일 div태그 -->
		<!-- 게시글 사이즈에 따라 width 변경하기 -->
			<form id="commentForm" name="commentForm">
<%
			if (clientMnick != null && clientMnick.length() > 0 && !(clientMnick.equals("null"))) {
%>
				<div id="inputComment">
					<div id="inputNick">
						<%=clientMnick %>
					</div>
					<div id="insertNeyong">
						<textarea id="cocontent" rows="3" cols="50" placeholder="댓글 내용"></textarea>
					</div>
					<div id="insertBtn">
						댓글 달기
					</div>
				</div>
<%	
			}else {
%>
				
				<div class="nullDiv"></div>
<%
			}
%>
				
				<div class="nullDiv"></div>
				<div id="chong" class="chong"></div>
				<hr id="hrhr" class="hrhr">
				
				<input type="hidden" id="cotnum" value="<%=cotnum %>">
				<div id="commentList">
					<!-- 댓글 내용 table태그 들어갈 자리 -->
				</div>
				
				<div class="nullDiv"></div>
				<div class="nullDiv"></div>
				<div class="nullDiv"></div>
				<div class="nullDiv"></div>
			</form>
		</div>
	</body>
</html>