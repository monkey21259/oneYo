/**
 * 
 */

//	폰트 210 굴림	===========================================================
(function(d) {
	var config = {
		kitId: 'jac3avt',
		scriptTimeout: 3000,
		async: true
	},
	h=d.documentElement,t=setTimeout(function(){h.className=h.className.replace(/\bwf-loading\b/g,"")+" wf-inactive";},config.scriptTimeout),tk=d.createElement("script"),f=false,s=d.getElementsByTagName("script")[0],a;h.className+=" wf-loading";tk.src='https://use.typekit.net/'+config.kitId+'.js';tk.async=true;tk.onload=tk.onreadystatechange=function(){a=this.readyState;if(f||a&&a!="complete"&&a!="loaded")return;f=true;clearTimeout(t);try{Typekit.load(config)}catch(e){}};s.parentNode.insertBefore(tk,s)
})(document);
//	폰트 210 굴림	===========================================================



//	#searchBar  >>>  보이게 안보이게 조정
function hiddenAction() {
	$(document).on('click', '.warningForm', function(){
		
//		if ($('#searchBar').hasClass('hidden_O')) {
//			$('#searchBar').removeClass('hidden_O');
//		}else {
//			$('#searchBar').addClass('hidden_O');
//		}
		
		if ($('#singo').hasClass('hidden_X')) {
			
			$('#singo').removeClass('hidden_X');
			$('#shadow').removeClass('hidden_X');
			$('#searchText').focus();
			
		}else {
			
			$('#singo').addClass('hidden_X');
			$('#shadow').addClass('hidden_X');
			$('#searchText').val('');
		}
	});
	
	$(document).on('click', '.searchBarBtn', function(){
		
//		if ($('#searchBar').hasClass('hidden_O')) {
//			$('#searchBar').removeClass('hidden_O');
//		}else {
//			$('#searchBar').addClass('hidden_O');
//		}
		
		if ($('#searchBar').hasClass('hidden_X')) {
			
			$('#searchBar').removeClass('hidden_X');
			$('#shadow').removeClass('hidden_X');
			$('#searchText').focus();
			
		}else {
			
			$('#searchBar').addClass('hidden_X');
			$('#shadow').addClass('hidden_X');
			$('#searchText').val('');
		}
	});
}

//	#sideBar + 홈 로고  >>>  홈으로 이동
function homeAction() {
	
	$(document).on('click', '.homeLink', function(){
		location.href = "home.ict";
	});
}
