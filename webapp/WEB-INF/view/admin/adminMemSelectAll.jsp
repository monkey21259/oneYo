<%@page import="main.ict.common.CodeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="java.util.List" %>

<%@ page import="main.ict.mem.vo.MemVO" %>
<%@ page import="main.ict.common.O_Session" %>
<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("회원목록(adminMemSelectAll) 진입 >>> : "); 
	
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
%>        
<%
	

	//model.addAttribute("adminMemSelectAll", list);
	Object obj = request.getAttribute("adminMemSelectAll");
	
	List<MemVO> list = (List<MemVO>)obj;
	//vo호출
	MemVO mvo = null;
	
%>
<%
	// 페이징
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- adminMemSelectAll.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/admin/adminMemSelectAll.css">
		
		<!-- 제이쿼리cdn -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- 페이징 기능 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/common/paging.css">
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<script type="text/javascript">
			$(document).ready(function(){
						
				$(document).on("click", ".deleteBtn", function(){
					
					let info = $(this).parent().find(".mid");
					//let info = $(this).siblings();
					console.log("info >>> : " + info);
					let mid = info.get(0).value;
					console.log("mid >>> : " + mid);
					
					let result = confirm(mid + '님을 탈퇴 하시겠습니까? ')
					if(result == true){
					
					let url = "adminMemDelete.ict";
					let reqType= "GET";
					let dataParam ={
							
							mid : info.get(0).value,
					};
					
					console.log("url : " + url);
					console.log("reqType : " + reqType);
					console.log("dataParam : " + dataParam);
					
					$.ajax({
						
						url:url,
						type:reqType,
						data:dataParam,
						success:whenSuccess,
						error:whenError		
						
					}); //ajax
				}else{
					alert("취소되었습니다");
				}
					
					
				function whenSuccess(resData){
							if(resData == 'deleteOK'){
								alert("탈퇴되었습니다.");
							} 
						
					} //sucess
					
				function whenError(e){
					console("탈퇴실패 >>> : "  + e.responseText);
				} //whenError	
				
					
				}); //deleteBtn
				
				//	검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
				//	홈으로 보내주는 all.js 함수
				homeAction();
				//	메뉴바 클릭액션 all.js 함수
				divClickAction();
				
				// 마이페이지로 보내주는 all.js 함수
				mypageHomeAction();
						
				//회원가입 으로 보내주는 all.js 함수
				joinAction();
				
				//로그인으로 보내주는 all.js 함수
				loginAction();
				
				
			}); //ready
		</script>
		
</head>
<body>
	
	<form>
<div id="realAll">

<div id="backMenu"></div>

<div id="sideBar">
	<label for="sideMenu"><div>▼<br>▽<br>▼</div></label>
	<input type="checkbox" id="sideMenu" name="sideMenu" hidden>
	<ul>
		<li class="item">
			<div class="homeLink">
			홈으로
			</div>
		</li>
		<li class="item">
			<div class="searchBarBtn">
			검색
			</div>
		</li>
		<li class="item">
			<div id="warningForm">
			신고
			</div>
		</li>
		<li class="item">
			<div class="warningForm">
			신고<br>팝업
			</div>
		</li>
		<li class="item">
			<div class="mypageHome">
			my<br>Page
			</div>
		</li>
		<li class="item">
			<a href="javascript:window.scrollTo(0,0);">
			<div id="go_top">
			TOP▲
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
				<span class="Choonsik">:</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
<%
		} else {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="#" onclick="javascript:alert('준비중입니다.');">마이페이지</span>
				<span class="Choonsik">:</span>
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
	 		<form id="logoutForm">
	 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
	 		</form>
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
				<div>
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
	<h3>회원목록</h3>
		<hr>
			<table border="1 solid">
				<thead>
					<tr>
						<th>NO</th>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>회원등급</th>
						<th>프로필사진</th>
						<th>관심요리분야</th>
						<th>경고횟수</th>
						<th>등록일</th>
						<th>탈퇴</th>
					</tr>					
				</thead>
<%
			if(list.size() > 0){
				for(int i=0; i<list.size(); i++){
					mvo = list.get(i);
%>
<%
					//페이징 세팅
					//model.addAttribute("pagingMVO", mvo);
					Object obj_p = request.getAttribute("pagingMVO");
					MemVO pagingMPVO = (MemVO)obj_p;
					
					pageSize = Integer.parseInt(pagingMPVO.getPageSize());
					logger.info("pageSize >>> : " + pageSize );
					
					groupSize = Integer.parseInt(pagingMPVO.getGroupSize());
					logger.info("groupSize >>> : " + groupSize );
					
					curPage = Integer.parseInt(pagingMPVO.getCurPage());
					logger.info("curPage >>> : " + curPage );
					
					totalCount = Integer.parseInt(mvo.getTotalCount());
					logger.info("totalCount >>> : " + totalCount );
%>				
				<tbody>
					<tr>
						
						<td class="info"><%= mvo.getMemnum() %></td>
						<td><%= mvo.getMid() %></td>
						<td><%= mvo.getMname() %></td>
						<td><%= mvo.getMnick() %></td>
						<td><%= mvo.getMemail() %></td>
						<td><%= CodeUtils.getMgradeVal(mvo.getMgrade()) %></td>
						<td><img src="/oneYo/img/mem/<%= mvo.getMprofile() %>" style="width:50px; height:50px;"></td>
						<td><%= CodeUtils.getAdminRcate(mvo.getMcategory()) %></td>
						<td><%= mvo.getMwarning() %></td>
						<td><%= mvo.getInsertdate() %></td>
						<td class="delBtn">
							<input type="hidden" class="mid" value="<%= mvo.getMid() %>" />
							<button type="button" class="deleteBtn">탈퇴</button>
						</td>
					</tr>
				</tbody>
<%
				}//for
%>
				<tr>
					<td colspan="11">
					<jsp:include page="/WEB-INF/view/paging/paging.jsp" flush="true">
						<jsp:param name="url" value="adminMemSelectAll.ict" />
						<jsp:param name="pageSize" value="<%=pageSize %>" />
						<jsp:param name="groupSize" value="<%=groupSize %>" />
						<jsp:param name="curPage" value="<%=curPage %>"/>
						<jsp:param name="totalCount" value="<%=totalCount %>"/>
						</jsp:include>
					</td>
				</tr>
<%
			}//if
%>
			</table>
			<!-- -------------------------------페이지 전용 center------------------------------- -->
</div>

<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
		<span>팀 소개: ~~~</span>
	</div>
	<div>
		<span>회원 수: </span> / <span>레시피글 수: </span><br />
		<span>전문가팁글 수: </span> / <span>커뮤니티글 수: </span><br />
	</div>
</div>

</div>
</div>
</form>
</body>
</html>