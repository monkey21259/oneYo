/**
 * 
 */
 
 //좋아요 insert
 function likeInsert(mnum, likethis){
 	let urlVal = "likeInsert.ict";
	//let mnumVal =
	let likethisVal = $('#' + likethis).val();
	
	$.ajax({
		url: urlVal,
		method: "POST",
		data: { mnum: 'M202212260012',
				likethis: likethisVal},
		success: whenSuccess,
		error: whenError
	});//end of ajax
	
	function whenSuccess(resData){
		if(resData == "LIKE_YES"){
			$('#notlike').replaceWith('<span id="like"><img src="/oneYo/img/like/like.png" width="20" height="20"></span>');
			likeCount(likethis);
		}else{
			alert("예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
		}//end of if-else
	}//end of whenSuccess() function
	
	function whenError(e){
		alert("예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
	}//end of whenError() function
	
 }//end of likeInsert() function
 
 //좋아요 취소
 function likeDelete(mnum, likethis){
	let urlVal = "likeDelete.ict";
	//let mnumVal =
	let likethisVal = $('#' + likethis).val();
	
	$.ajax({
		url: urlVal,
		method: "POST",
		data: { mnum: 'M202212260012',
				likethis: likethisVal},
		success: whenSuccess,
		error: whenError
	});//end of ajax
	
	function whenSuccess(resData){
		if(resData == "DEL_YES"){
			$('#like').replaceWith('<span id="notlike"><img src="/oneYo/img/like/notlike.png" width="20" height="20"></span>');
			likeCount(likethis);
		}else{
			alert("예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
		}//end of if-else
	}//end of whenSuccess() function
	
	function whenError(e){
		alert("예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
	}//end of whenError() function
	
 }//end of likeDelete() function
 
 //좋아요 카운트
 function likeCount(likethis){
 	let urlVal = "likeCount.ict"
 	let likethisVal = $('#' + likethis).val();
 	
 	$.ajax({
 		url: urlVal,
 		method: "POST",
 		data: {likethis: likethisVal},
 		success: whenSuccess,
 		error: whenError
 	});//end of ajax
 	
 	function whenSuccess(resData){
 		$('#likeCount').text(resData);
 	}//end of whenSuccess() function
 	
 	function whenError(e){
 		alert("예기치 못한 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
 	}//end of whenError() function
 	
 	
 }//end of likeCount() function