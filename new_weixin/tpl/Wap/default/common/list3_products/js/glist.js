


    /**头部菜单模块**/
    window.glist_menuNav = function () {

                var container = document.querySelectorAll(".container")[0];
                if (container.getAttribute("style")) {
                    window.myScroll && myScroll.sleep(false);
                    container.removeAttribute("style");
                    document.getElementById("sideBar").classList.remove("on");
                    setTimeout(function () {
                        container.classList.remove("animate");
                        $(".rotate_body").removeAttr("style");
                    }, 350);
                } else {
                    window.myScroll && myScroll.sleep(true);
                    var height = $(window).height();
                    container.classList.add("animate");
                    container.setAttribute("style", "height:" + height + "px;");
                    $(".rotate_body").height(height);
                    document.getElementById("sideBar").classList.add("on");
                    //var w = document.body.offsetWidth;
                    //var w1 = Math.cos((60/180)*Math.PI)*w - Math.sin((30/180)*Math.PI)*180;
                    //document.getElementById("sideBar").style.width = w-w1+"px";
                }
    }
