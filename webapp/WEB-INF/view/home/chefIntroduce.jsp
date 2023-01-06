<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>
    
<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("chefIntroduce.jsp 페이지 진입");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		console.log("chefIntroduce.jsp 페이지 jQuery ready() 함수 진입");
		console.log("chefIntroduce.jsp 페이지 jQuery ready() 함수 진입");
		
		var mnum = '<%= request.getParameter("mnum") %>';

		// 페이지 진입 후 기본적으로 recipe 데이터가 보여짐
		$.ajax({
			type:'GET',
			url: '/oneYo/recipe/' + mnum + '.ict',
			dataType: 'text',
			success: whenSuccessRecipe,
			error: whenErrorRecipe
		});
			
		// 레시피버튼을 누를 경우
		$(document).on("click", "#recipeBtn", function(){
			console.log("recipeBtn 버튼 클릭 이벤트 발생");
			
			$.ajax({
				type:'GET',
				url: '/oneYo/recipe/' + mnum + '.ict',
				dataType : 'text',
				success : whenSuccessRecipe,
				error: whenErrorRecipe
			});
		});
		
		// 팁버튼을 누를 경우
		$(document).on("click", "#tipBtn", function(){
			console.log("tipBtn 버튼 클릭 이벤트 발생");
			
			$.ajax({
				type:'GET',
				url: '/oneYo/tip/' + mnum + '.ict',
				dataType : 'text',
				success : whenSuccessTip,
				error: whenErrorTip
			});
		});
		
		// 커뮤니티 누를 경우
		$(document).on("click", "#communitytBtn", function(){
			console.log("communityBtn 버튼 클릭 이벤트 발생");
			
			$.ajax({
				type:'GET',
				url: '/oneYo/community/' + mnum + '.ict',
				dataType : 'text',
				success : whenSuccessCommunity,
				error: whenErrorCommunity
			});
		});
		
		// 레시피 더보기
		$(document).on("click", "#recipeShowMore", function(){
			console.log("레시피  보기");
			location.href = "chefRecipeShowMore.ict?mnum=" + mnum;
		});
		
		// 전문가팁 더보기
		$(document).on("click", "#tipShowMore", function(){
			console.log("팁 더보기");
			location.href = "chefTipShowMore.ict?mnum=" + mnum;
		});
		
		// 커뮤니티 더보기
		$(document).on("click", "#communityShowMore", function(){
			console.log("커뮤니티 더 보기");
			location.href = "chefCommunityShowMore.ict?mnum=" + mnum;
		});
	});
	
	function whenSuccessRecipe(data) {
		console.log(data);
		let json = JSON.parse(data);
		let recipe_html = "";
		
		console.log(json.mem[0].mgrade);
		console.log(json.mem[0].mnick);
		console.log(json.mem[0].mprofile);
		console.log(json.mem[0].mnum);
		
		console.log("레시피 : " + data);
		console.log("레시피 : " + json.hasOwnProperty('recipe'));
		console.log("레시피 : " + Object.keys(json));
		
		if(json.hasOwnProperty('recipe')) {
			
			console.log(json.recipe.length);
			
			for(var i=0; i < json.recipe.length; i++) {
				console.log(i + "번 index : " + json.recipe[i].rnum);
				console.log(i + "번 index : " + json.recipe[i].rsubject);
				console.log(i + "번 index : " + json.recipe[i].rphoto);
				recipe_html += "<tr><td style='display:none;'>" + json.recipe[i].rnum  + "</td></tr>";
				recipe_html += "<tr><td>" + json.recipe[i].rsubject  + "</td></tr>";
				recipe_html += "<tr><td><img style=width:200px;height:200px; src=/oneYo/img/recipe/" + json.recipe[i].rphoto  + "></td></tr>";
			}
			console.log(recipe_html);
			$("#contentarea").empty();
			$("#showmore").empty();
			$("#showmore").append("<button id=recipeShowMore>더 보기</button>");
			$("#contentarea").append(recipe_html);
		}else{
			$("#contentarea").empty();
			$("#showmore").empty();
			$("#contentarea").append("작성한 글이 없습니다.");
		}
	}
	
	function whenErrorRecipe(request,status,error) {
		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
	
	function whenSuccessTip(data) {
		console.log(data);
		let json = JSON.parse(data);
		let tip_html = "";
		
		console.log(json.mem[0].mgrade);
		console.log(json.mem[0].mnick);
		console.log(json.mem[0].mprofile);
		console.log(json.mem[0].mnum);
		// tip 프로퍼티가 존재하는지 반환하는 함수 hasOwnProperty()
		console.log("전문가팁 : " + data);
		console.log("전문가팁 : " + json.hasOwnProperty('tip'));
		console.log("전문가팁 : " + Object.keys(json));
		
		if(json.hasOwnProperty('tip')) {
			console.log(json.tip.length);
			for(var i=0; i < json.tip.length; i++) {
				console.log(i + "번 index : " + json.tip[i].tnum);
				console.log(i + "번 index : " + json.tip[i].tsubject);
				console.log(i + "번 index : " + json.tip[i].tphoto);
				
				tip_html += "<tr><td style='display:none;'>" + json.tip[i].tnum  + "</td></tr>";
				tip_html += "<tr><td>" + json.tip[i].tsubject  + "</td></tr>";
				tip_html += "<tr><td><img style=width:200px;height:200px; src=/oneYo/img/tip/" + json.tip[i].tphoto  + "></td></tr>";
			}
			console.log(tip_html);
			$("#contentarea").empty();
			$("#showmore").empty();
			$("#showmore").append("<button id=tipShowMore>더 보기</button>");
			$("#contentarea").append(tip_html);
		}else{
			$("#contentarea").empty();
			$("#showmore").empty();
			$("#contentarea").append("작성한 글이 없습니다.");
		}
	}
	
	function whenErrorTip(request,status,error) {
		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
	
	function whenSuccessCommunity(data) {
		console.log(data);
		let json = JSON.parse(data);
		let community_html = "";
		
		console.log(json.mem[0].mgrade);
		console.log(json.mem[0].mnick);
		console.log(json.mem[0].mprofile);
		console.log(json.mem[0].mnum);
		// tip 프로퍼티가 존재하는지 반환하는 함수 hasOwnProperty()
		console.log("커뮤니티 : " + data);
		console.log("커뮤니티 : " + json.hasOwnProperty('tip'));
		console.log("커뮤니티: " + Object.keys(json));
		
		if(json.hasOwnProperty('community')){
			for(var i=0; i < json.community.length; i++) {
				console.log(i + "번 index : " + json.community[i].cnum);
				console.log(i + "번 index : " + json.community[i].csubject);
				console.log(i + "번 index : " + json.community[i].cphoto);
				
				community_html += "<tr><td style='display:none;'>" + json.community[i].cnum  + "</td></tr>";
				community_html += "<tr><td><img style=width:200px;height:200px; src=/oneYo/img/community/" + json.community[i].cphoto  + "></td></tr>";
				community_html += "<tr><td>" + json.community[i].csubject  + "</td></tr>";
			}
			$("#contentarea").empty();
			$("#showmore").empty();
			$("#showmore").append("<button id=communityShowMore>더 보기</button>");
			$("#contentarea").append(community_html);
			
		}else{
			$("#contentarea").empty();
			$("#showmore").empty();
			$("#contentarea").append("작성한 글이 없습니다.");
			
		}
	}
	
	function whenErrorCommunity(request,status,error) {
		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}

</script>
</head>
<body>
	<div id="container" style="text-align:center;">
		<div id="btnarea" style="display:inline-block;">
			<button id="recipeBtn" style="width:200px;">레시피</button>
			<button id="tipBtn" style="width:200px;">전문가 팁</button>
			<button id="communitytBtn" style="width:200px;">커뮤니티</button>
		</div>
		<div id="showmore">
		</div>

		<div id="contentarea">
		</div>
	</div>
</body>
</html>