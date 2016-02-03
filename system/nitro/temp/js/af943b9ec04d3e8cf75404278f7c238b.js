
function DoAjaxSearch(){
	var current_obj = $('#search input[name=\'search\']');
	
	$.ajax({
		url: 'index.php?route=common/header/search',
		data: 'filter_name=' + encodeURIComponent($(current_obj).val()),
		success: function(data){
			$('#AjaxAutoSuggestContent').html(data);
			
			customSetLocationAjaxSearchContainer(current_obj);
			
			if (AjaxSearchContainerStatus == 0  ){  
				loadAjaxSearchContainer();
			}	
		}
	});
}

$(document).ready(function(){
	$('#search input[name=\'search\']').typeWatch({
		callback: DoAjaxSearch,
		wait: 400,
		highlight: false,
		captureLength: 3
	})

	$('#search input[name=\'search\']').bind('keyup', function(){
		if ( ($(this).val().length < 3) && AjaxSearchContainerStatus ){
			disableAjaxSearchContainer();
		}
	});
	
	$("#search").mouseleave(function(){
		disableAjaxSearchContainer();
	});

	//Press Escape event!
	$(document).keypress(function(e){
		if(e.keyCode==27 && AjaxSearchContainerStatus==1){
			disableAjaxSearchContainer();
		}
	});

});
