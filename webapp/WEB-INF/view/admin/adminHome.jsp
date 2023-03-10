<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>   
<%@ page import="java.util.List" %>

<%@ page import="main.ict.levelup.vo.LevelupVO" %>
<%@ page import="main.ict.warning.vo.WarningVO" %>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.tip.vo.TipVO" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>
<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.common.O_Session" %>
<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunitySelectAll 진입 >>> : "); 
	
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
	String mid = (String)oSession.getAttribute(request, "mid");
%>    

<%
//등업 : 	model.addAttribute("adminLevelupSelectAll", listLV);
		Object obj_lv = request.getAttribute("adminLevelupSelectAll");
		logger.info("obj_lv >>> : " + obj_lv);
		if(obj_lv == null){return; }
		List<LevelupVO> listLV = (List<LevelupVO>)obj_lv; 
		
		LevelupVO lvvo = null;
		
		logger.info("등업글 갯수 >>> : " + listLV.size());


//신고 : model.addAttribute("adminWarningSelectAll", listW);
	Object obj_w = request.getAttribute("adminWarningSelectAll");
	logger.info("obj_w >>> : " + obj_w);
		if(obj_w == null){return; }
		List<WarningVO> listW = (List<WarningVO>)obj_w; 
		
		WarningVO wvo = null;
		
		logger.info("신고글 갯수 >>> : " + listW.size());

//레시피 : model.addAttribute("adminRecipeSelectAll", listR);
		Object obj_r = request.getAttribute("adminRecipeSelectAll");
		if(obj_r == null){return; }
		List<RecipeVO> listR = (List<RecipeVO>)obj_r; 
		
		RecipeVO rvo = null;
		
		logger.info("레시피 갯수 >>> : " + listR.size());
		
//전문가팁 : 	model.addAttribute("adminTipSelectAll", listT);
		Object obj_t = request.getAttribute("adminTipSelectAll");
		if(obj_t == null){return; }
		List<TipVO> listT = (List<TipVO>)obj_t; 
		
		TipVO tvo = null;
		
		logger.info("전문가팁 갯수 >>> : " + listT.size());


//커뮤니티 : model.addAttribute("adminCommunitySelectAll", listC);
		Object obj_c = request.getAttribute("adminCommunitySelectAll");
		if(obj_c == null){return; }
		List<CommunityVO> listC = (List<CommunityVO>)obj_c; 
		
		CommunityVO cvo = null;
		
		logger.info("커뮤니티 갯수 >>> : " + listC.size());

%>    


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
			<title>oneYo(오내요)</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0
							maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<!-- 제이쿼리cdn -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		<!-- adminHome.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/admin/adminHome.css">
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				//회원목록
				$(document).on("click", "#memselectAllBtn", function(){
					$("#adminForm").attr({
						"action":"adminMemSelectAll.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"	
					}).submit();
					
				});
				
				//공지사항
				$(document).on("click", "#noticeBtn", function(){
					$("#adminForm").attr({
						"action":"noticeSelectAll.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"	
					}).submit();
					
				});
				 
				//등업
				$(document).on("click", "#levelupmoreBtn", function(){
					$("#adminForm").attr({
						"action":"adminLevelupSelectAll.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"	
					}).submit();
					
				}); //levelupmoreBtn
				
				//신고
				$(document).on("click", "#warningmoreBtn", function(){
					$("#adminForm").attr({
						"action":"adminWarningSelectAll.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"	
					}).submit();
					
				}); 
				
				//레시피
				$(document).on("click", "#recipemoreBtn", function(){
					$("#adminForm").attr({
						"action":"recipeSelectAll.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"	
					}).submit();
					
				}); 
				
				//전문가팁
				$(document).on("click", "#tipmoreBtn", function(){
					$("#adminForm").attr({
						"action":"tipSelectAll.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"	
					}).submit();
					
				}); 
				
				//커뮤니티
				$(document).on("click", "#communitymoreBtn", function(){
					$("#adminForm").attr({
						"action":"communitySelectAll.ict",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"	
					}).submit();
					
				}); 
				
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
				
			}); //reday
		</script>
	</head> 
	<body>
	
	
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
<!-- 		<li class="item"> -->
<!-- 			<div id="warningForm"> -->
<!-- 			<span> -->
<!-- 			신고 -->
<!-- 			</span> -->
<!-- 			</div> -->
<!-- 		</li> -->
		<li class="item">
			<div class="warningForm">
			<span>
			신고
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
	<div>
		<jsp:include page="/WEB-INF/view/recipe/recipePage.jsp" flush="true">
				<jsp:param value="" name=""/>
		</jsp:include>	
	</div>
