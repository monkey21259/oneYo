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
<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("CommunitySelectAll 진입 >>> : "); 
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
		<title>관리자페이지</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0
							maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		<!-- adminHome.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/admin/adminHome.css">
		<!-- 제이쿼리cdn -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
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

				//	검색 바 없어졌다 생기기 액션주는 all.js 함수
				hiddenAction();
			}); //reday
		</script>
	</head> 
	<body>
	
	
<div id="sideBar">
	<div id="warningForm">
	신고
	</div>
	
	<div class="searchBarBtn">
	검색
	</div>
	
	<a href="javascript:window.scrollTo(0,0);">
	<div id="go_top">
	TOP▲
	</div>
	</a>
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

<div id="all_div">

<div id="header">
	<div id="logoLeft" class="logoSide">
	로고 옆공간 좌측
	</div>
	<div id="logoCenter">
		<a href="home.ict">
			<div id="logo">
			<img alt="오내요" src="/oneYo/resource/img/oneYo_logo.png">
			<!-- 379 X 186 -->
			</div>
		</a>
	</div>
	<div id="logoRight" class="logoSide">
	로고 옆공간 우측
	</div>
	
	<hr>
	
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
	
	<hr>
</div>

<div id="left">
좌측
</div>

<div id="center">
<!-- -------------------------------페이지 전용 center------------------------------- -->
	
	<div>
	<button type="button" id="memselectAllBtn">회원목록</button>
	</div>
	<form id="adminForm" name="adminForm">
<!-- 등업  -->	

	<h3>등업</h3>
		<hr>
		<button type="button" id="levelupmoreBtn" style="float: right;">더보기</button><br>
			<table border="1 solid">
				<thead>
					<tr>
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
						<td><%= i+1 %></td>
						<td><%= lvvo.getLvnum()%></td>
						<td><%= lvvo.getLvsubject()%></td>
						<td><img src="oneYo/img/levelup/<%= lvvo.getLvphoto()%>"></td>
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
			
<!-- 신고  -->	
	<h3>신고</h3>
		<hr>
		<button type="button" id="warningmoreBtn" style="float: right;">더보기</button><br>
			<table border="1 solid">
				<thead>
					<tr>
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
						<td><%= i+1 %></td>
						<td><%= wvo.getWtnum() %></td>
						<td><%= CodeUtils.getWcategory(wvo.getWcategory())%></td>
						<td><%= wvo.getWcontent()%></td>
						<td><%= wvo.getMnick()%></td>
						<td><%= wvo.getInsertdate()%></td>
					</tr>
<%
				} //for
			}//if
%>
				</tbody>
			</table>
						
<!-- 레시피  -->	
	<h3>레시피</h3>
		<hr>
		<button type="button" id="recipemoreBtn" style="float: right;">더보기</button><br>
			<table border="1 solid">
				<thead>
					<tr>
						<th>NO</th>
						<th>요리분야</th>
						<th>작성자</th>
						<th>제목</th>
						<th>사진</th>
						<th>조회수</th>
						<th>등록일</th>
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
						<td><%= i+1 %></td>
						<td><%= CodeUtils.getAdminRcategorys(rvo.getRcategory()) %></td>
						<td><%= rvo.getMnick() %></td><!-- 닉네임 -->
						<td><%= rvo.getRsubject() %></td>
						<td><img src="/oneYo/img/recipe/<%= rvo.getRphoto() %>" style="width:50px; height:50px"></td>
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
			
<!-- 전문가팁 -->	
		
	<h3>전문가팁</h3>
		<hr>
		<button type="button" id="tipmoreBtn" style="float: right;">더보기</button><br>
			<table border="1 solid">
				<thead>
					<tr>
						<th>NO</th>
						<th>팁분야</th>
						<th>작성자</th>
						<th>제목</th>
						<th>사진</th>
						<th>조회수</th>
						<th>등록일</th>
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
						<td><%= i+1 %></td>
						<td><%= CodeUtils.getTipcate(tvo.getTcategory())%></td>
						<td><%= tvo.getMnick()%></td><!-- 닉네임 -->
						<td><%= tvo.getTsubject()%></td>
						<td><img src="/oneYo/img/tip/<%= tvo.getTphoto()%>" style="width:50px; height:50px"></td>
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
			
<!-- 커뮤니티 -->	
	<h3>커뮤니티</h3>
		<hr>
		<button type="button" id="communitymoreBtn" style="float: right;">더보기</button><br>
			<table border="1 solid">
				<thead>
					<tr>
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
						<td><%= i+1 %></td>
						<td><%= cvo.getMnick() %></td> <!-- 닉네임 -->
						<td><%= cvo.getCsubject() %></td>
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
			<br>
		<div>
			<button type="button" id="noticeBtn">공지사항</button>
		</div>	
		
		</form>
		<!-- -------------------------------페이지 전용 center------------------------------- -->
</div>

<div id="right">
우측
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
		
	</body>
</html>