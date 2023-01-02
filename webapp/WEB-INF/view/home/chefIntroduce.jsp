<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		alert("chefIntroduce.jsp 페이지 jQuery ready() 함수 진입");
		console.log("chefIntroduce.jsp 페이지 jQuery ready() 함수 진입");
		
		var mnum = '<%= request.getParameter("mnum") %>';

		$.ajax({
			type:'GET',
			url: '/oneYo/recipe/' + mnum + '.ict',
			dataType : 'text',
			success : whenSuccessRecipe

		});
			
		$(document).on("click", "#recipeBtn", function(){
			alert("recipeBtn 버튼 클릭 이벤트 발생");
			
			$.ajax({
				type:'GET',
				url: '/oneYo/recipe/' + mnum + '.ict',
				dataType : 'text',
				success : whenSuccessRecipe

			});
		});
		
		$(document).on("click", "#tipBtn", function(){
			alert("tipBtn 버튼 클릭 이벤트 발생");
			
			$.ajax({
				type:'GET',
				url: '/oneYo/tip/' + mnum + '.ict',
				dataType : 'text',
				success : whenSuccessTip
			});
		});
		
		$(document).on("click", "#commentBtn", function(){
			alert("commentBtn 버튼 클릭 이벤트 발생");
			
			$.ajax({
				type:'GET',
				url: '/oneYo/community/' + mnum + '.ict',
				dataType : 'text',
				success : whenSuccessCommunity
			});
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
		console.log(json.recipe.length);
		
		for(var i=0; i < json.recipe.length; i++) {
			console.log(i + "번 index : " + json.recipe[i].rnum);
			console.log(i + "번 index : " + json.recipe[i].rsubject);
			console.log(i + "번 index : " + json.recipe[i].rphoto);
			recipe_html += "<tr><td style='display:none;'>" + json.recipe[i].rnum  + "</td></tr>";
			recipe_html += "<tr><td>" + json.recipe[i].rsubject  + "</td></tr>";
			recipe_html += "<tr><td><img src=/oneYo/img/recipe/" + json.recipe[i].rphoto  + "></td></tr>";
		}
		console.log(recipe_html);
		$("#contenttable").empty();
		$("#contenttable").append(recipe_html);
	}
	
	function whenSuccessTip(data) {
		console.log(data);
		let json = JSON.parse(data);
		let tip_html = "";
		
		console.log(json.mem[0].mgrade);
		console.log(json.mem[0].mnick);
		console.log(json.mem[0].mprofile);
		console.log(json.mem[0].mnum);
		console.log(json.tip.length);
		
		for(var i=0; i < json.tip.length; i++) {
			console.log(i + "번 index : " + json.tip[i].tnum);
			console.log(i + "번 index : " + json.tip[i].tsubject);
			console.log(i + "번 index : " + json.tip[i].tphoto);
			
			tip_html += "<tr><td style='display:none;'>" + json.tip[i].tnum  + "</td></tr>";
			tip_html += "<tr><td>" + json.tip[i].tsubject  + "</td></tr>";
			tip_html += "<tr><td><img src=/oneYo/img/tip/" + json.tip[i].tphoto  + "></td></tr>";
		}
		console.log(tip_html);
		$("#contenttable").empty();
		$("#contenttable").append(tip_html);
		
	}
	
	function whenSuccessCommunity(data) {
		console.log(data);
		let json = JSON.parse(data);
		let community_html = "";
		
		console.log(json.mem[0].mgrade);
		console.log(json.mem[0].mnick);
		console.log(json.mem[0].mprofile);
		console.log(json.mem[0].mnum);
		console.log(json.community.length);
		
		for(var i=0; i < json.community.length; i++) {
			console.log(i + "번 index : " + json.community[i].cnum);
			console.log(i + "번 index : " + json.community[i].csubject);
			console.log(i + "번 index : " + json.community[i].cphoto);
			
			community_html += "<tr><td style='display:none;'>" + json.community[i].cnum  + "</td></tr>";
			community_html += "<tr><td>" + json.community[i].csubject  + "</td></tr>";
			community_html += "<tr><td><img src=/oneYo/img/community/" + json.community[i].cphoto  + "></td></tr>";
		}
		$("#contenttable").empty();
		$("#contenttable").append(community_html);
	}

</script>
</head>
<body>
	<div id="container" style="text-align:center;">
		<div id="btnarea" style="display:inline-block;">
			<div style="width:100%">
				<button id="recipeBtn" style="width:200px;">레시피</button>
				<button id="tipBtn" style="width:200px;">전문가 팁</button>
				<button id="commentBtn" style="width:200px;">댓글목록</button>
			</div>
		</div><br />
		<div id="contentarea" style="display:inline-block;">
			<div>
				<table id="contenttable">
				</table>
			</div>
		</div>
	</div>
</body>
</html>