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
		
		.main{height:450px; width:800px; margin:200px auto 0; padding-top:10px;}
		.main .cover{ height:200px; width:280px; margin:150px auto;background:rgb(245,246,247); position:fixed; top:100px; left:400px; display:none;padding:10px;border:1px solid #000;}
		.main .close{ height:15px; width:15px; position:absolute; top:0; right:0;cursor:pointer;} 
		.main .close:hover{ background:#0000ff;}
		.main .use span{ height:30px; width:100px; display:inline-block; line-height:30px; text-align:center;background:#bdbdbd;margin:10px 5px;}
		.main .use input{ height:30px; width:150px; margin:10px 5px;} 
		
		.main .main-top{height:30px; width:760px; margin:0 auto;border:1px solid #000;padding:0 10px;}
		.main .main-top span{ line-height:30px;}
		.main .main-top button{ float:right;height:25px; width:70px; border:0;background:#388bff; border-radius:5px;margin-top:2.5px; color:#fff;}
		.main .main-bottom{height:380px;width:780px; margin:20px auto 0;}
		.main .main-bottom .first{height:30px; width:780px;}
		.main .main-bottom .first li{ cursor:pointer;display:block; width:180px; height:30px;float:left; text-align:center; line-height:30px; background:#f2f2f2;}
		.main .main-bottom .first .active{ background:#d7d7d7;}
		
		.main .main-bottom .second{padding:10px; overflow-y:auto;height:330px; width:760px; margin:0 auto; background:#fff; border:1px solid #000;}
		.main .main-bottom .second li{ margin-top:15px;height:200px; width:160px; float:left;margin-left:30px;}	
		.main .main-bottom .second li img{width:160px; height:140px;border:1px solid #000; border-radius:20px;}
		.main .main-bottom .second li .box{width:160px; height:50px;margin-top:10px;border:1px solid #333; }
		.main .main-bottom .second li .box p{ height:15px; width:100%;margin:0; text-align:center;font-size:14px;}
		.main .main-bottom .second li .box span,.main .main-bottom .second li .box a{ font-size:14px;}
		.main .main-bottom .second li .box a{cursor:pointer;}
		
		.second  .search{ margin:10px 0;}
		.second  .search span{margin-left:20px;display:inline-block; width:70px; height:30px; line-height:30px;text-align:center;background:#d7d7d7;}
		.second  .search span:first-child{margin-left:0;}
		.second  .search input{width:60px;height:30px;margin-left:10px;}
		.second  .search button{width:70px;height:30px;margin-left:30px; border:0;border-radius:5px;background:#388bff;color:#fff; }
		
		.second  .lists{ height:180px; width:400px;}
		.second  .lists table th,td{height:30px; width:100px;text-align:center; line-height:30px;}
		.second  .pages{ height:30px; width:300px;border:1px solid #000; margin-top:20px;}
		.second  .pages span{height:100%; width:100%; line-height:30px;padding-left:10px;}
		
		.main .main-bottom .retain{ display:none;}
		.main .main-bottom .retain span{display:inline-block;height:30px;width:100px; margin:10px 10px 0 0; text-align:center;background:#d7d7d7; line-height:30px;}
		.main .main-bottom .retain input{height:30px; width:100px;margin:10px 10px 0 0;}
		.main .main-bottom .retain span:last-child{width:450px;text-align:left; }
		.main .main-bottom .retain span:first-child{margin-top:30px;}
		.main .main-bottom .retain button{width:70px;height:30px;margin-left:30px; border:0;border-radius:5px;background:#388bff;color:#fff; }
		
	</style>
	<script>
		 function testAjax(obj) {  //Ajax异步获取验证码
	        $.ajax({  
	            url : "\PersonalCenter",  
	            type : "GET",  
	            data : {},  
	            success : function(root) {  
	                var list=root;
	                alert(root);
	            },
	            error:function(){
	            	alert("failed");
	            }
	        });  
	    }  
	</script>
  </head>
  
  <body>
  	<!--个人中心-->
  	<div class="main">
  		<div class="cover">
    		<div class="close">X</div>
    		<div class="use">
    		<form action="" method="post">
    			<span style="display:block; width:200px; padding-left:10px;text-align:left; ">密保充值</span>
    			<span>密保卡号</span><input>
    			<span>密码</span><input>
    			<input type="submit" name="Submit" value="提交" style="float:left;width:100px;">
    			<input type="reset" name="Reset" value="取消" style="float:right;width:100px;">
    		</form>
    		</div>
    	</div>
    	<div class="main-top clear">
    		<span>用户，乐豆系统欢迎您！2016年6月13日 星期一</span><button>退出</button>
    	</div>
    	<div class="main-bottom">
    		<ul class="first clear">
    			<li class="active">消费记录查询</li>
    			<li>余额查询</li>
    		</ul>
    		<div class="second search">
				<div class="search">
					<span>游戏名称</span><input type="text" name="user">
					<span>购买方式</span><input type="text" name="name">
					<button onclick="testAjax(this)">查询</button>
				</div>
				<div class="lists">
					<table border="1" cellspacing="0" >
						<tr>
							<th></th>
							<th>ID</th>
							<th style="width:180px;">用户帐号</th>
							<th>姓名</th>
							<th style="width:180px;">手机号码</th>
							<th>状态</th>
							<th style="width:180px;">创建时间</th>
						</tr>
						<tr>
							<td>dhsh</td>
							<td>dfhbsdf</td>
							<td>dfhzd</td>
							<td>ZSDHFzd</td>
							<td>fg</td>
							<td>SGHZS</td>
							<td>SHG</td>
						</tr>
						<s:iterator value="list" status="st">
					    <tr>
					      <td><s:property value="list"/></td>
					      <td><s:property value="list1"/></td>
					      <td><s:property value="list1.map"/></td>
					      <td><s:property value="list1.userName"/></td>
					      <td><s:property value="map.userName"/></td>
					      <td><s:property value="userName"/></td>
					    </tr>
					    </s:iterator>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
				<div class="pages">
					<span>总共5页，当前是第1页，</span>
				</div>
    			
    		</div>
    		<div class="second retain">
    			<span>话费余额</span><input><br>
    			<span>乐豆余额</span><input><br>
    			<span>密保余额</span><input>  	<span>密保到期时间</span><input type="text" name="Time" value="2017-3-13" style="text-align:center;"> <button>密保充值</button> <br>
    			<span>密保到期之后，密保余额将自动归零，请尽快使用！</span>
    			
    			
    		</div>
    	</div>
    </div>
    <script>
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
    			$('.cover').css("display","block");
    		});
    		$('.close').click(function(){
    			$('.cover').css("display","none");
    		});
    	});
    </script>
  </body>
</html>
