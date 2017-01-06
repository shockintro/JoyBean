<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
		
		.main{height:450px; width:800px; margin:200px auto 0; padding-top:10px;}
		.main .main-top{height:30px; width:770px; margin:0 auto;border:1px solid #000;padding-left:10px;}
		.main .main-top span{ line-height:30px;}
		.main .main-bottom{height:380px;width:780px; margin:20px auto 0;}
		.main .main-bottom .first{height:30px; width:780px;}
		.main .main-bottom .first li{ cursor:pointer;display:block; width:180px; height:30px;float:left; text-align:center; line-height:30px; background:#f2f2f2;}
		.main .main-bottom .first .active{ background:#d7d7d7;}
		
		.main .main-bottom .second{overflow-y:auto;height:350px; width:780px; margin:0 auto; background:#fff; box-sizing:border-box;border:1px solid #000;}
		.main .main-bottom .second li{ margin-top:15px;height:200px; width:160px; float:left;margin-left:30px;}	
		.main .main-bottom .second li img{width:160px; height:140px;border:1px solid #000; border-radius:20px;}
		.main .main-bottom .second li .box{width:160px; height:50px;margin-top:10px;border:1px solid #333; }
		.main .main-bottom .second li .box p{ height:15px; width:100%;margin:0; text-align:center;font-size:14px;}
		.main .main-bottom .second li .box span,.main .main-bottom .second li .box a{ font-size:14px;}
		.main .main-bottom .second li .box a{cursor:pointer;}
		
		.main .main-bottom .relax{ display:none;}
		
	</style>
  </head>
  
  <body>
    <div class="main">
    	<div class="main-top">
    		<span>乐豆系统欢迎您！请<a href="Login.jsp">登录</a>或<a href="Register.jsp">注册</a>！</span>
    	</div>
    	<div class="main-bottom">
    		<ul class="first clear">
    			<li class="active">竞技类</li>
    			<li>棋牌类</li>
    		</ul>
    		<div class="second fight">
    			<ul class="clear">
    				<li>
						<img  src="" />
						<div class="box clear">
							<p>神庙逃亡</p>
							<span style="float:left;">乐豆：10个   </span><span style="float:right;">话费：2元</span>
							<a style="float:left;">乐豆购买</a><a style="float:right;">花费购买</a>
						</div>
					</li>
					<li>
						<img  src="" />
						<div class="box"></div>
					</li>
					
    			</ul>
    			
    		</div>
    		<div class="second relax">
    			<ul class="clear">
    				<li>
						<img  src="" />
						<div class="box"></div>
					</li>
					<li>
						<img  src="" />
						<div class="box"></div>
					</li>
					
    			</ul>
    			
    		</div>
    	</div>
    </div>
    <script>
    	$(".first > li").click(function(){
    		var num = $(this).index();
    		if(!$(this).hasClass('active')){
    			$(this).parents(".first").find(".active").removeClass("active");
    			$(this).addClass("active");
    			$(this).parents(".main-bottom").find(".second").eq(num).css("display","block");
    			$(this).parents(".main-bottom").find(".second").eq(1-num).css("display","none");
    		}
    	});
    </script>
  </body>
</html>