</div>

<div id="singo" class="hidden_X">
	<div class="warningForm">
		X
	</div>
	<jsp:include page="/WEB-INF/view/warning/warningPage.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>	
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
	</div>
	
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
						<a href="#" class="menu_link">
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
							엔터테인먼트
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
				</div>
			</li>
		</ul>
		</nav>
	</div>
	
</div>

<div id="center">
<!-- -------------------------------페이지 전용 center------------------------------- -->
	
	<form id="adminForm" name="adminForm">
		<div class="neyongContainer">
			<div class="btnDiv">
				<br>
				<button type="button" id="memselectAllBtn" class="centerBtn">회원목록</button>&nbsp;&nbsp;&nbsp;
				<button type="button" id="noticeBtn" class="centerBtn">공지사항</button>
			</div>
<!-- 등업  -->
			<div class="gubunDiv">
				<div class="gubunLeft">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b class="gubun">등업</b>
				</div>
				<div class="gubunRight">
					<button type="button" id="levelupmoreBtn" class="showMoreBtn">더보기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<br><br>
				<hr>
				<br><br>
			</div>
			<div class="tableContainer">
				<table>
					<thead>
						<tr class="headTr">
							<th>NO</th>
							<th>등업번호</th>
							<th>등업제목</th>
							<th>등업사진</th>
							<th>등업신청자</th>
							<th>등업신청일</th> <!-- 작성일 -->
							<th>등업처리여부</th>
						</tr>
					</thead>
	<%
	 			
					String process = null;
					if(listLV.size() > 0){
					for(int i=0; i<listLV.size(); i++){
						lvvo = listLV.get(i);
						
						
						if(lvvo.getProcessyn().equals("0")){
							process = "대기 중";
						};
	%>
					<tbody>
						<tr>
							<td><%= 5-i %></td>
							<td><%= lvvo.getLvnum()%></td>
							<td class="leftTd"><%= lvvo.getLvsubject()%></td>
							<td><img src="http://localhost:8088/oneYo/img/levelup/<%= lvvo.getLvphoto()%>"></td>
							<td><%= lvvo.getMnick()%></td> <!-- 닉네임 -->
							<td><%= lvvo.getInsertdate()%></td>
							<td><%= process%></td>
						</tr>
					</tbody>
					<%
					} //for
	 			} //if				
					%>
				</table>
			</div>
<!-- 신고  -->	
			<div class="gubunDiv">
				<div class="gubunLeft">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b class="gubun">신고</b>
				</div>
				<div class="gubunRight">
					<button type="button" id="warningmoreBtn" class="showMoreBtn">더보기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<br><br>
				<hr>
				<br><br>
			</div>
			<div class="tableContainer">
				<table>
					<thead>
						<tr class="headTr">
							<th>NO</th>
							<th>신고글번호</th> <!-- 신고당한 글번호 -->
							<th>신고분야</th>
							<th>신고내용</th>
							<th>신고자</th>
							<th>신고날짜</th> 
						</tr>					
					</thead>
	<%
				if(listW.size() > 0){
					for(int i=0; i<listW.size(); i++){
						wvo = listW.get(i);
						
						
	%>
					<tbody>
						<tr>
							<td><%= 5-i %></td>
							<td><%= wvo.getWtnum() %></td>
							<td><%= CodeUtils.getWcategory(wvo.getWcategory())%></td>
							<td class="leftTd"><%= wvo.getWcontent()%></td>
							<td><%= wvo.getMnick()%></td>
							<td><%= wvo.getInsertdate()%></td>
						</tr>
	<%
					} //for
				}//if
	%>
					</tbody>
				</table>
			</div>
			
