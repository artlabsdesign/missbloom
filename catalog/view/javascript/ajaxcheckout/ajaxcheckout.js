// Ajaxcheckout
$(".carousel-button-right-checkout").live('click',function(){ 
    right_carusel_checkout();
});
$(".carousel-button-left-checkout").live('click',function(){ 
    left_carusel_checkout();
});
function left_carusel_checkout(){
    var block_width = $('.carousel-block-checkout').width() + 20;
    $(".carousel-items-checkout .carousel-block-checkout").eq(-1).clone().prependTo(".carousel-items-checkout"); 
    $(".carousel-items-checkout").css({"left":"-"+block_width+"px"});
    $(".carousel-items-checkout").animate({left: "0px"}, 200); 
    $(".carousel-items-checkout .carousel-block-checkout").eq(-1).remove();
}
function right_carusel_checkout(){
    var block_width = $('.carousel-block-checkout').width() + 20;
    $(".carousel-items-checkout").animate({left: "-"+ block_width +"px"}, 200); 
    setTimeout(function () { 
        $(".carousel-items-checkout .carousel-block-checkout").eq(0).clone().appendTo(".carousel-items-checkout"); 
        $(".carousel-items-checkout .carousel-block-checkout").eq(0).remove(); 
        $(".carousel-items-checkout").css({"left":"0px"}); 
    }, 300);
}
$(document).ready(function() {
    var ajaxcheckoutresize = $('#ajaxorder').parents();
    ajaxcheckoutresize.colorbox.resize();
    $("#colorbox").draggable({ 
      cursor: "crosshair",
      containment: "parent"
    }); 
});
function AjaxCheckout(id) {  
    $.ajax({
        type: 'post',
        data: 'product_id=' + id,
        url: 'index.php?route=checkout/ajaxcheckout',
        dataType: 'html',
        success:  function(data) {
          $.colorbox({
            html:data,
            fastIframe: false,
            scrolling: false,
            initialWidth: false,
            innerWidth: false,
            maxWidth: false,
            height: false,
            initialHeight: false,
            innerHeight: false,
            onComplete : function() { 
                $(this).colorbox.resize(); 
            }
          });
        },
    });
}