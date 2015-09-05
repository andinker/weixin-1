(function($){
	
	$.fn.extend({
		MenuSelect:function(){
			var defaults={
					menu_active:"menu_active",
			};
			var option=$.extend(defaults,option);
			var menu_title=$(".menu_title ul li",this);
			var menu_content=$(".menu_content .menu_content_detail",this);
			menu_title.click(function() {
                $(this).addClass(option.menu_active).siblings().removeClass(option.menu_active);
                var content_Index = menu_title.index(this);
                menu_content.eq(content_Index).show().siblings().hide();
            });
		}
	
	})
})(jQuery);