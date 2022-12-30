<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.warning.vo.WarningVO" %>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>

<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("adminWarningSelectAll 진입 >>> : "); 
%>
<%
	String wcategory = (String)request.getAttribute("wcategory");
	String wtnum = (String)request.getAttribute("wtnum");
	String mnick = (String)request.getAttribute("mnick");
	String wcontent = (String)request.getAttribute("wcontent");
	String insertdate = (String)request.getAttribute("insertdate");
%>
<%
	//	model.addAttribute("list", list);
	Object obj = request.getAttribute("list");
			if(obj == null){return; }
			List<WarningVO> list = (List<WarningVO>)obj;	
			
			int nCnt = list.size();
			
			WarningVO wvo = null;
			wvo = list.get(0);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>신고</title>
		
<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">

<!-- adminWarningSelectAll.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/levelup/adminLevelupSelectContent.css">
		
<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>

<!-- 제이쿼리 -->		
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			
//경고버튼 클릭		
		$(document).on("click", "#warningBtn", function(){
		
			//mid	
				let mnum = $("#mnum").val();			
				console.log("mnum(신고당한사람 회원번호) >>> : " + mnum);
			
			//mnick	
				let mnick = $(this).parents().find("#mnick").val();
				console.log("mnick(신고당한사람 닉네임) >>> : " + mnick);
				
				let result = confirm(mnick + '님을 경고 하시겠습니까?');
				
				if(result == true){
					let url = "adminCaution.ict";
					let reqType = "GET";
					let dataParam = {
							mnum :$("#mnum").val(),
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
						location.href="#";
					} //if else
			
		//성공했을때
			function whenSuccess(resData){
				if(resData == 'updateOK'){
					alert("경고 처리 되었습니다.");
				} 
			}
			
		//실패했을때
			function whenError(e){
				console("경고 처리 되지 않았습니다(error) : "  + e.responseText);
			} //whenError	
			
		});//warningBtn버튼클릭
	
//삭제버튼클릭	
		$(document).on("click", "#deleteBtn", function(){
		
			$("#adminwarningForm").attr({
				'action':"adminWarningDelete.ict",
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();		
			
		}); //deleteBtn
		
//		검색 바 없어졌다 생기기 액션주는 all.js 함수
		hiddenAction();
		
	}); //ready	

</script>
		
	</head>
	<body>
	<br>
		
		<form name="adminwarningForm" id="adminwarningForm">
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
		<h1 align="center">신고</h1>
			<table id="hi" align="center">
				<tr>
					<td>신고분야</td>
					<td colspan="4" style="text-align:left; width:400;">
						<font size="4" style="color:black"><%= CodeUtils.getWcategory(wcategory) %></font>
					</td>
					<td class="td_2"> 작성일자 : <%= insertdate %>
					</td>
				</tr> 
				<tr>
					<input type="hidden" id ="wnum" name="wnum" value="<%=wvo.getWnum()%>" />
					<input type="hidden" id ="mnum" name="mnum" value="<%=wvo.getWtmnum()%>" />
					<input type="hidden" id ="mnick" name="mnick" value="<%=wvo.getWtmnick()%>" />
					<td>신고당한 사람</td>
					<td><%= wvo.getWtmnick() %></td> 
					
					<td class="td_2">신고자</td>
					<td><%= mnick%></td>
				</tr>
				<tr>
					<td>
					<span name="wcontent" id="wcontent" rows="5" cols="100"><%= wcontent %></span>
					</td>
				</tr>		
				<tr>
					<td colspan="6" align="center">
					<br><br>
					<button type="button" class="btns" id="warningBtn">경고</button>
					<button type="button" class="btns" id="deleteBtn">삭제</button>
					
					</td>				
				</tr>
			</table>
			
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
			
		</form>
	</body>
</html>