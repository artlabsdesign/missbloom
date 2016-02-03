if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function (searchElement /*, fromIndex */ ) {
        "use strict";
        if (this == null) {
            throw new TypeError();
        }
        var t = Object(this);
        var len = t.length >>> 0;
        if (len === 0) {
            return -1;
        }
        var n = 0;
        if (arguments.length > 1) {
            n = Number(arguments[1]);
            if (n != n) { // shortcut for verifying if it's NaN
                n = 0;
            } else if (n != 0 && n != Infinity && n != -Infinity) {
                n = (n > 0 || -1) * Math.floor(Math.abs(n));
            }
        }
        if (n >= len) {
            return -1;
        }
        var k = n >= 0 ? n : Math.max(len - Math.abs(n), 0);
        for (; k < len; k++) {
            if (k in t && t[k] === searchElement) {
                return k;
            }
        }
        return -1;
    }
}

(function( $ ) {

	$.fn.customCheckbox = function() {

		var selector = this.selector;

		return this.each(function() {

			// Get the original element
			var el = this;
		
			if ($(el).css("display")!="none") {
			// Hide the checkbox
			$(this).hide();

			// Create replacement element
			var rep = $('<a href="#"><span></span></a>').addClass('ls-checkbox').insertAfter(this);

			// Set default state
			if($(this).is(':checked')) {
				$(rep).addClass('on');
			} else {
				$(rep).addClass('off');
			}
			}
		});
	};

})( jQuery );

