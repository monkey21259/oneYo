<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.warning.vo.WarningVO" %>
 
<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("adminWarningSelectAll 진입 >>> : "); 
%>
<%
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;
	
	String searchCategory = "";



	Object obj = request.getAttribute("listAll");
	if(obj == null){
		out.println("<script>alert('검색된 게시글이 없습니다.'); location.href='adminWarningSelectAll.ict';</script>");
	}
	List<WarningVO> listAll = (List<WarningVO>)obj;
	if(listAll.size() == 0){
		out.println("<script>alert('검색된 게시글이 없습니다.'); location.href='adminWarningSelectAll.ict';</script>");
	}
	
	WarningVO wvo = null;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0
						maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- adminWarningSelectAll.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/warning/adminWarningSelectAll.css">		
		
		<!-- 페이징 기능 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/common/paging.css">
		
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
						
		<title>신고글조회</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
		
	$(document).ready(function(){
	
	//content로 전송
		$(".warningSelect").click(function(){
			
				let info = $(this).siblings();
				let info0 = info.get(0).value;
				let info1 = info.get(1).value;
				let info2 = info.get(2).value;
				let info3 = info.get(3).value;
				let info4 = info.get(4).value;
			
				console.log(info0);
				console.log(info1);
				console.log(info2);
				console.log(info3);
				console.log(info4);
				
				$("#wtnum").val(info0);
				$("#wcategory").val(info1);
				$("#wcontent").val(info2);
				$("#mnick").val(info3);
				$("#insertdate").val(info4);
				
			$("#adminWarningSelectAll").attr({
				'action':'adminWarningSelectContent.ict',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
			
		}); //warningSelect 클릭
		
		//	검색 바 없어졌다 생기기 액션주는 all.js 함수
		hiddenAction();
		
		
	});	//ready
	
</script>
	</head>
	<body>
		<form id="adminWarningSelectAll" name="adminWarningSelectAll">
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
	<h3>신고글조회</h3>
	<hr>
			<table border="1 solid">
				<thead>
					<tr>
						<td colspan="6">
							<button type="button" id="searchCategory-1" class="searchBtn" onclick="categorySearch('-1')">전체</button>&nbsp;
							<button type="button" id="searchCategory00" class="searchBtn" onclick="categorySearch('00')">욕설 및 비방</button>&nbsp;
							<button type="button" id="searchCategory01" class="searchBtn" onclick="categorySearch('01')">음란물</button>&nbsp;
							<button type="button" id="searchCategory02" class="searchBtn" onclick="categorySearch('02')">불법광고</button>&nbsp;
							<button type="button" id="searchCategory03" class="searchBtn" onclick="categorySearch('03')">도배성</button>&nbsp;
							<button type="button" id="searchCategory04" class="searchBtn" onclick="categorySearch('04')">주제와 맞지 않음</button>&nbsp;
							<button type="button" id="searchCategory99" class="searchBtn" onclick="categorySearch('99')">기타</button>
							<input type="hidden" id="searchCategory" name="searchCategory">
							<script>
								//search 프로퍼티 담아서 폼 보내기
								function categorySearch(s){
									if(s != '-1'){
										location.href="adminWarningSelectAll.ict?searchCategory=" + s;
										/*
										$("#adminWarningSelectAll").attr({
											'action':'adminWarningSelectAll.ict?searchCategory=' + String.valueOf(s),
											'method':'GET',
											'enctype':'application/x-www-form-urlencoded'
										}).submit();
										*/
									}else{
										location.href="adminWarningSelectAll.ict"
										/*
										$("#adminWarningSelectAll").attr({
											'action':'adminWarningSelectAll.ict',
											'method':'GET',
											'enctype':'application/x-www-form-urlencoded'
										}).submit();
										*/
									}//end of if-else
									
								}//end of categorySearch() function
							</script>
						</td>
					</tr>
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

			if(listAll.size() > 0){
				for(int i=0; i<listAll.size(); i++){ 
					wvo = listAll.get(i);
					
					searchCategory = wvo.getSearchCategory();
	%>
				<tbody>
					<tr>
						<input type="hidden" name="wtnum1" value="<%= wvo.getWtnum() %>">
						<input type="hidden" name="wcategory1" value="<%=wvo.getWcategory()%>">
						<input type="hidden" name="wcontent1" value="<%= wvo.getWcontent() %>">
						<input type="hidden" name="mnick1" value="<%= wvo.getMnick()%>">
						<input type="hidden" name="insertdate1" value="<%= wvo.getInsertdate()%>">
						<td><%= wvo.getWarningnum() %></td>
						<td><%= wvo.getWtnum() %></td>
						<td><%= CodeUtils.getWcategory(wvo.getWcategory())%></td>
						<td class="warningSelect"><%= wvo.getWcontent() %></td>
						<!--  -->
						<td><%= wvo.getMnick()%></td> <!-- 신고자 닉네임 -->
						<td><%= wvo.getInsertdate()%></td> <!-- 등록일 -->
					</tr>
<%
		totalCount = Integer.parseInt(wvo.getTotalCount());
		} //for
%>	
<%
			}//if
%>
<%
	//	model.addAttribute("pagingAWVO", wvo);
		Object obj_p = request.getAttribute("pagingAWVO");
		WarningVO pagingAWPVO = (WarningVO)obj_p;
		
		pageSize = Integer.parseInt(pagingAWPVO.getPageSize());
		logger.info("pageSize >>> : " + pageSize );
		
		groupSize = Integer.parseInt(pagingAWPVO.getGroupSize());
		logger.info("groupSize >>> : " + groupSize );
		
		curPage = Integer.parseInt(pagingAWPVO.getCurPage());
		logger.info("curPage >>> : " + curPage );
		
		logger.info("totalCount >>> : " + totalCount );

%>
		<tr>
			<td colspan="6">
				<jsp:include page="/WEB-INF/view/warning/adminWarningPaging.jsp" flush="true">
					<jsp:param value="adminWarningSelectAll.ict" name="url"/>
						<jsp:param value="" name="str"/>
						<jsp:param value="<%=pageSize %>" name="pageSize"/>
						<jsp:param value="<%=groupSize %>" name="groupSize"/>
						<jsp:param value="<%=curPage %>" name="curPage"/>
						<jsp:param value="<%=totalCount %>" name="totalCount"/>
						<jsp:param value="<%=searchCategory %>" name="searchCategory"/>
				</jsp:include>
			</td>
		</tr>
				</tbody>
			</table>
			<input type="hidden" id="wtnum" name="wtnum" value="">
			<input type="hidden" id="wcategory" name="wcategory" value="">
			<input type="hidden" id="wcontent" name="wcontent" value="">
			<input type="hidden" id="mnick" name="mnick" value="">
			<input type="hidden" id="insertdate" name="insertdate" value="">
			
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