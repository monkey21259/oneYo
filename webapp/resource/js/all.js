/**
 * 
 */


function hiddenAction() {
	
	
	$(document).on('click', '.searchBarBtn', function(){
		
//		if ($('#searchBar').hasClass('hidden_O')) {
//			
//			$('#searchBar').removeClass('hidden_O');
//			
//		}else {
//			
//			$('#searchBar').addClass('hidden_O');
//		}
		
		if ($('#searchBar').hasClass('hidden_X')) {
			
			$('#searchBar').removeClass('hidden_X');
			$('#searchText').focus();
			
		}else {
			
			$('#searchBar').addClass('hidden_X');
			$('#searchText').val('');
		}
	});
	
	
}
