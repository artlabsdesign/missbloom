
$(document).ready(function(){
    var link = $('#loginLink');
    var box = $('#loginBox');
    var form = $('#login-form');
    link.removeAttr('href');
    link.mouseup(function(login) {
        box.toggle();
        link.toggleClass('active');
    });
    form.mouseup(function() { 
        return false;
    });
    $(this).mouseup(function(login) {
        if(!($(login.target).parent('#subico_account').length > 0)) {
            link.removeClass('active');
            box.hide();
        }
    });
});
