<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 변수 선언 방법 --%>
	<c:set var="RecipeList" value="${DataMap['RecipeList']}" />
	<c:set var="TipList" value="${DataMap['TipList'] }" />
	<c:set var="CommunityList" value="${DataMap['CommunityList']}" />
	<c:set var="NoticeList" value="${DataMap['NoticeList']}" />
	<c:set var="MemberList" value="${DataMap['MemList']}" />
	<c:set var="Count" value="${DataMap['Count'].get(0)}" />
	
	<%-- 글자를 화면에 출력 --%>
	<c:out value="${RecipeList.get(0).rnum}" /><br>
	<c:out value="${TipList.get(0).tnum}" /><br>
	<c:out value="${CommunityList.get(0).cnum}" /><br>
	<c:out value="${NoticeList.get(0).nnum}" /><br><br>
	
	<%-- 회원, 레시피, 팁, 커뮤니티 Total Count  --%>
	<c:out value="총 회원 수 : ${Count.membercnt}명" /><br>
	<c:out value="커뮤니티 글 : ${Count.communitycnt}개" /><br>
	<c:out value="레시피 글 : ${Count.recipecnt}개" /><br>
	<c:out value="전문가팁  : ${Count.tipcnt}개" /><br><br>
	
	<%-- for 문 사용법 1 --%>
	<c:forEach items="${RecipeList}" var="rvo">
		<c:out value="${rvo.rnum}" /><br>
		<c:out value="${rvo.rsubject}" /><br>
		<img src="/oneYo/img/recipe/${rvo.rphoto}" style="width:50px; height:50px;"><br>
		<c:out value="조회수 : ${rvo.rhit}" /> &nbsp;&nbsp;&nbsp;
		<c:out value="추천수 : ${rvo.likecnt}" /><br><br>
	</c:forEach>
	
	<%-- for 문 사용법2 --%>
	<div>
		<table style="border:1px solid black;">
			<c:forEach items="${MemberList}" var="mvo">
				<tr style="border:1px solid black;">
					<td style="border:1px solid black;">
						<c:out value="${mvo.mnum}" />
					</td>
				</tr>
				<tr>
					<td>
						<img src="/oneYo/img/mem/${mvo.mprofile}">
					</td>
				</tr>
				<tr>
					<td>
						<c:out value="${mvo.mnick}" />
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>