var LayerSlider = {

	uploadInput : null,
	dragContainer : null,
	dragIndex : 0,
	newIndex : 0,
	timeout : 0,
	counter : 0,

	setCallbackBoxesWidth : function() {

		jQuery('.ls-callback-box').width( (jQuery('.wrap').width() - 26) / 3);
	},

	toggleTransitions : function(el) {

		if(jQuery(el).is(':checked')) {

			// Hide slide rows
			jQuery(el).closest('tbody').find('.ls-old-transitions').addClass('ls-hidden');

			// Hide old transition items
			jQuery(el).closest('tr').find('.old').addClass('ls-hidden');

			// Show new transition items
			jQuery(el).closest('tr').find('.new').removeClass('ls-hidden');

		} else {


			// Show slide rows
			jQuery(el).closest('tbody').find('.ls-old-transitions').removeClass('ls-hidden');

			// Hide old transition items
			jQuery(el).closest('tr').find('.old').removeClass('ls-hidden');

			// Show new transition items
			jQuery(el).closest('tr').find('.new').addClass('ls-hidden');
		}
	},

	generatePreview : function() {
		

		// Get preview element
		var preview = jQuery('#tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' .ls-preview');
        
		// Get the draggable element
		var draggable = preview.find('.draggable');

		// Get sizes
		var width = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][width]"]').val();
		var height = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][height]"]').val();
		var sub_container = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][sublayercontainer]"]').val();
      
		// Which width?
		if(sub_container != '' && sub_container != 0) {
			width = sub_container;
		}

		// Set sizes
		preview.add(draggable).css({ width : width, height : height });
		preview.parent().css({ width : width });

		// Get backgrounds
		var bgColor = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][transparent]"]').val();
		var bgImage = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][backgroundimage]"]').val();
		if (bgImage!="") bgImage=uploadPath+bgImage;
       
		// Set backgrounds
		if(bgColor != '') {
			preview.css({ backgroundColor : bgColor });
		} else {
			preview.css({ backgroundColor : 'transparent' });
		}

		if(bgImage != '') {
			preview.css({ backgroundImage : 'url('+bgImage+')' });
		} else {
			preview.css({ backgroundImage : 'none' });
		}

		// Get yourLogo
		var yourLogo = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][yourlogo]"]').val();
		var yourLogoStyle = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][yourlogostyle]"]').val();
		
		// Remove previous yourLogo
		preview.parent().find('.yourlogo').remove();

		// Set yourLogo
		if(yourLogo && yourLogo != '') {
			var logo = jQuery('<img src="'+uploadPath+yourLogo+'" class="yourlogo">').prependTo( jQuery(preview).parent() );
			logo.attr('style', yourLogoStyle);

			var oL = oR = oT = oB = 'auto';

			if( logo.css('left') != 'auto' ){
				var logoLeft = logo[0].style.left;
			}
			if( logo.css('right') != 'auto' ){
				var logoRight = logo[0].style.right;
			}
			if( logo.css('top') != 'auto' ){
				var logoTop = logo[0].style.top;
			}
			if( logo.css('bottom') != 'auto' ){
				var logoBottom = logo[0].style.bottom;
			}

			if( logoLeft && logoLeft.indexOf('%') != -1 ){
				oL = width / 100 * parseInt( logoLeft ) - logo.width() / 2;
			}else{
				oL = parseInt( logoLeft );
			}

			if( logoRight && logoRight.indexOf('%') != -1 ){
				oR = width / 100 * parseInt( logoRight ) - logo.width() / 2;
			}else{
				oR = parseInt( logoRight );
			}

			if( logoTop && logoTop.indexOf('%') != -1 ){
				oT = height / 100 * parseInt( logoTop ) - logo.height() / 2;
			}else{
				oT = parseInt( logoTop );
			}

			if( logoBottom && logoBottom.indexOf('%') != -1 ){
				oB = height / 100 * parseInt( logoBottom ) - logo.height() / 2;
			}else{
				oB = parseInt( logoBottom );
			}

			logo.css({
				left : oL,
				right : oR,
				top : oT,
				bottom : oB
			});
		}
		
		// Get layer background
		var background = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][background]"]').val();
		if (background!="") background=uploadPath+background;
		
		// Set layer background
		if(background != '') {
			draggable.css({
				backgroundImage : 'url('+background+')',
				backgroundPosition : 'center center'
			});
		} else {
			draggable.css({
				backgroundImage : 'none'
			});
		}

		// Empty draggable
		draggable.children().remove();
				
		// Iterate over the sublayers
		
		var j;
		for(j=0;j<layer_row[module_current][slide_current[module_current]];j++) {
		if ($("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][html]']").length ) {
			
			if($("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][image]']").val()){
			// Get sublayer type
			var type = 'img';
			var url = $("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+slide_current[module_current]+"][layers]["+j+"][image]']").val(); //image
			
			}else{
			var type = 'div';
			var url = '';	
			}
			// Get image URL
			

			// Skip?
			var skip = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][skip]"]').prop('checked');

			// WordWrap
			var wordWrap = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][wordwrap]"]').prop('checked');

			// Get attribtes
			var id = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][id]"]').val();
			var classes = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][class]"]').val();

			// Append element
			if(skip) {
				jQuery('<div>').appendTo(draggable);
				return true;

			} else if(type == 'img') {
				if(url != '') {
					var item = jQuery('<img src="'+(uploadPath+url)+'" data-layer="'+j+'">').appendTo(draggable);
				}
			} else {

				// Get HTML content
				var html = $('textarea[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][html]"]').val();
				
				// Append the element
				var item =jQuery('<'+type+' data-layer="'+j+'">').appendTo(draggable);
				
				// Set HTML
				if(html != '') {
					item.html(html);
				}
			}
			
			// Abs pos
			item.css('position', 'absolute');

			// Get style settings
			var top = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][top]"]').val();
			var left = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][left]"]').val();
			var custom = $('textarea[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][style]"]').val();

			// Styles
			var styles = {};
			//jQuery(this).find('.ls-sublayer-style input.auto').each(function() {
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][width]"]').val()!='') styles['width'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][width]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][height]"]').val()!='') styles['height'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][height]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][padding-top]"]').val()!='') styles['padding-top'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][padding-top]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][padding-right]"]').val()!='') styles['padding-right'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][padding-right]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][padding-bottom]"]').val()!='') styles['padding-bottom'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][padding-bottom]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][padding-left]"]').val()!='') styles['padding-left'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][padding-left]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][border-top]"]').val()!='') styles['border-top'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][border-top]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][border-right]"]').val()!='') styles['border-right'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][border-right]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][border-bottom]"]').val()!='') styles['border-bottom'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][border-bottom]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][border-left]"]').val()!='') styles['border-left'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][border-left]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][font-family]"]').val()!='') styles['font-family'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][font-family]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][font-size]"]').val()!='') styles['font-size'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][font-size]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][line-height]"]').val()!='') styles['line-height'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][line-height]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][color]"]').val()!='') styles['color'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][color]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][background]"]').val()!='') styles['background'] = "url("+$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][background]"]').next().attr('src')+")";
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][border-radius]"]').val()!='') styles['border-radius'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+j+'][border-radius]"]').val();
				
			
			item.attr('style', custom);

			// Set predefined styles
			item.css(styles);
			
			// Apply attributes
			item.attr('id', id);
			item.addClass(classes);

			// Word wrap
			if(wordWrap == false) {
				item.css('white-space', 'nowrap');
			}

			var pt = isNaN( parseInt( item.css('padding-top') ) ) ? 0 : parseInt( item.css('padding-top') );
			var pl = isNaN( parseInt( item.css('padding-left') ) ) ? 0 : parseInt( item.css('padding-left') );
			var bt = isNaN( parseInt( item.css('border-top-width') ) ) ? 0 : parseInt( item.css('border-top-width') );
			var bl = isNaN( parseInt( item.css('border-left-width') ) ) ? 0 : parseInt( item.css('border-left-width') );

			var setPositions = function(){

				// Position the element
				if(top.indexOf('%') != -1) {
					item.css({ top : draggable.height() / 100 * parseInt( top ) - item.height() / 2 - pt - bt });
				} else {
					item.css({ top : parseInt(top) });
				}

				if(left.indexOf('%') != -1) {
					item.css({ left : draggable.width() / 100 * parseInt( left ) - item.width() / 2 - pl - bl });
				} else {
					item.css({ left : parseInt(left) });
				}
			};

			if( item.is('img') ){

				item.load(function(){
					
				}).attr('src',item.attr('src') );
				setPositions();
			}else{
				setPositions();
			}

			// Z-index
			item.css({ zIndex : 10 + item.index() });


			// Add draggable
			LayerSlider.addDraggable();
		}
		}
	},

	addDraggable : function() {
		jQuery('.draggable').children().draggable({
        	drag : function() {

        		LayerSlider.dragging();
        	},
        	stop : function() {

        		LayerSlider.dragging();
        	}
        });
	},

	dragging : function() {
		
		// Get positions
		var top = jQuery('.ui-draggable-dragging').position().top;
		var left = jQuery('.ui-draggable-dragging').position().left;
		var index = jQuery('.ui-draggable-dragging').attr('data-layer');
		

		// Set positions
	
		$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+index+'][top]"]').val(top + 'px');
		$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+'][layers]['+index+'][left]"]').val(left+ 'px');
		
	},

	play : function() {

		// Get layerslider contaier
		var layerslider = $('#tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' .ls-real-time-preview');
		
		// Stop
		if(layerslider.children().length > 0) {
			$('#tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' .ls-preview').show();
			layerslider.find('.ls-container').layerSlider('stop');
			layerslider.html('').hide();
			$('#tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' .ls-preview-button').html(button_preview_on).removeClass('playing');
			return;
		}

		// Show the LayerSlider
		layerslider.show();
		layerslider = jQuery('<div class="layerslider">').appendTo(layerslider);

		// Hide the preview
		$('#tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' .ls-preview').hide();

		// Change button status
		$('#tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' .ls-preview-button').html(button_preview_off).addClass('playing');

		// Get global settings
		var width = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][width]"]').val();
		var height = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][height]"]').val();
		var backgroundColor = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][transparent]"]').val();
		var backgroundImage = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][backgroundimage]"]').val();
		if (backgroundImage!="") backgroundImage=uploadPath+backgroundImage;
		
		// Apply global settings
		layerslider.css({ width: width, height : height });


		if(backgroundColor != '') {
			layerslider.css({ backgroundColor : backgroundColor });
		}

		if(backgroundImage != '') {
			 layerslider.css({ backgroundImage : 'url('+backgroundImage+')' });
		}

		// Iterate over the layers
		var i;
		for(i=0;i<slide_row[module_current];i++) {
		if ($("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][background]']").length) {
	

			// Gather layer data
			var background = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][background]"]').val();
			if (background!="") background=uploadPath+background;
			
			// Layer properties
			    var layerprops = '';
				layerprops += 'slidedelay:'+$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][slidedelay]"]').val()+';';
				layerprops += 'slidedirection:'+$('select[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][slidedirection]"]').val()+';';
				layerprops += 'timeshift:'+$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][timeshift]"]').val()+';';
				layerprops += 'durationin:'+$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][durationin]"]').val()+';';
				layerprops += 'easingin:'+$('select[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][easingin]"]').val()+';';
				layerprops += 'delayin:'+$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][delayin]"]').val()+';';
				layerprops += 'durationout:'+$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][durationout]"]').val()+';';
				layerprops += 'easingout:'+$('select[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][easingout]"]').val()+';';
				layerprops += 'delayout:'+$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][delayout]"]').val()+';';
				
			
			
			// Build the layer
			var layer = jQuery('<div class="ls-layer">').appendTo(layerslider);
				layer.attr('rel', layerprops);

			// Background
			if(background != '') {
				jQuery('<img src="'+background+'" class="ls-bg">').appendTo(layer);
			}

			// New transitions
			if($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][new_transitions]"]').prop('checked')) {

				// Get selected transitions
				var tr2d = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][2d_transitions]"]').val();
				var tr3d = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][3d_transitions]"]').val();
				var tr2dcustom = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][custom_2d_transitions]"]').val();
				var tr3dcustom = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][custom_3d_transitions]"]').val();

                if( tr2d == '' &&tr3d == '' && tr2dcustom == '' && tr3dcustom == '' ) {
                    layer.attr('rel', layer.attr('rel') + ' transition2d: all; ');
                   	layer.attr('rel', layer.attr('rel') + ' transition3d: all; ');
                } else {

                    if(tr2d != '') layer.attr('rel', layer.attr('rel') + ' transition2d: '+tr2d+'; ');
                    if(tr3d != '') layer.attr('rel', layer.attr('rel') + ' transition3d: '+tr3d+'; ');
                    if(tr2dcustom != '') layer.attr('rel', layer.attr('rel') + ' customtransition2d: '+tr2dcustom+'; ');
                    if(tr3dcustom != '') layer.attr('rel', layer.attr('rel') + ' customtransition3d: '+tr3dcustom+'; ');
                }
			}


			// Iterate over the sublayers
			var j;
			for(j=0;j<layer_row[module_current][i];j++) {
			if ($("textarea[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][html]']").length) {
		
			if($("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][image]']").val()){
			// Get sublayer type
			var type = 'img';
			var image = $("input[name='ULTIMATUMLayerSlider_module["+module_current+"][slides]["+i+"][layers]["+j+"][image]']").val(); //image
			
			}else{
			var type = 'div';
			var image = '';	
			}
			

				
				var html = $('textarea[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][html]"]').val();
				var style = $('textarea[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][style]"]').val();
				var top = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][top]"]').val();
				var left = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][left]"]').val();
				var level = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][level]"]').val();
				var skip=$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][skip]"]').prop('checked');
				var url = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][url]"]').val();
				var id = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][id]"]').val();
				var classes = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][class]"]').val();
				// Skip sublayer?
				
				if(skip) {
					return true;
				}

				// Sublayer properties
				var sublayerprops = '';
				sublayerprops += 'slidedirection:'+$('select[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][slidedirection]"]').val()+';';
				sublayerprops += 'slideoutdirection:'+$('select[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][slideoutdirection]"]').val()+';';
				sublayerprops += 'durationin:'+$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][durationin]"]').val()+';';
				sublayerprops += 'easingin:'+$('select[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][easingin]"]').val()+';';
				sublayerprops += 'delayin:'+$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][delayin]"]').val()+';';
				sublayerprops += 'durationout:'+$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][durationout]"]').val()+';';
				sublayerprops += 'easingout:'+$('select[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][easingout]"]').val()+';';
				sublayerprops += 'delayout:5000;';
				sublayerprops += 'showuntil:'+$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][showuntil]"]').val()+';';

				var wordWrap = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][wordwrap]"]').prop('checked');

				// Styles
				var styles = {};
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][width]"]').val()!='') styles['width'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][width]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][height]"]').val()!='') styles['height'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][height]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][padding-top]"]').val()!='') styles['padding-top'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][padding-top]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][padding-right]"]').val()!='') styles['padding-right'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][padding-right]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][padding-bottom]"]').val()!='') styles['padding-bottom'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][padding-bottom]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][padding-left]"]').val()!='') styles['padding-left'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][padding-left]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][border-top]"]').val()!='') styles['border-top'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][border-top]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][border-right]"]').val()!='') styles['border-right'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][border-right]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][border-bottom]"]').val()!='') styles['border-bottom'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][border-bottom]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][border-left]"]').val()!='') styles['border-left'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][border-left]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][font-family]"]').val()!='') styles['font-family'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][font-family]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][font-size]"]').val()!='') styles['font-size'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][font-size]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][line-height]"]').val()!='') styles['line-height'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][line-height]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][color]"]').val()!='') styles['color'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][color]"]').val();
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][background]"]').val()!='') styles['background'] = "url("+$('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][background]"]').next().attr('src')+")";			
				if ($('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][border-radius]"]').val()!='') styles['border-radius'] = $('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+i+'][layers]['+j+'][border-radius]"]').val();


				// Build the sublayer
				if(type == 'img') {
					if(image != '') {
						var sublayer = jQuery('<img src="'+(uploadPath+image)+'">').appendTo(layer).addClass('ls-s'+level);
					} else {
						return true;
					}
				} else {
					var sublayer = jQuery('<'+type+'>').appendTo(layer).html(html).addClass('ls-s'+level);
				}

				sublayer.attr('style', style);

				// Apply attributes
				
				sublayer.attr('id', id);
				sublayer.addClass(classes);


				// Apply styles
				sublayer.css(styles);

    

				// WordWrap
				if(wordWrap == false) {
					sublayer.css('white-space', 'nowrap');
				}

				// Position the element
				if(top.indexOf('%') != -1) {
					sublayer.css({ top : top, marginTop : - sublayer.height() / 2 - parseInt( sublayer.css('padding-top') ) - parseInt( sublayer.css('border-top-width') ) });
				} else {
					sublayer.css({ top : parseInt(top) });
				}

				if(left.indexOf('%') != -1) {
					sublayer.css({ left : left, marginLeft : - sublayer.width() / 2 - parseInt( sublayer.css('padding-left') ) - parseInt( sublayer.css('border-left-width') ) });
				} else {
					sublayer.css({ left : parseInt(left) });
				}

				if(url != '' && url.match(/^\#[0-9]/)) {
					sublayer.addClass('ls-linkto-' + url.substr(1));
				}

				sublayer.attr('rel', sublayerprops);
				
			}
			}
			
		}
		}
		
		// Init layerslider
		
		jQuery(layerslider).layerSlider({
			width : width,
			height : height,
			skin : 'preview',
			skinsPath : lsTrSkinPath,
			animateFirstLayer : true,
			firstLayer : (slide_current[module_current]+1),
			autoStart : true,
			pauseOnHover : false,
			autoPlayVideos : false
		});

	},


	stop : function() {

		var layerslider = $('#tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' .ls-real-time-preview');
		
		// Stop
		if(layerslider.children().length > 0) {
			$('#tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' .ls-preview').show();
			layerslider.find('.ls-container').layerSlider('stop');
			layerslider.html('').hide();
			$('#tab_module'+module_current+' #tab_slide'+slide_current[module_current]+' .ls-preview-button').html(button_preview_on).removeClass('playing');
			return;
		}
	},

	openTransitionGallery : function() {

		// Create window
		jQuery('body').prepend( jQuery('<div>', { 'id' : 'ls-transition-window', 'class' : 'ls-box' })
			.append( jQuery('<h1>', { 'class' : 'header', 'text' : 'Select LayerSlider transitions' })
				.append( jQuery('<a>', { 'text' : 'x' }))
			)
			.append( jQuery('<div>')
				.append( jQuery('<table>'))
			)
		);

		// Create overlay
		jQuery('body').prepend( jQuery('<div>', { 'id' : 'ls-transition-overlay'}));


		// Add custom checkboxes
		jQuery('#ls-transition-window :checkbox').customCheckbox();

		// Append transitions
				
		LayerSlider.appendTransition('Built-in 3D transitions', '3d_transitions', layerSliderTransitions['t3d']);
		LayerSlider.appendTransition('Built-in 2D transitions', '2d_transitions', layerSliderTransitions['t2d']);
		if(typeof layerSliderCustomTransitions != "undefined") {

			// Custom 3D transitions
			if(layerSliderCustomTransitions['t3d'].length) {
				LayerSlider.appendTransition('Custom 3D transitions', 'custom_3d_transitions', layerSliderCustomTransitions['t3d']);
			}

			// Custom 2D transitions
			if(layerSliderCustomTransitions['t2d'].length) {
				LayerSlider.appendTransition('Custom 2D transitions', 'custom_2d_transitions', layerSliderCustomTransitions['t2d']);
			}
		}

		// Add custom checkboxes
		jQuery('#ls-transition-window :checkbox').customCheckbox();
	},

	closeTransitionGallery : function() {

		jQuery('#ls-transition-overlay, #ls-transition-window').remove();
	},

	appendTransition : function(title, tbodyclass, transitions) {

		// Append new tbody
		var tbody = jQuery('<tbody>', { 'class' : tbodyclass }).appendTo('#ls-transition-window table');

		// Append section header
		tbody.append( jQuery('<tr>')
			.append( jQuery('<th>', { 'colspan' : 2 })
				.append( jQuery('<span>', { 'text' : title }))
				.append( jQuery('<input>', { 'type' : 'checkbox' }))
				.append( jQuery('<span>', { 'class' : 'all', 'text' : 'Select all' }))
			)
		);
		
		// Get checked transitions
		var checked = jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+']['+tbodyclass+']"]').val();
		checked = (checked != '') ? checked.split(',') : [];

		// Check checkbox if all is selected
		if(checked == 'all') {
			tbody.find('.ls-checkbox').removeClass('off').addClass('on');
			tbody.find(':checkbox').prop('checked', true);
		}
		
		for(c = 0; c < transitions.length; c+=2) {

			// Append new table row
			var tr = jQuery('<tr>').appendTo(tbody).append('<td>').append('<td>');

			// Append transition col 1
			tr.children().eq(0).append( jQuery('<a>', { 'href' : '#', 'html' : ''+(c+1)+'. '+transitions[c]['name']+'', 'rel' : 'tr'+(c+1) } ) )
			if(typeof transitions[c]['premium'] && transitions[c]['premium'] == true) {
				tr.children().eq(0).append( jQuery('<span>', { 'class' : 'ls-icon-star' }));
			}

			// Append transition col 2
			if(transitions.length > (c+1)) {
				tr.children().eq(1).append( jQuery('<a>', { 'href' : '#', 'html' : ''+(c+2)+'. '+transitions[(c+1)]['name']+'', 'rel' : 'tr'+(c+2) } ) );
				if(typeof transitions[(c+1)]['premium'] && transitions[(c+1)]['premium'] == true) {
					tr.children().eq(1).append( jQuery('<span>', { 'class' : 'ls-icon-star' }));
				}
			}

			// Check transitions
			if(checked.indexOf(''+(c+1)+'') != -1 || checked == 'all') tr.children().eq(0).addClass('added');
			if((checked.indexOf(''+(c+2)+'') != -1 || checked == 'all') && transitions.length > (c+1)) tr.children().eq(1).addClass('added');
		}
	},

	selectAllTransition : function(index, check) {

		// Get checkbox
		var checkbox = jQuery('#ls-transition-window tbody').eq(index).find(':checkbox');

		// Get category
		var cat = jQuery('#ls-transition-window tbody').eq(index).attr('class');

		if(checkbox.is(':checked') || (typeof check != undefined && check == true) ) {

			// Check every transition
			jQuery('#ls-transition-window tbody').eq(index).find('td a').each(function() {
				jQuery(this).parent().addClass('added');
			});

			// Check the checkbox
			jQuery('#ls-transition-window tbody').eq(index).find('.ls-checkbox').removeClass('off').addClass('on');
			jQuery('#ls-transition-window tbody').eq(index).find(':checkbox').prop('checked', true);

			// Set the hidden input
			
			jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+']['+cat+']"]').val('all');
		

		} else {
			
			// Check every transition
			jQuery('#ls-transition-window tbody').eq(index).find('td').removeClass('added');

			// Set the hidden input
			jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+']['+cat+']"]').val('');
		
		}
	},

	toggleTransition : function(el) {

		// Toggle addded class
		if(jQuery(el).parent().hasClass('added')) {
			jQuery(el).parent().removeClass('added');

		} else {
			jQuery(el).parent().addClass('added');
		}

		// Get transitions
		var trs = jQuery(el).closest('tbody').find('td');

		// All selected
		if(trs.filter('.added').length == trs.find('a').length) {

			LayerSlider.selectAllTransition( jQuery(el).closest('tbody').index(), true );
			return;

		// Uncheck sleect al.
		} else {

			// Check the checkbox
			jQuery(el).closest('tbody').find('.ls-checkbox').addClass('off').removeClass('on');
			jQuery(el).closest('tbody').find(':checkbox').prop('checked', false);
		}

		// Get category
		var cat = jQuery(el).closest('tbody').attr('class');

		// Array to hold the checked elements
		var checked = [];

		// Get checked elements
		trs.filter('.added').find('a').each(function() {
			checked.push( jQuery(this).attr('rel').substr(2) );
		});
		
		// Set hidden input
		jQuery('input[name="ULTIMATUMLayerSlider_module['+module_current+'][slides]['+slide_current[module_current]+']['+cat+']"]').val( checked.join(',') );
		
	},

	showTransition : function(el) {

		// Get transition index
		var index = jQuery(el).attr('rel').substr(2)-1;

		// Create popup
		jQuery('body').prepend( jQuery('<div>', { 'class' : 'ls-popup' })
			.append( jQuery('<div>', { 'class' : 'inner ls-transition-preview' }))
		);

		// Get popup
		var popup = jQuery('.ls-popup');

		// Get viewport dimensions
		var v_w = jQuery(window).width();

		// Get element dimensions
		var e_w = jQuery(el).width();

		// Get element position
		var e_l = jQuery(el).offset().left;
		var e_t = jQuery(el).offset().top;

		// Get toolip dimensions
		var t_w = popup.outerWidth();
		var t_h = popup.outerHeight();

		// Position tooltip
		popup.css({ top : e_t - t_h - 10, left : e_l - (t_w - e_w) / 2  });

		// Fix top
		if(popup.offset().top < 20) {
			popup.css('top', e_t + 25);
		}

		// Fix left
		if(popup.offset().left < 20) {
			popup.css('left', 20);
		}

		// Get transition class
		var trclass = jQuery(el).closest('tbody').attr('class');

		// Built-in 3D
		
		if(trclass == '3d_transitions') {
			var trtype = '3d';
			var trObj = layerSliderTransitions['t'+trtype+''][index];
			
		// Built-in 2D
		} else if(trclass == '2d_transitions') {
			var trtype = '2d';
			var trObj = layerSliderTransitions['t'+trtype+''][index];

		// Custom 3D
		} else if(trclass == 'custom_3d_transitions') {
			var trtype = '3d';
			var trObj = layerSliderCustomTransitions['t'+trtype+''][index];

		// Custom 3D
		} else if(trclass == 'custom_2d_transitions') {
			var trtype = '2d';
			var trObj = layerSliderCustomTransitions['t'+trtype+''][index];
		}

		// Init transition
		popup.find('.inner').transitionGallery({
			type : trtype,
			transition : trObj,
			delay : 1500,
			path : lsTrImgPath
		});
	},

	hideTransition : function(el) {

		// Stop transition
		jQuery('.ls-popup').find('.inner').transitionGallery('destroy');

		// Remove transition
		jQuery('.ls-popup').remove();
	},

};



