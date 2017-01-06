<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.*" %>
<%@ page import="njupt.model.T_Joy_Beans_User" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>游客页面</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style>
		a{text-decoration:none;}
		ul{margin:0;padding:0;}
		li{ list-style:none;}
		.clear{ display:block; clear:both; content:"";}
		.clear{ zoom:1;}
		.mask { background: #000; opacity: 0.5;position: fixed;z-index: 9999;top: 0;left: 0;}
		
		.main{height:450px; width:800px; margin:150px auto 0; padding-top:10px;background:#4B8FA5;border-radius:10px;}
		.main .cover{ height:350px; width:300px; position:fixed; top:200px; left:550px; background:#C1D4EF;border:1px solid #000;display:none;z-index:1000000;}
		.main .cover .close{ height:15px; width:15px; position:absolute; top:0; right:0;}
		.main .cover .close:hover{ background:#0000ff;cursor:pointer;}
		.main .cover .use{ height:310px; width:280px; margin:20px auto 0;}
		.main .cover .use .top{ height:150px; width:100%;}
		.main .cover .use .top .top-left{ float:left;width:120px; height:100px; background:#fff;margin-top:25px; border-radius:10px; overflow:hidden;}
		.main .cover .use .top .top-left img{ width:120px; height:100px;border-radius:10px; border:0; margin:0;}
		.main .cover .use .top .top-right{ float:right;height:100px; width:140px;margin-left:20px; margin-top:32px;}
		.main .cover .use .top .top-right p{ font-size:12px;border:1px solid #000;height:25px; width:140px; box-sizing:border-box;line-height:30px;margin:0 0 5px 0; text-alignLcenter;background:#fff;}
		.main .cover .use .top .top-right span{ font-size:10px;height:25px; width:65px;font-size:12px;line-height:25px;}
		.main .cover .use .bottom{ height:150px; width:100%;margin-top:10px;border:1px solid #000;}
		.main .cover .use .bottom textarea{ height:150px; width:100%;}
		
		.main .main-top{height:30px; width:770px; margin:0 auto;padding-left:10px;background:#fff;}
		.main .main-top span{ line-height:30px;}
		.main-top  button{padding:0;border:0;border-radius:5px;display:block; height:25px; width:50px; background:#5A98DE;color:#fff;float:right;margin:2.5px 5px;}
		.main .main-bottom{height:380px;width:780px; margin:20px auto 0;}
		.main .main-bottom .first{height:30px; width:780px;}
		.main .main-bottom .first li{ cursor:pointer;display:block; width:180px; height:30px;float:left; text-align:center; line-height:30px; background:#C1D4EF;border-radius:10px 10px 0 0;}
		.main .main-bottom .first .active{ background:#83A6D6;}
		
		.main .main-bottom .second{overflow-y:auto;height:350px; width:780px; margin:0 auto; background:#fff; box-sizing:border-box;}
		.main .main-bottom .second li{ margin-top:15px;height:205px; width:160px; float:left;margin-left:30px;}	
		.main .main-bottom .second li img{width:160px; height:140px;border:1px solid #000; border-radius:20px;overflow:hidden;}
		.main .main-bottom .second li .box{width:160px; height:50px;margin-top:10px;border:1px solid #333; }
		.main .main-bottom .second li .box i{font-size:12px;}
		.main .main-bottom .second li .box p{ cursor:pointer;height:15px; width:100%;margin:0; text-align:center;font-size:14px;color:#0000ff;}
		.main .main-bottom .second li .box a{ font-size:14px;}
		.main .main-bottom .second li .box span{font-size:12px;}
		.main .main-bottom .second li .box a{cursor:pointer;color:#0000ff;}
		
		.main .main-bottom .relax{ display:none;}
		
	</style>
	
	<script>
		function out(){
			window.location.href="http://localhost:8080/JoyBean/BeanLogin.jsp";
		}
		function addBean(){
			
		}
	</script>
  </head>
  
  <body>
  	<!--主界面-->
  
	<div class="main">
		<div class="main-top clear">
  			<form action="<%=path %>/user/addBeanFee.action" method="post"><button >充值</button></form><span>[<%=session.getAttribute("user") %>]号 用户，欢迎使用邮豆游戏平台！ </span>
  			<button onclick="out()">退出</button>
  		
  			
  		</div>
	<div class="cover">
			<div class="close">X</div>
			<div class="use">
				<div class="top clear">
					<div class="top-left">
						<img id="imgs" src=""  />        /* 图片*/
					</div>
					<div class="top-right">
						<p id="name"></p>
						<p><span style="float:left;">邮豆：<i id="num1">10</i>个   </span><span style="float:right;">话费：<i id="num2">2</i>元</span></p>
						<p>最后更新时间：<i id="num3"></i></p>
					</div>
				</div>
				<div class="bottom">
					<textarea>游戏介绍：</textarea>
				</div>
				
			</div>
		</div>
	<form action="<%=path %>/user/allGame.action" method="post" id="myForm">
    	<div class="main-bottom">
    		<ul class="first clear">
    			<li class="active">所有</li>
    			
    		</ul>
    		<div class="second fight">
    			<ul class="clear">
    				<s:iterator value="allGame" status="stu">
				    	<li  class="Li">
				    		<img  src=".<s:property value="game_picture"/>" />
				    		<div class="box clear">
				    			<p class="clic"><s:property value="Game_name"/></p>
				    			<span style="float:left;">邮豆：<i class="data1"><s:property value="beans_price"/></i>个</span>
				    			<span style="float:right;">话费：<i class="data2"><s:property value="charge_price"/></i>元</span>
								<a style="float:left;">邮豆购买</a><a style="float:right;">花费购买</a>
				    		</div>
				    	</li>
    				</s:iterator>
    			</ul>
    		</div>
    	</div>
    	<input type="button" id="refresh" hidden="true">
    	</form>
    		
    </div>
    <script>
    $(document).ready(function(){ 
    var url=window.location.href;
    	if(window.location.href=="http://localhost:8080/JoyBean/index.jsp")
     	$("#myForm").submit();
     	if($(".Li").length==0)
     	$("#myForm").submit();
	}); 
    $(function(){
	    $(".first > li").click(function(){
    		var num = $(this).index();
    		if(!$(this).hasClass('active')){
    			$(this).parents(".first").find(".active").removeClass("active");
    			$(this).addClass("active");
    			$(this).parents(".main-bottom").find(".second").eq(num).css("display","block");
    			$(this).parents(".main-bottom").find(".second").eq(1-num).css("display","none");
    		}
	    });
    });
    $(function(){
    	$(".clic").click(function(){ 
    		mask();
    		$(".cover").css("display","block");
    		$(".close").click(function(){
    			$(".mask").remove();
    			$(".cover").css("display","none");
    		});
    	});
    	var mask = function() {
	        $('<div class="mask" style="width: ' + $(window).width() + 'px; '
	            + 'height: ' + $(window).height() + 'px;"></div>').appendTo("body");
	    };
	
	    // 窗口大小变化，调整 mask 大小
	    $(window).on("resize", function() {
	        if($(".mask").length) {
	            $(".mask").css({
	                width: $(window).width(),
	                height: $(window).height(),
	                opacity: 0.5
	            });
	        }
	    });
    });
    $(function(){
    	$(".clic").click(function(){
    		var This = this;
    		var con1 = $(This).parent().find(".data1").html();
    		var con2 = $(This).parent().find(".data2").html();
    		var con3 = $(This).parent().find(".clic").html();
    		var con4 = $(This).parents(".Li").children("img").attr("src");
    		$(".cover .use #name").html(con3);
    		$(".cover .use #num1").html(con1);
    		$(".cover .use #num2").html(con2);
    		$(".cover .use #imgs").attr("src",con4);
    	});
    });
    </script>
  </body>
</html>
