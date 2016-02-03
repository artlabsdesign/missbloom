
$(document).ready(function() {
   $("#menu_mobile .accord-header").click(function() {
     // For active header definition
     $('.accord-header').removeClass('on');
     $(this).addClass('on');
     
     // Accordion actions
     if($(this).next("div.accord-content").is(":visible")){
       $(this).next("div.accord-content").slideUp("slow");
     } else {
       $("#menu_mobile .accord-content").slideUp("slow");
       $(this).next("div.accord-content").slideToggle("slow");
     }
  });
});
