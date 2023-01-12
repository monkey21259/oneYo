<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>oneYo(오내요)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0
						maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!-- 제이쿼리cdn -->


<!-- 전체 css -->
<link rel="stylesheet" href="/oneYo/resource/css/all.css">

<!-- recipePage.jsp 전용 -->
<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipePage.css">	

	<script type="text/javascript">
		
			$(document).ready(function() {
				
				$(document).on("click", "#jeryoBtn_r", function(){
					
					let jeryo = $("#jeryo_r");
					let jeryoList = $("#jeryoList");
					let jeryoAtag = $("<a>").attr("onclick", "deleteJeryo(this)");
					console.log("입력된 재료 : " + jeryo.val());
					console.log("입력된 재료 문자열 길이 : " + jeryo.val().length);
					
					if(jeryo !=null && jeryo.val().replaceAll(" ", "").length > 0 && typeof jeryo !='undefined') {
						console.log("정상 입력된 재료 : " + jeryo.val());
						console.log("jeryoList text : " + jeryoList.text());
						if (jeryoList.text() == '등록된 재료가 없습니다.') {
							jeryoList.text("");
						}
						console.log(jeryoList.text().split('#').length);
						if(jeryoList.text().split('#').length <= 3) {
							jeryoList.append(jeryoAtag.text("#" + jeryo.val() + " "));
							jeryo.val("");
							jeryo.focus();
						}else {
							alert("재료는 최대 3개까지만 입력 가능합니다!");
						}
					}
				});
				
				$(document).on("click", "#recipeSearchBtn_r", function(){
					
					
					let jeryoList = $("#jeryoList");
					console.log(jeryoList.text());
					
					if(jeryoList.text() != '등록된 재료가 없습니다.') {
						if(jeryoList.text() !=null && jeryoList.text().length > 0 && typeof jeryoList.text() !='undefined') {
							
							
							let jeryo = jeryoList.text().replaceAll(" ", "");
							jeryo = jeryo.split("#");
							jeryo.shift();
							console.log(jeryo);
							
							if(jeryo !=null) {
								let queryString = "?";
								for(let i=0; i<jeryo.length; i++) {
									if(i != (jeryo.length - 1)) {
										queryString += "rjeryo=" + jeryo[i] + "&";
									}else if(i == (jeryo.length - 1)) {
										queryString += "rjeryo=" + jeryo[i];
									}
								}
								console.log(queryString);
								$("#jeryo_r").text("");
								$("#jeryoList").text("");
								location.href = "recipeSearch.ict" + queryString;
							}
						}
					}
				});
			});
			
			function postClick(obj) {  // favorPostTitle
				
				let before_num = $(".postTitles").attr('data-num');
				let after_num = obj.attr("data-num");  // 1 ~ 4
				
				if (before_num == after_num) {
					console.log("동일한 카테고리입니다.");
					return false;
				}
				
				// 값 갱신
				$(".postTitles").attr('data-num', after_num);

				// 클릭한 것에 해당하는 게시판 글 z-index 변경하기.
				$(".favorPost").each(function(i, elem) {
// 					console.log($(elem).attr("data-value"));
// 					console.log($(obj).attr("data-value"));
					if ($(elem).attr("data-value") == $(obj).attr("data-value")) {
						$(elem).css("z-index", 1);
					} else {
						$(elem).css("z-index", 0);
					}
				});
			}
			
			function deleteJeryo(obj) {
				if(confirm("재료를 제거하시겠습니까?")) {
					obj.remove();	
				}
			}
			
		</script>
	
</head>
<body>
<form id="recipeSerach" name="recipeSerach">

<!-- -------------------------------페이지 전용 center------------------------------- -->
	
	<div id="anne_r">
		<p id="subject_r">재료 검색</p>
	</div>
	
	
		<table class="table-fill_r_pop">
			<tr>
				<td id="recipe_pop_info">
					검색하실 재료를 입력하면 해당 재료의 레시피가 검색됩니다.
				</td>
			</tr>
			<tr>
				<td>
					<img src="/oneYo/resource/img/find.png" id="find_img">
				</td>
			</tr>
			
			<tr>
				<td>
					<input id="jeryo_r" type="text">
					<input id="jeryoBtn_r" type="button" class="recipesearch_Btn" value="재료추가">
				</td>
			</tr>
			<tr>
				<td class="jeryo_i">
					재료 검색은 최대 3개까지  입력 가능합니다.
				</td>
			</tr>
			<tr>
				<td class="jeryoList_td">
					<span id="jeryoList">등록된 재료가 없습니다.</span>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" id="recipeSearchBtn_r" class="recipesearch_Btn" value="검색하기">
				</td>
			</tr>
		</table>
</form>
		<!-- -------------------------------페이지 전용 center------------------------------- -->
</body>
</html>