<!-- 레시피  -->	
			<div class="gubunDiv">
				<div class="gubunLeft">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b class="gubun">레시피</b>
				</div>
				<div class="gubunRight">
					<button type="button" id="recipemoreBtn" class="showMoreBtn">더보기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<br><br>
				<hr>
				<br><br>
			</div>
			<div class="tableContainer">
				<table>
					<thead>
						<tr class="headTr">
							<th>NO</th>
							<th>요리분야</th>
							<th>작성자</th>
							<th>제목</th>
							<th>사진</th>
							<th>조회수</th>
							<th>작성일</th>
							<th>신고</th>
						</tr>					
					</thead>
	<%
				if(listR.size() > 0){
					for(int i=0; i<listR.size(); i++){
						rvo = listR.get(i);
						
	%>				
					<tbody>
						<tr>
							<td><%= 5-i %></td>
							<td><%= CodeUtils.getAdminRcategorys(rvo.getRcategory()) %></td>
							<td><%= rvo.getMnick() %></td><!-- 닉네임 -->
							<td class="leftTd"><%= rvo.getRsubject() %></td>
							<td><img src="/oneYo/img/recipe/<%= rvo.getRphoto() %>"></td>
							<td><%= rvo.getRhit() %></td>
							<td><%= rvo.getInsertdate() %></td>
							<td><%= rvo.getWarning() %></td>
						</tr>
					</tbody>
	<%
					}//for
				}//if
	%>
				</table>
			</div>
				
<!-- 전문가팁 -->
			<div class="gubunDiv">
				<div class="gubunLeft">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b class="gubun">전문가 팁</b>
				</div>
				<div class="gubunRight">
					<button type="button" id="tipmoreBtn" class="showMoreBtn">더보기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<br><br>
				<hr>
				<br><br>
			</div>
			<div class="tableContainer">
				<table>
					<thead>
						<tr class="headTr">
							<th>NO</th>
							<th>팁분야</th>
							<th>작성자</th>
							<th>제목</th>
							<th>사진</th>
							<th>조회수</th>
							<th>작성일</th>
							<th>신고</th>
						</tr>					
					</thead>
	<%
				if(listT.size() > 0){
					for(int i=0; i<listT.size(); i++){
						tvo = listT.get(i);
	%>							
					<tbody>
						<tr>
							<td><%= 5-i %></td>
							<td><%= CodeUtils.getTipcate(tvo.getTcategory())%></td>
							<td><%= tvo.getMnick()%></td><!-- 닉네임 -->
							<td class="leftTd"><%= tvo.getTsubject()%></td>
							<td><img src="/oneYo/img/tip/<%= tvo.getTphoto()%>"></td>
							<td><%= tvo.getThit()%></td>
							<td><%= tvo.getInsertdate()%></td>
							<td><%= tvo.getWarning()%></td>
						</tr>
					</tbody>
	<%
					}//for
				}//if
	%>		
				</table>
			</div>
				
<!-- 커뮤니티 -->	
			<div class="gubunDiv">
				<div class="gubunLeft">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b class="gubun">커뮤니티</b>
				</div>
				<div class="gubunRight">
					<button type="button" id="communitymoreBtn" class="showMoreBtn">더보기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<br><br>
				<hr>
				<br><br>
			</div>
			<div class="tableContainer">
				<table>
					<thead>
						<tr class="headTr">
							<th>NO</th>
							<th>작성자</th>
							<th>제목</th>
							<th>조회수</th>
							<th>작성일</th>
							<th>신고</th>
						</tr>					
					</thead>
	<%
				if(listC.size() > 0){
					for(int i=0; i<listC.size(); i++){
						cvo = listC.get(i);
						
	%>					
					<tbody>
						<tr>
							<td><%= 5-i %></td>
							<td><%= cvo.getMnick() %></td> <!-- 닉네임 -->
							<td class="leftTd"><%= cvo.getCsubject() %></td>
							<td><%= cvo.getChit() %></td>
							<td><%= cvo.getInsertdate() %></td>
							<td><%= cvo.getWarning() %></td>
						</tr>
					</tbody>
	<%
					}//for
				}//if
	%>		
				</table>
			</div>
			<br><br><br>
		</div>
	</form>
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
		<form id="logoutForm">
 			<input type="hidden" id="mid" name="mid" value="<%=mid %>" />
 		</form>
	</body>
</html>