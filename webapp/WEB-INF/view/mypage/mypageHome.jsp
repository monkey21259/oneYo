<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		console.log("mypageHome.jsp 페이지 제이쿼리 ready() 진입");
		
	});
	
	function profileModify(mnum){
		alert("프로필 영역 클릭");
		alert("mnum : " + mnum);
		// mnum 현재 상수 : 'M202212260012'
		location.href="mypagePWChk.ict?mnum=" + 'M202212260012';
	}
	
	function levelup(mnum){
		alert("등업 버튼 클릭");
		alert("mnum : " + mnum);
		location.href = "levelupSelectAll.ict?mnum=" + mnum;
	}
	
	function recipeSelect(rnum){
		alert("레시피 글 클릭");
		alert("rnum : " + rnum);
		location.href = "recipeSelectContent.ict?rnum=" + rnum;
	}
	
	function communitySelect(cnum){
		alert("커뮤니티 글 클릭");
		alert("cnum : " + cnum);
		location.href = "communitySelectContent.ict?cnum=" + cnum;
	}
	
	function tipSelect(tnum){
		alert("전문가 팁 글 클릭");
		alert("tnum : " + tnum);
		location.href = "tipSelectContent.ict?tnum=" + tnum;
	}

</script>
</head>
<body>
	<div id="container" style="text-align:center;">
	<c:set var="mnum" value="${mList.get(0).getMnum()}" />
		<div id="profile_div" onclick="profileModify('${mnum}')" style="border:1px solid black; float:left;">
			<c:forEach items="${mList}" var="mvo">
				<span id="mnum" style="display:none">
				${mvo.mnum}
				</span>
				<br />
				<span id="mnick" style="border:1px solid black;">
				${mvo.mnick}
				</span>
				<br />
				<img src="/oneYo/img/mem/${mvo.mprofile}" style="width:50px; height:50px; margin-top:3px;">
				<br />
				<c:if test="${mvo.mgrade eq '0'}"> 
					<span id="mgrade" style="border:1px solid black;">
					일반 등급
					</span>
				</c:if>
				<br />
			</c:forEach>
		</div>
		<div id="community_div" style="display:inline-block; float:left; margin-left:10px; border:1px solid black;">
			<c:forEach items="${cList}" var="cvo">
				<div style="border:1px solid black;" onclick="communitySelect('${cvo.cnum}')">
					<br />
					${cvo.cnum}
					<br />
					${cvo.csubject}
					<br />
					${cvo.ccontent}
					<br />
					${cvo.chit}
					<br />
					${cvo.insertdate}
					<br />
				</div>
			</c:forEach>
		</div>
		<div id="recipe_div" style="display:inline-block; float:left; margin-left:10px; border:1px solid black;">
			<c:forEach items="${rList}" var="rvo">
				<div style="border:1px solid black;" onclick="recipeSelect('${rvo.rnum}')">
					<br />
					${rvo.rnum}
					<br />
					${rvo.rsubject}
					<br />
					${rvo.rcontent}
					<br />
					${rvo.insertdate}
					<br />
				</div>
			</c:forEach>
		</div>
		<div id="tip_div" style="display:inline-block; float:left; margin-left:10px; border:1px solid black;">
			<c:forEach items="${tList}" var="tvo">
				<div style="border:1px solid black;" onclick="tipSelect('${tvo.tnum}')">
					<br />
					${tvo.tnum}
					<br />
					${tvo.tsubject}
					<br />
					${tvo.tcontent}
					<br />
					${tvo.insertdate}
					<br />
				</div>
			</c:forEach>
		</div>
		<div>
			<button type="button" onclick="levelup('${mnum}')">등업 목록</button>
		</div>
	</div>
</body>
</html>