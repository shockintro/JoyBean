<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		.clear{ display:block; clear:both; content:"";}
		.clear{ zoom:1;}
			.register{ height:260px;width:300px; margin:200px auto 0;padding-top:5px;}
		.button{height:50px; width:290px; margin:0 auto; background:#ECF4FF;color:#5A5A5A;margin:5px auto;}
		.button span{display:block; height:100%; width:100%; text-align:center; line-height:50px; color:#5A5A5A;}
		.detail{height:150px; width:290px; margin:0 0 0 5px;  }
		.detail span{display:inline-block; height:30px; width:110px;color:#5A5A5A; background:#ECF4FF; text-align:center; line-height:30px;margin:10px 0;}
		.detail input{ height:30px; width:150px; float:right;margin:10px 0; border:1px solid #96A5B4;}
		.subButton{display:block;height:28px; width:295px; margin:5px auto 0; border:0;padding:0; border:1px solid #fff; border-radius:5px;background:#5A98DE; color:#fff;font-size:14px;}
		.cancel{display:block;height:28px; width:295px; margin:5px auto 0; border:0;padding:0; border:1px solid #fff; border-radius:5px; background:#5A98DE;color:#fff;font-size:14px;}
		.detail button{ display:block; height:30px; width:85px;float:right; margin:10px 0;border:0;font-size:14px; background:#5A98DE;color:#fff;border-radius:5px;}
		
	</style>
	<script>
		function check(){
			var Customer=$("#Customer").val();
			var Password=$("#Password").val();
			var rePassword=$("#rePassword").val();
			var Name=$("#Name").val();
			var Number=$("#Number").val();
			if(Customer==""||Customer==null||Password==""||Password==null||rePassword==""||rePassword==null||Name==""||Name==null||Number==""||Number==null){
				alert("请填写完整!");
				return false;
			}else if(Password!=rePassword){
					alert("两次输入密码不一致!");
					return false;
			}else
			return true;
		}
	</script>

  </head>
  
  <body>
  <!--用户注册-->
  	<div class="register">
  		<div class="button"> <span>用户注册</span></div>
  		<form method="post" action="<%=path %>/user/register.action" onsubmit="return check()">
	  		<div class="detail clear">
	  			<span>用户帐号</span><input type="text" id="Customer" name="Customer"><br>
	  			<span>密码</span><input type="password" id="Password" name="Password"><br>
	  			<span>再次确认密码</span><input type="password" id="rePassword" name="rePassword"><br>
	  			<span>姓名</span><input type="text" id="Name" name="Name"><br>
	  			<span>手机号码</span><input type="text" id="Number" name="Number"><br>
	  		</div>
	  		<input class="subButton" type="submit" name="Submit" style="margin-top:10px;"/>
	  		<input class="cancel" type="reset" name="Reset" value="取消" style="margin-top:10px;"/>
	  	</form>
  	</div>
  </body>
</html>
