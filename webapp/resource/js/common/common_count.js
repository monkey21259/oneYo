$(document).ready(function(){

	alert("import JavaScript jQuery ready()");
	
	$.ajax({
		url: '/oneYo/info.ict',
		type: 'GET',
		dataType: 'text',
		success: function (data) {
		
			let count_json = JSON.parse(data);
			console.log(count_json);
			
			$("#footer > div:nth-child(2) > span:nth-child(1)").append("총 회원 수 : " + count_json.MemberCnt + "명");
			$("#footer > div:nth-child(2) > span:nth-child(2)").append("레시피 수 : " + count_json.RecipeCnt + "개");
			$("#footer > div:nth-child(2) > span:nth-child(4)").append("전문가팁 수 :  " + count_json.TipCnt + "개");
			$("#footer > div:nth-child(2) > span:nth-child(5)").append("커뮤니티 글 수 : " + count_json.CommunityCnt + "개");
		}
	});
});