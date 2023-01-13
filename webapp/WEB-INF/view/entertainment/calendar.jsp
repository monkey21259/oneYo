<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
	String mnick = (String)oSession.getAttribute(request, "mnick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes" />
<title>oneYo(오내요)</title>


<!-- jQuery -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>



<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>

<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"  charset="UTF-8"></script>
<!-- 채팅 css -->
<link rel="stylesheet" href="/oneYo/resource/css/common/chat.css"  charset="UTF-8">

<link rel="stylesheet" href="/oneYo/calendar/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href="/oneYo/calendar/vendor/css/bootstrap.min.css">
<link rel="stylesheet" href="/oneYo/calendar/vendor/css/select2.min.css" />
<link rel="stylesheet" href="/oneYo/calendar/vendor/css/bootstrap-datetimepicker.min.css" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="/oneYo/calendar/css/main.css">

<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css" charset="UTF-8">

<script type="text/javascript">

	$(document).ready(function(){
		

		//로그아웃
		$("#logoutBtn").on("click", function() {
			$("#logoutForm").attr({
				"action": "logout.ict",
				"method": "GET",
				"enctype": "application/x-www-form-urlencoded"
			}).submit();
		});
	
		
		//all.js 에 있는 모든 함수 연결
		allJavaScript();
		
		
	});//ready
</script>


</head>

	<body>
	<form id="calendarForm" name="calendarForm">
		<div id="realAll">

<div id="backMenu" class="backMenu_bar"></div>

<div id="sideBar">
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

		<li class="item">
			<div class="warningForm">
			<span>
				신고
			</span>
			</div>
		</li>
		<li class="item">
<%
      if (mid == null || !(mid.equals("admin"))) {
%>
	         <div class="mypageHome">
	         <span>
	         	마이<br>페이지 
	         </span>
	         </div>
<%
      } else if (mid.equals("admin")) {
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
	</div><!-- sidebar -->

<div id="searchBar" class="hidden_X">
<!-- <div id="searchBar" class="hidden_O"> -->
	<div class="searchBarBtn">
		X
	</div>
	<div>
		<jsp:include page="/WEB-INF/view/recipe/recipePage.jsp" flush="true">
				<jsp:param value="" name=""/>
		</jsp:include>	
	</div>
</div><!-- searchBar -->

<div id="singo" class="hidden_X">
	<div class="warningForm">
		X
	</div>
	<jsp:include page="/WEB-INF/view/warning/warningPage.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>	
</div><!-- singo -->

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
			if(mid.equals("admin")){
%>
				<span class="Choonsik adminHome">관리자페이지</span>
<%
			}else{
%>
				<span class="Choonsik mypageHome">마이페이지</span>
<%
			}
%>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="logoutBtn">로그아웃</span>
<%
			String mSNSid = mid;  // M22...
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
	</div><!-- logoRight -->
	
<div class="nav">
	<!-- 상단 메뉴바 -->
		<nav>
		<ul>
			<li>
				<div class="menu">
					<a href="recipeSelectAll.ict" class="menu_link">
						<div>
							레시피
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="tipSelectAll.ict" class="menu_link">
						<div>
							Tip
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="communitySelectAll.ict" class="menu_link">
						<div>
							커뮤니티
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="noticeSelectAll.ict" class="menu_link">
						<div>
							공지사항
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="pulsMenu">
					<div class="menu">
						<a href="entertainment.ict" class="menu_link">
							<div>
								더보기
							</div>
						</a>
					</div>
					<div class="sub-menu">
					<ul>
						<li>
							<a href="entertainment.ict" class="menu_link">
							<div>
							엔터테이먼트
							</div>
							</a>
						</li>
						<li>
							<a href="chart.ict" class="menu_link">
							<div>
							차트
							</div>
							</a>
						</li>
						<li>
							<a href="goCalendar.ict" class="menu_link">
							<div>
							일정 관리
							</div>
							</a>
						</li>
					</ul>
					</div>
				</div><!-- pulsMenu -->
			</li>
		</ul>
		</nav>
	</div> <!-- nav -->
	</div><!-- header -->

<div id="center">
<!-- -------------------------------페이지 전용 center------------------------------- -->
	<input type="hidden" id="mnumVal" value="<%=mnum %>">
    <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">요리교실</a></li>
                <li><a tabindex="-1" href="#">장날</a></li>
                <li><a tabindex="-1" href="#">음식축제</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">새 일정 등록</h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <label><input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>
						
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="요리교실">요리교실</option>
                                    <option value="장날">장날</option>
                                    <option value="음식축제">음식축제</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨강</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파랑</option>
                                    <option value="#f06595" style="color:#f06595;">핑크</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록</option>
                                    <option value="#03d7fc" style="color:#03d7fc;">하늘</option>
                                    <option value="#495057" style="color:#495057;">검정</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div id="filter_div" class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>
            

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="요리교실">요리교실</option>
                            <option value="장날">장날</option>
                            <option value="음식축제">음식축제</option>
                        </select>
                    </div>
                </div>
            </div> <!-- panel-body -->
        </div> <!-- filter_div -->
        <!-- /.filter panel -->
    </div> <!-- container -->
    
    <!-- 채팅 -->
	<jsp:include page="./chat.jsp">
		<jsp:param value="<%=mnick %>" name="mnick"/>
	</jsp:include>
    
    <!-- /.container -->
    <script src="/oneYo/calendar/vendor/js/jquery.min.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/vendor/js/bootstrap.min.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/vendor/js/moment.min.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/vendor/js/fullcalendar.min.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/vendor/js/ko.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/vendor/js/select2.min.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/vendor/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/js/main.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/js/addEvent.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/js/editEvent.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/js/etcSetting.js" charset="UTF-8"></script>

	
	<!-- -------------------------------페이지 전용 center------------------------------- -->
</div> <!-- center -->

<!-- common_count.js 자바스크립트 임포트하면 span태그에 값이 바인딩 됨. -->
<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
	</div>
	<div>
		<span></span> / <span></span><br />
		<span></span> / <span></span><br />
	</div>
</div> <!-- footer -->

</div><!-- all_div -->
</div> <!-- realall -->
</div>
</form>
	<form id="logoutForm">
 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
 		</form>
</body>
</html>