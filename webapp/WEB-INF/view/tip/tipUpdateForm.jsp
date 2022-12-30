<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="main.ict.tip.vo.TipVO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("tipUpdateForm.jsp 페이지 진입");
	
	TipVO tvo = null;
	List<TipVO> list = null;

	if(request.getAttribute("list") !=null) {
		list = (List<TipVO>)request.getAttribute("list");
		
		if(list !=null && list.size() == 1 ){
			tvo = list.get(0);
			logger.info("글 번호 : " + tvo.getTnum());
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0
							maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		
		<!-- 전체 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
		
		<!-- communityInsertForm.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/tip/tipUpdateForm.css">
		
		<!-- 제이쿼리cdn -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
		<script type="text/javascript">		

	$(document).ready(function(){
		
		console.log("tipUpdateForm.jsp");
		
		var options = $("#tcategory").children();
		console.log(options);
		options.each(function(i){
			console.log(options[i].value);
			option = options[i].value;
			if(option == <%= tvo.getTcategory() %>){
				$(this).prop("selected", true);
			}
		});
		
		$(document).on("click", "#inputBtn", function(){
			
			console.log("inputBtn 버튼 클릭 이벤트 발생");
			alert("inputBtn 버튼 클릭 이벤트 발생");
			
			var tsubject_val = $("#tsubject").val();
			console.log("글제목 : " + tsubject_val);
			
			var tcontent_val = $("#tcontent").val();
			console.log("글내용 : " + tcontent_val);
			
			var tsubject_chk = !(tsubject_val == null || tsubject_val == "" || tsubject_val.length == 0 || typeof tsubject_val == "undefined");
			console.log("글 제목 작성여부 : " + tsubject_chk);
			
			var tcontent_chk = !(tcontent_val == null || tcontent_val == "" || tcontent_val.length == 0 || typeof tcontent_val == "undefined");
			console.log("글 내용 작성여부 : " + tcontent_val);
			
			if(tsubject_chk && tcontent_chk){
				$("#tipUpdateForm").attr({
					"action": "tipUpdate.ict",
					"method": "POST",
					"enctype": "multipart/form-data"
				}).submit();
			}else{
				if(!tsubject_chk && !tcontent_chk){
					alert("글 제목과 내용을 입력하세요.");
					$("#tsubject").focus();
				}else if(!tcontent_chk){
					alert("글 내용을 입력하세요.");
					$("#tcontent").focus();
				}else if(!tsubject_chk){
					alert("글 제목을 입력하세요");
					$("#tsubject").focus();
				}
			}
		});
		
		$(document).on("click", "#resetBtn", function(){
			if(confirm("글 제목과 내용이 지워집니다. 계속 하시겠습니까?")){
				$("#tsubject").val("");
				$("#tcontent").val("");
				$("#tsubject").focus();
			}
		});
		
		//	검색 바 없어졌다 생기기 액션주는 all.js 함수
		hiddenAction();
		
	});

</script>
<style type="text/css">

	#container {
		text-align: center;
	}
	
	#tipSelectContentForm {
		display: inline-block;
	}
</style>

</head>
<body>
	<form id="tipUpdateForm">
	
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
	<div id="container">

		<table>
			<tr>
				<td>글제목</td>
				<td>
					<input type="text" id="tsubject" name="tsubject" placeholder="글 제목" size="50" value="<%= tvo.getTsubject() %>">
					<input type="hidden" id="tnum" name="tnum" value="<%= tvo.getTnum() %>">
				</td>
			</tr>
			<tr>
				<td>팁 분야</td>
				<td>
				<select id="tcategory" name="tcategory">
					<option value="00">요리
					<option value="01">주방관리
					<option value="02">재료정보
					<option value="99">기타
				</select>
				</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td>
					<textarea rows="10" cols="50" id="tcontent" name="tcontent" placeholder="글 내용" ><%= tvo.getTcontent() %></textarea>
					<br>
					<img src="/oneYo/img/tip/<%= tvo.getTphoto() %>">
				</td>
			</tr>
			<tr>
				<td>사진 선택</td>
				<td><input type="file" name="tphoto"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id="resetBtn" value="다시 쓰기" style="float:right;">
					<input type="button" id="inputBtn" value="글 수정" style="float:right;">
				</td>
			</tr>
			</table>
			</div>
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