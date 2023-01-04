$(document).ready(function(){

	alert("import JavaScript jQuery ready()");
	
	$.ajax({
		url: '/oneYo/info.ict',
		type: 'GET',
		dataType: 'text',
		success: function (data) {
		
			let count_json = JSON.parse(data);
			
			$("#footer > div:nth-child(2) > span:nth-child(1)").append(count_json.MemberCnt + "명");
			$("#footer > div:nth-child(2) > span:nth-child(2)").append(count_json.RecipeCnt + "개");
			$("#footer > div:nth-child(2) > span:nth-child(4)").append(count_json.TipCnt + "개");
			$("#footer > div:nth-child(2) > span:nth-child(5)").append(count_json.CommunityCnt + "개");
		}
	});
});