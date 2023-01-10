<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mnick = request.getParameter("mnick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/oneYo/resource/css/entertainment/chat.css">
<script type="text/javascript">

	$(document).ready(function(){
		
		//채팅 서버 주소
		let url = "ws://192.168.219.131:8088/oneYo/chatserver";
		
		// 웹 소켓
		let ws;
		
		$(document).on('click', '#chatBtn', function(){
			// 유저명 확인
			if ($('#user').val().trim() != '' && $('#user').val() != 'null') {
				// 연결
				ws = new WebSocket(url);
						
				// 소켓 이벤트 매핑
				ws.onopen = function (evt) {
					// console.log('서버 연결 성공');
					print2($('#user').val());
							
					// 현재 사용자가 입장했다고 서버에게 통지(유저명 전달)
					// -> 1#유저명
					ws.send('1#' + $('#user').val() + '#');
					
					$('.container').css({'display':'inline-block'});
					$('#chatBtn').css({'display':'none'});
				};
				
				ws.onmessage = function (evt) {
					// print('', evt.data);
					let index = evt.data.indexOf("#", 2);
					console.log("  evt : " + evt);
					console.log("  evt.data : " + evt.data);
					console.log("  index : " + index);
					let no = evt.data.substring(0, 1); 
					let user = evt.data.substring(2, index);
					let txt = evt.data.substring(index + 1);
							
					if (no == '1') {
						print2(user);
					} else if (no == '2') {
						print(user, txt);
					} else if (no == '3') {
						print3(user);
					}
					$('#list').scrollTop($('#list').prop('scrollHeight'));
				};
			   			
				ws.onclose = function (evt) {
					console.log('소켓이 닫힙니다.');
					setTimeout(ws.onopen(), 1000);
				};
		
				ws.onerror = function (evt) {
					console.log(evt.data);
				};
			} else {
				alert('로그인 후 사용하실 수 있습니다.');
			}
		});//end of chatBtn click function
		
		// 메세지 전송 및 아이디
		function print(user, txt) {
			let temp = '';
			var hour = new Date().getHours();
			var min = new Date().getMinutes();
			var time = hour + ":" + min;
			
			if($('#user').val() == user){
			//메세지 보내는 게 자기 자신일 때
				temp += '<div class="chatline"';
				temp += '<div class="mychatcontainer">';
				temp += '<div class="chatmsg">';
				temp += txt;
				temp += '</div>';
				temp += ' <span class="msgtime">' + time + '</span>';
				temp += '</div>';
				temp += '</div>';
			}else{
			//다른 사람이 메세지 보낼 때
				temp += '<div class="chatline"';
				temp += '<div class="otherchatcontainer">';
				temp += '<b class="nick">' + user + '</b>';
				temp += '<div class="chatmsg">';
				temp += txt;
				temp += '</div>';
				temp += ' <span class="msgtime">' + new Date().toLocaleTimeString() + '</span>';
				temp += '</div>';
				temp += '</div>';
			}//end of if-else
			
			$('#list').append(temp);
		}
				
		// 다른 client 접속		
		function print2(user) {
			let temp = '';
			temp += '<div class="chatline"';
			temp += '<div class="entermsg">';
			temp += user + "님이 들어왔습니다" ;
			temp += '</div>';
			temp += '</div>';
			
			$('#list').append(temp);
		}
		
		// client 접속 종료
		function print3(user) {
			let temp = '';
			temp += '<div class="chatline"';
			temp += '<div class="outmsg">';
			temp += user + "님이 나갔습니다" ;
			temp += '</div>';
			temp += '</div>';
					
			$('#list').append(temp);
		}
				
		$('#msg').keydown(function() {
			if (event.keyCode == 13) {
						
				//서버에게 메시지 전달
				//2#유저명#메시지
				ws.send('2#' + $('#user').val() + '#' + $(this).val()); //서버에게
				print($('#user').val(), $(this).val()); //본인 대화창에
				
		        $('#msg').val('');
				$('#msg').focus();
						
			}
		});
				
		$('#btnDisconnect').click(function() {
			ws.send('3#' + $('#user').val() + '#');
			ws.close();
					
			$('#user').attr('readonly', false);
		    $('#user').val('');
					
			$('#btnConnect').attr('disabled', false);
			$('#btnDisconnect').attr('disabled', true);
					
			$('#msg').val('');
			$('#msg').attr('disabled', true);
		});
		
	});
</script>
</head>
<body>
<button type="button" id="chatBtn">채팅하기</button>
<div class="container">
	<b><%=mnick %>님 환영합니다</b>
	<table class="chatTable">
		<tr>
			<td><div id="list"></div></td>
		</tr>
		<tr>
			<td>
				<input type="text" name="msg" id="msg" placeholder="대화 내용을 입력하세요" class="form-control">
				<input type="hidden" name="user" id="user" class="form-control" value="<%=mnick%>">
			</td>
		</tr>
	</table>
</div>
</body>
</html>