var AjaxSearchContainerStatus = 0;

function loadAjaxSearchContainer(){
	if(AjaxSearchContainerStatus==0){
		$("#AjaxAutoSuggest").slideDown("slow");
		AjaxSearchContainerStatus = 1;
	}
}
function disableAjaxSearchContainer(){
	if(AjaxSearchContainerStatus==1){
		$("#AjaxAutoSuggest").slideUp("slow");
		AjaxSearchContainerStatus = 0;
	}
}
function customSetLocationAjaxSearchContainer(object){
	$("#AjaxAutoSuggest").css({
		"top": 35
	});
}