<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index.jsp</title>
		<style type="text/css">
			
			#container {
				text-align: center;
			}
			
			#test_content {
				display: inline-block;
			}
			
		</style>
	</head>
	<body>
		<div id="container">
			<div id="test_content">
				<h3> oneYo </h3>
				<a href="memGrade.ict">회원가입 넘어가기 테스트~~~~</a>
				
				<!-- Community -->
				<hr>
				<a href="communityInsertForm.ict">커뮤니티 게시글 등록</a><br>
				<a href="communitySelectAll.ict">커뮤니티 게시판 전체보기</a><br>
				<!-- Tip (전문가 팁) -->
				<hr>
				<b>전문가 팁</b><br>
				<a href="tipInsertForm.ict">전문가 팁 등록</a><br>
				<a href="tipSelectAll.ict">전문가 팁 전체조회</a><br>
				<hr>
				<b>마이페이지</b><br>
				<a href="mypageHome.ict">마이페이지 메인</a><br>
				<hr>
				<!-- 공지사항 -->
				<a href="noticeInsertForm.ict">공지사항 게시글 등록 테스트</a><br>
				<a href="noticeSelectAll.ict">공지사항 게시글 조회 테스트</a>
				<!-- Recipe -->
				<br /><hr />
				<b>RECIPE</b><br />
				<a href="/oneYo/recipeInsertForm.ict">레시피 게시글 등록</a><br />
				<a href="/oneYo/recipeSelectAll.ict">레시피 전체 조회</a>
				<hr /><br />
				<a href="rssTest.ict">RSS 테스트</a>
				<hr>
				<a href="adminHome.ict">관리자 메인페이지</a><br>
				<hr>
				<!-- Main Home -->
				<a href="home.ict">Main Home</a><br>
				<hr>
				<!-- memSelct -->
				<a href="home.ict">아직 링크 안달렸어용</a><br>
				<hr>
				<!-- mail -->
<!-- 				<a href="memInsertEmail.ict?memail=onnu0623@gmail.com&mgrade=0">mail</a><br> -->
<!-- 				<hr> -->
				<!-- 로그인 -->
				<a href="loginForm.ict">로그인 테스트</a>
				<hr>
				<!-- 댓글 테스트 -->
				<a href="commentForm.ict">댓글 테스트</a>
			</div>
		</div>
	</body>
</html> 