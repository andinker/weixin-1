
(function($) {
    $.fn.extend({
    
    	LimitSize:function(){
    		var gallery_container=$(".gallery-cell",this);
    		var gallery_w=gallery_container.width();
    		var gallery_h=1/3*gallery_w;
    		gallery_container.css("height",gallery_h+"px");
    		
    	}
        
    });
})(jQuery);