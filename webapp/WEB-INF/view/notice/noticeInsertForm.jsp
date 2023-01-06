<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.ict.common.O_Session" %>
    
 <%
	//세션
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
 %>   
<!DOCTYPE html>
<html>
	<head>
	<title>oneYo(오내요)</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0
					maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		
		<!-- 제이쿼리cdn -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- communityInsertForm.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/notice/noticeInsertForm.css">
		
		<!-- 페이지 로드시 회원, 게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		
		<script type="text/javascript">	
			$(document).ready(function(){
				
				$(document).on('click', '#insertBtn', function(){
					
					$('#noticeInsertForm').attr({
						'action':'noticeInsert.ict',
						'method':'POST',
						'enctype':'multipart/form-data'
					}).submit();//end of submit
					
				});//end of insertBtn click function
				
				//로그아웃
				$("#logoutBtn").on("click", function() {
					$("#logoutForm").attr({
						"action": "logout.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				
				// textarea 길이 늘리기
				$(".insBodyTextArea").on("input", function() {
					if (this.clientHeight < this.scrollHeight) {
						$(this).css("height", this.scrollHeight + 40);
					}
				});
				
				// -------------- 사진 처리 --------------
				var cntImg = 1;
				// 테스트 텍스트 클릭 시 사진 선택 열리게 만들기
				$(".inputFile").on("click", function() {
					// click 이벤트 발동
					$("#nphoto[data-value='" + cntImg + "']").trigger("click");
				});
				
				// 파일을 선택했을 때
				// jQuery 함수 인자에 동적으로 값을 넣을 수 없음.
				// (ex) $("#nphoto[data-value='" + cntImg + "']") >>> cntImg가 안먹힘.
				$(".nphoto").on("change", function() {
					alert("[.nphoto -> onchange] 파일 선택 완료");
					
					let fileName = $(this).val();
					// 파일 미선택시
					if (fileName == "") {
						cntImg -= 1;
						console.log(cntImg);
						alert("파일을 선택하지 않았습니다.");
						return false;
					}
					// 파일 선택이 정상적일 경우
					// 1. 파일 이름 추출하기
					// 2. 새로운 data-value를 가지는 input 태그 생성하기
					let splitedFName = splitFName(fileName);
					console.log(splitedFName);
					cntImg += 1;
					
					// (X) 새로운 원소 생성 필요 -> 동적생성해도 안먹힘.
// 				    let newImage = document.createElement("input");
// 				    newImage.type = "file";
// 					$(newImage).prop("id", "nphoto");
// 					$(newImage).prop("name", "nphoto");
// 					$(newImage).addClass("nphoto");
// 					$(newImage).attr("data-value", "" + cntImg);
// 					$(".fileContainer").append($(newImage));
					
					// TODO >> edge case: 선택한 파일을 삭제 시 처리 필요. > 보류.
					
					// (O) 선택한 파일을 출력하기 (outputFileName)
					$(".outputFileName").text("" + splitedFName);
				});
				
				function splitFName(obj) {
					let splitObj = obj.split("\\");
					if (splitObj === null || splitObj === undefined) {
						return "";
					}
					return splitObj[splitObj.length - 1];
				}
			
			//all.js 에 있는 모든 함수 연결
			allJavaScript();
				
			}); //end of jQuery
		</script>
	</head>
	<body>
	<form id="noticeInsertForm" name="noticeInsertForm">
		<div id="realAll">
			<div id="backMenu"></div>
				<input type="checkbox" id="sideMenu" name="sideMenu" hidden>
				<label for="sideMenu" id="sideLabel">&lt;&lt;&nbsp;&nbsp;&nbsp;</label>
				<div class="sidebar">
					<ul>
						<li class="item">
							<div class="homeLink">
								<span>
									홈으로
								</span>
							</div>
						</li>
						<li class="item">
							<div class="searchBarBtn">
								<span>
									검색
								</span>
							</div>
						</li>
	<!-- 					<li class="item"> -->
	<!-- 						<div id="warningForm"> -->
	<!-- 							<span> -->
	<!-- 								신고 -->
	<!-- 							</span> -->
	<!-- 						</div> -->
	<!-- 					</li> -->
						<li class="item">
							<div class="warningForm">
								<span>
									신고<br>팝업
								</span>
							</div>
						</li>
								<li class="item">
					<%
						if(mid == null || !mid.equals("admin")){
					%>
							<div class="mypageHome">
								<span>
									마이<br>페이지 
								</span>
							</div>
					<%
						} else if(mid.equals("admin")){
					%>
							<div class="adminHome">
								<span>
									관리자<br>페이지 
								</span>
							</div>
					<%
						}
					%>
						</li>
						<li class="item">
							<a href="javascript:window.scrollTo(0,0);">
								<div id="go_top">
									<span>
										TOP▲
									</span>
								</div>
							</a>
						</li>
					</ul>
				</div>
				<div id="searchBar" class="hidden_X">
				<!-- <div id="searchBar" class="hidden_O"> -->
					<div class="searchBarBtn">
						X
					</div>
					검색바 여기에 넣기
					<input type="text" id="searchText" name="serchText">
					<input type="button" id="searchTextBtn" value="검색">
				</div>
				<div id="singo" class="hidden_X">
					<div class="warningForm">
						X
					</div>
					신고 인클루드 이쪽으로
				</div>
				<div id="shadow" class="hidden_X"></div>
				<div id="all_div">
					<div id="header">
						<div id="logoLeft" class="logoSide">
							<!-- 	로고 옆공간 좌측 -->
						</div>
						<div id="logo" class="homeLink">
							<img alt="오내요" src="/oneYo/resource/img/oneYo_logo.png">
							<!-- 379 X 186 -->
						</div>
						<div id="logoRight" class="logoSide">
							<!-- 	로고 옆공간 우측 -->
						 	<div id="loginDiv">
<%
							if (mid == null || mid.equals("")) {
%>
								<div class="loginBtnDiv">
									<span class="Choonsik" id="newMemBtn">회원가입</span>
									<span class="Choonsik">|</span>
							 		<span class="Choonsik" id="loginBtn">로그인</span>
						 		</div>
<%
							} else {
%>
								<div class="loginBtnDiv">
<%
								if (mid.equals("admin")) {
%>
									<span class="Choonsik adminHome">관리자페이지</span>
<%
								} else {
%>
									<span class="Choonsik mypageHome">마이페이지</span>
<%
								}
%>
									<span class="Choonsik">|</span>
							 		<span class="Choonsik" id="logoutBtn">로그아웃</span>
<%
								String mSNSid = mid;
								if (mid != null && !(mid.equals(""))) {
									if (mid.length() > 5) {
										String checkSNS = mid.substring(0, 6);
										if (checkSNS.equals("naver_")) {
											mSNSid = "naver"; 
										}
										if (checkSNS.equals("kakao_")) {
											mSNSid = "kakao";
										}
									}
								}
%>
									<p><%= mSNSid %> <span>님 환영합니다.</span></p>
						 		</div>
						 		<p></p>
<% 		
							}
%>
						 	</div>
						</div>
						<div class="nav">
						<!-- 상단 메뉴바 -->
							<nav>
								<ul>
									<li>
										<a href="recipeSelectAll.ict" class="menu_link">
											<div>
											레시피
											</div>
										</a>
									</li>
									<li>
										<a href="tipSelectAll.ict" class="menu_link">
											<div>
											Tip
											</div>
										</a>
									</li>
									<li>
										<a href="communitySelectAll.ict" class="menu_link">
											<div>
											커뮤니티
											</div>
										</a>
									</li>
									<li>
										<a href="noticeSelectAll.ict" class="menu_link">
											<div class="divClick">
											공지사항
											</div>
										</a>
									</li>
									<li>
										<a href="#" class="menu_link">
											<div>
											더보기
											</div>
										</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
					<div id="center">
<!-- -------------------------------페이지 전용 center------------------------------- -->
						<div class="insertHeader">
							공지사항 글 등록
						</div>
						<div class="insertHeaderUnderLine">  
							-----------------
						</div>
						<div class="insBody">
							<table>
								<tr>
									<td>제목</td>
									<td>
										<input type="text" id="nsubject" name="nsubject" class="insBodyArea" placeholder="제목을 입력하시오.">
									</td>
								</tr>
								<tr>
									<td>내용</td>
									<td>
										<textarea id="ncontent" name="ncontent" rows="5" cols="5" class="insBodyTextArea"></textarea>
									</td>
								</tr>
								<tr>
									<td>사진</td>
									<td>
										<div class="inputFile">추가하기</div>
										<div class="fileContainer">
											<input type="file" id="nphoto" name="nphoto" class="nphoto" data-value="1">
											<input type="file" id="nphoto" name="nphoto" class="nphoto" data-value="2">
											<input type="file" id="nphoto" name="nphoto" class="nphoto" data-value="3">
										</div>
										<div class="outputFileName"></div>
										<button id="insertBtn" name="insertBtn" class="insertBtn">등록</button>
									</td>
								</tr>
							</table>
						</div>
<!-- -------------------------------페이지 전용 center------------------------------- -->
					</div>
					<!-- common_count.js 자바스크립트 임포트하면 span태그에 값이 바인딩 됨. -->
					<div id="footer">
						<div>
							<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
						</div>
						<div>
							<span></span> / <span></span><br />
							<span></span> / <span></span><br />
						</div>
					</div>
				</div>
			</div>
		</form>
		<form id="logoutForm">
 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
 		</form>
	</body>
</html>