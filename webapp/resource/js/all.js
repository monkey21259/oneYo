/**
 * 
 */


function hiddenAction() {
	
	
	$(document).on('click', '#searchBarBtn', function(){
		
		if ($('#searchBar').hasClass('hidden_X')) {
			
			$('#searchBar').removeClass('hidden_X');
			
		}else {
			
			$('#searchBar').addClass('hidden_X');
		}
	});
	
	
}
