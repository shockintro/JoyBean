<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人中心</title>
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
		
		.main{height:450px; width:800px; margin:100px auto 0; padding-top:10px;background:#ECECEC;border-radius:10px;}
		.main .cover{ height:200px; width:280px; margin:100px auto;background:#ECF4FF; position:fixed; z-index:100000;top:100px; left:550px; display:none;padding:10px;}
		.main .use span{ height:30px; width:100px; display:inline-block; line-height:30px; text-align:center;background:#B7CEEF;margin:10px 5px;}
		.main .use input{ height:30px; width:150px; margin:10px 5px;} 
		
		.main .main-top{height:30px; width:760px; margin:0 auto;padding:0 10px;background:#fff;}
		.main .main-top span{ line-height:30px;}
		.main .main-top button{ float:right;height:25px; width:70px; border:0;background:#5A98DE; border-radius:5px;margin-top:2.5px; color:#fff;}
		.main .main-bottom{height:380px;width:780px; margin:20px auto 0;}
		.main .main-bottom .first{height:30px; width:780px;}
		.main .main-bottom .first li{ cursor:pointer;display:block; width:180px; height:30px;float:left; text-align:center; line-height:30px; background:#C1D4EF;border-radius:10px 10px 0 0;}
		.main .main-bottom .first .active{ background:#83A6D6;}
		
		.main .main-bottom .second{padding:10px; overflow-y:auto;height:330px; width:760px; margin:0 auto; background:#fff; }
		.main .main-bottom .second li{ margin-top:15px;height:200px; width:160px; float:left;margin-left:30px;}	
		.main .main-bottom .second li img{width:160px; height:140px;border:1px solid #000; border-radius:20px;}
		.main .main-bottom .second li .box{width:160px; height:50px;margin-top:10px;border:1px solid #333; }
		.main .main-bottom .second li .box p{ height:15px; width:100%;margin:0; text-align:center;font-size:14px;}
		.main .main-bottom .second li .box span,.main .main-bottom .second li .box a{ font-size:14px;}
		.main .main-bottom .second li .box a{cursor:pointer;}
		
		.second  .search{ margin:10px 0;}
		.second  .search span{margin-left:20px;display:inline-block; width:70px; height:30px; line-height:30px;text-align:center;background:#ECF4FF;}
		.second  .search span:first-child{margin-left:0;}
		.second  .search input{width:60px;height:30px;margin-left:10px;}
		.second  .search button{width:70px;height:30px;margin-left:30px; border:0;border-radius:5px;background:#5A98DE;color:#fff; }
		
		.second  .lists{ height:180px; width:700px;}
		.second  .lists table th,td{height:30px; width:100px;text-align:center; line-height:30px;}
		.second  .pages{ height:30px; width:300px;border:1px solid #000; margin-top:20px;}
		.second  .pages span{height:100%; width:100%; line-height:30px;padding-left:10px;}
		
		.main .main-bottom .retain{ display:none;}
		.main .main-bottom .retain span{display:inline-block;height:30px;width:100px; margin:10px 10px 0 0; text-align:center;background:#ECF4FF;line-height:30px;}
		.main .main-bottom .retain input{height:30px; width:100px;margin:10px 10px 0 0;}
		.main .main-bottom .retain span:last-child{width:450px;text-align:left; }
		.main .main-bottom .retain span:first-child{margin-top:30px;}
		.main .main-bottom .retain button{width:70px;height:30px;margin-left:30px; border:0;border-radius:5px;background:#5A98DE;color:#fff; }
		
	</style>
	<script>
		function out(){
			window.location.href="http://localhost:8080/JoyBean/BeanLogin.jsp";
		}
		function addBean(obj) {  //Ajax异步获取验证码
	        $.ajax({  
	            url : "\addFeeAjax",  
	            type : "GET",  
	            data : {Text:"addFeeAjax",Customer:<%=session.getAttribute("user")%>,secNumber:$("#secNumber").val()},  
	            success : function(root) {  
	                $("#protectedFee").val(parseInt($("#protectedFee").val())+500);
	                alert("成功")
	            },
	            error:function(){
	            	alert("失败");
	            }
	        });  
	    }  
	</script>
  </head>
  <body>
  	<!--个人中心-->
  	<div class="main">
  		<div class="cover">
    		<div class="use">
    			<span style="display:block; width:200px; padding-left:10px;text-align:left;background:#fff; border:1px solid #333;">密保充值</span>
    			<span>密保卡号</span><input type="text" id="secNumber">
    			<input type="button" name="Submit" value="提交" onclick="addBean()" style="float:left;width:100px;border:0;background:#5A98DE;color:#fff;">
    			<input type="button" class="close" name="Cancel" value="取消" style="float:right;width:100px;border:0;background:#5A98DE;color:#fff;">
    		</div>
    	</div>
    	<div class="main-top clear">
    		<span><%=session.getAttribute("user")%>用户，乐豆系统欢迎您！2016年6月13日 星期一</span><button onclick="out()">退出</button>
    	</div>
    	<div class="main-bottom">
    		<ul class="first clear">
    			<li class="active">消费记录查询</li>
    			<li>余额查询</li>
    		</ul>
    		<div class="second search">
				<div class="search">
				</div>
				<div class="lists">
					<table border="0" cellspacing="0" >
						<tr>
							<th></th>
							<th style="width:150px;background-color:#f0fff0;">ID</th>
							<th style="width:150px;background-color:#dfffdf;">帐号</th>

							<th style="width:180px;background-color:#bbffbb;">号码</th>
							<th style="width:150px;background-color:#a6ffa6;">状态</th>
							<th style="width:550px;background-color:#93ff93;">创建</th>
						</tr>
						
						<s:iterator value="list" status="stu">
					    	<tr>
					    		<td><input type="radio" ></td>
					    		<td><s:property value="id"/></td>
					    		<td><s:property value="User_account"/></td>
					    		<td><s:property value="User_phone"/></td>
					    		<td id="statusId"><s:property value="User_status"/></td>
					    		<td><s:property value="Create_time"/></td>
					    	</tr>
	    				</s:iterator>
					</table>
				</div><br>
    		</div>
    		<div class="second retain">
	    		<s:iterator value="list" status="stu">
	    			<span>话费余额</span><input value="<s:property value="charge_balance"/>"><br>
	    			<span>乐豆余额</span><input value="<s:property value="beans_balance"/>"><br>
	    			<span>密保余额</span><input id="protectedFee" value="<s:property value="protected_balance"/>">
	    			<button  style="width:100px">密保充值</button > <br>
	   			</s:iterator>
    		</div>
    	</div>
    </div>
    <script>
    	/* 左右切换*/
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
    		$(".retain > button").click(function(){
    			mask();
    			$('.cover').css("display","block");
    			$('.close').click(function(){
    				$('.cover').css("display","none");
    				$(".mask").remove();
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
    
    </script>
  </body>
</html>
