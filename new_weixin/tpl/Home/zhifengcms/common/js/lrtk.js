// JavaScript Document
$(document).ready(function(e) {
	/***不需要自动滚动，去掉即可***/
	time = window.setInterval(function(){
		$('.og_next').click();	
	},5000);
	/***不需要自动滚动，去掉即可***/
	linum = $('.mainlist li').length;//图片数量
	w = linum * 190;//ul宽度
	$('.piclist').css('width', w + 'px');//ul宽度
	$('.swaplist').html($('.mainlist').html());//复制内容
	
	$('.og_next').click(function(){
		
		if($('.swaplist,.mainlist').is(':animated')){
			$('.swaplist,.mainlist').stop(true,true);
		}
		
		if($('.mainlist li').length>6){//多于4张图片
			ml = parseInt($('.mainlist').css('left'));//默认图片ul位置
			sl = parseInt($('.swaplist').css('left'));//交换图片ul位置
			if(ml<=0 && ml>w*-1){//默认图片显示时
				$('.swaplist').css({left: '1200px'});//交换图片放在显示区域右侧
				$('.mainlist').animate({left: ml - 1140 + 'px'},'slow');//默认图片滚动				
				if(ml==(w-1140)*-1){//默认图片最后一屏时
					$('.swaplist').animate({left: '0px'},'slow');//交换图片滚动
				}
			}else{//交换图片显示时
				$('.mainlist').css({left: '1140px'})//默认图片放在显示区域右
				$('.swaplist').animate({left: sl - 1140 + 'px'},'slow');//交换图片滚动
				if(sl==(w-1140)*-1){//交换图片最后一屏时
					$('.mainlist').animate({left: '0px'},'slow');//默认图片滚动
				}
			}
		}
	})
	$('.og_prev').click(function(){
		
		if($('.swaplist,.mainlist').is(':animated')){
			$('.swaplist,.mainlist').stop(true,true);
		}
		
		if($('.mainlist li').length>6){
			ml = parseInt($('.mainlist').css('left'));
			sl = parseInt($('.swaplist').css('left'));
			if(ml<=0 && ml>w*-1){
				$('.swaplist').css({left: w * -1 + 'px'});
				$('.mainlist').animate({left: ml + 1140 + 'px'},'slow');				
				if(ml==0){
					$('.swaplist').animate({left: (w - 1140) * -1 + 'px'},'slow');
				}
			}else{
				$('.mainlist').css({left: (w - 1140) * -1 + 'px'});
				$('.swaplist').animate({left: sl + 1140 + 'px'},'slow');
				if(sl==0){
					$('.mainlist').animate({left: '0px'},'slow');
				}
			}
		}
	})    
});

$(document).ready(function(){
	$('.og_prev,.og_next').hover(function(){
			$(this).fadeTo('fast',1);
		},function(){
			$(this).fadeTo('fast',0.7);
	})

})



//上下滚动

$(function() {
    var index = 0;
    var adtimer;
    var _wrap = $("#container"); //
    var len = $("#container ul").length;
    //len=1;
    if (len > 1) {
        $("#container").hover(function() {
            clearInterval(adtimer);
        },
        function() {
            adtimer = setInterval(function() {

                var _field = _wrap.find('ul:first'); //此变量不可放置于函数起始处,li:first取值是变化的
                var _h = _field.height(); //取得每次滚动高度(多行滚动情况下,此变量不可置于开始处,否则会有间隔时长延时)
                _field.animate({
                    marginTop: -_h + 'px'
                },
                500,
                function() { //通过取负margin值,隐藏第一行
                    _field.css('marginTop', 0).appendTo(_wrap); //隐藏后,将该行的margin值置零,并插入到最后,实现无缝滚动
                })

            },
            5000);
        }).trigger("mouseleave");
        function showImg(index) {
            var Height = $("#container").height();
            $("#container ul").stop().animate({
                marginTop: -_h + 'px'
            },
            1);
        }

        $("#container").mouseover(function() {
            $("#container .mouse_direction").css("display", "block");
        });
        $("#container").mouseout(function() {
            $("#container .mouse_direction").css("display", "block");
        });
    }

    $("#container").find(".mouse_top").click(function() {
        var last = _wrap.find('ul:last'); //此变量不可放置于函数起始处,li:last取值是变化的
        var _h = last.height();
        last.prependTo(_wrap);
        var _field = _wrap.find('ul:first'); //此变量不可放置于函数起始处,li:first取值是变化的		
        _field.css('marginTop', -_h);
        _field.stop().animate({
            marginTop: 0
        },
        500)
    });
    $("#container").find(".mouse_bottom").click(function() {
        var _field = _wrap.find('ul:first'); //此变量不可放置于函数起始处,li:first取值是变化的
        var _h = _field.height();
        _field.stop().animate({
            marginTop: -_h + 'px'
        },
        500,
        function() { //通过取负margin值,隐藏第一行
            _field.css('marginTop', 0).appendTo(_wrap); //隐藏后,将该行的margin值置零,并插入到最后,实现无缝滚动
        })
    });
});