jQuery(document).ready(function() {

		// Support menu
		jQuery('#ls-main-nav-bar a.support').click(function(e) {
			e.preventDefault(); 
			jQuery('#contextual-help-link').click();
		});

		// Settings: checkboxes
		
       $(":checkbox:not(.noreplace)").customCheckbox();
		// Checkbox event
		jQuery(document).on('click', '.ls-checkbox', function(e){

			// Prevent browers default submission
			e.preventDefault();

			// Get checkbox
			var el = jQuery(this).prev()[0];

			if( jQuery(el).is(':checked') ) {
				jQuery(el).prop('checked', false);
				jQuery(this).removeClass('on').addClass('off');
				LayerSlider.generatePreview();
				LayerSlider.stop();
			} else {
				jQuery(el).prop('checked', true);
				jQuery(this).removeClass('off').addClass('on');
				LayerSlider.generatePreview();
				LayerSlider.stop();
			}

			// Trigger events
			//jQuery('#ls-layers').trigger( jQuery.Event('click', { target : el } ) );
			//jQuery(document).trigger( jQuery.Event('click', { target : el } ) );

		});

		// Generate preview
		jQuery(window).load(function() {
			LayerSlider.generatePreview();
		});

		// Toggle transitions
		jQuery('input.new-transitions').live("click", function(event){
			event.preventDefault();
			LayerSlider.toggleTransitions(this);
		});

		// Open Transition gallery
		$(".ls-select-transitions").live("click", function(event){
		event.preventDefault();
			LayerSlider.openTransitionGallery();
		});

		// Close transition gallery
		jQuery(document).on('click', '#ls-transition-overlay, #ls-transition-window h1 a', function(e) {
			e.preventDefault();
			LayerSlider.closeTransitionGallery();
		});

		// Add/Remove layer transitions
		jQuery(document).on('click', '#ls-transition-window tbody a:not(.ls-checkbox)', function(e) {
			e.preventDefault();
			LayerSlider.toggleTransition(this);
		});

		// Add/Remove layer transitions
		jQuery(document).on('click', '#ls-transition-window .ls-checkbox', function(e) {
			e.preventDefault();
			LayerSlider.selectAllTransition( jQuery(this).closest('tbody').index() );
		});

		// Show transition
		jQuery(document).on('mouseenter', '#ls-transition-window table a:not(.ls-checkbox)', function() {
			LayerSlider.showTransition(this);
		});

		// Hide transition
		jQuery(document).on('mouseleave', '#ls-transition-window table a:not(.ls-checkbox)', function() {
			LayerSlider.hideTransition(this);
		});

		// Sublayer: Style
		jQuery('#ls-layers').on('keyup', '.ls-sublayer-style input, .ls-sublayer-style select, .ls-sublayer-style textarea', function() {
			LayerSlider.willGeneratePreview();
		});

		// Preview
		
		
		$('.ls-preview-button').live("click", function(event){
			event.preventDefault();
			LayerSlider.play();
		});

		// Callback boxes
		LayerSlider.setCallbackBoxesWidth();
		jQuery(window).resize(function() {
			LayerSlider.setCallbackBoxesWidth();
		});

		// Color picker
		if(typeof jQuery.fn.wpColorPicker != "undefined") {
			jQuery('.ls-colorpicker').wpColorPicker({
				width : 150,
				change : function() {
					LayerSlider.willGeneratePreview();
				}
			});
		}

		// Show color picker on focus
		jQuery('.color').focus(function() {
			jQuery(this).next().slideDown();
		});

		// Show color picker on blur
		jQuery('.color').blur(function() {
			jQuery(this).next().slideUp();
		});

});