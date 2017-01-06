<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
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
		.login{ height:260px;width:300px; margin:200px auto 0;padding-top:5px;}
		.button{height:50px; width:290px; margin:0 auto; background:#bdbdbd;margin:5px auto;color:#000;}
		.button span{display:block; height:100%; width:100%; text-align:center; line-height:50px;}
		.detail{height:150px; width:290px; margin:0 0 0 5px;  }
		.detail span{display:inline-block; height:30px; width:100px; background:#bdbdbd; text-align:center; line-height:30px;margin:10px 0;}
		.detail input{ height:30px; width:150px; float:right;margin:10px 0;}
		.subButton{display:block;height:28px; width:295px; margin:5px auto 0; border:0;padding:0; border:1px solid #fff;background:#388bff;color:#fff; border-radius:5px; font-size:14px;}
		.detail button{ display:block; height:30px; width:85px;float:right; margin:10px 0;border:0;font-size:14px; border-radius:5px;background:#388bff;color:#fff;}
		.checkCode{width:290px;height:30px;text-align:center;margin:0 auto;}
		.center{text-align:center;}
		.checkButton{width:85px;height:30px;display:block;}
		
	</style>
	<script>
	var flag=true;
	var count=60;
	    function testAjax(obj) {  //Ajax异步获取验证码
	    	flag=true;
	        var $userNameInput = $("#Text");  
	        var userName = $userNameInput.val();  
	        $.ajax({  
	            url : "\pluginAjax",  
	            type : "GET",  
	            data : {Text:"Text"},  
	            success : function(root) {  
	                $("#checkCode").val(root); 
	            },
	            error:function(){
	            	alert("failed");
	            }
	        });  
	        
	        setTime(obj);
	    }  
	    
	    function setTime(obj){
	    	if(count==0){
	    		obj.removeAttribute("disabled");
	    		obj.value="发送验证码";
	    		count=60;
	    		flag=false;
	    		return;
	    	}else{
	    		obj.setAttribute("disabled",true);
	    		obj.value="重新发送"+count;
	    		count--;
	    	}
	    	setTimeout(function(){
	        	setTime(obj)
	        },1000)
	    }
	    
	    function check(){//验证码校验
	    	var Customer=$("#Customer").val();
	    	var Password=$("#Password").val();
	    	if(Customer==''||Customer==null||Password==''||Password==null){
	    		alert("用户名 或 密码不能为空!");
	    		return false;
	    	}
	    	var checkCode=$("#checkCode").val();
	    	var checkInput=$("#Text").val();
	    	if(checkCode==checkInput){
		    	if(flag==true)
		    		return true;
		    	else{
		    		alert("验证码失效!")
		    		return false;
		    	}
	    	}else {
	    		alert("验证码错误!");
	    		return false;
	    	}
	    
	    }
	    

	</script>

  </head>
  
  <body>
  <!--用户登陆-->
  	<div class="login">
  		<div class="center">
  		<input class="checkCode" type="text" id="checkCode" disabled="true" />
  		</div>
  		<div class="button"> <span>用户登录</span></div>
  		<form method="post" action="index.jsp" onsubmit="return check()">
  			
	  		<div class="detail clear">
	  			<span>用户帐号</span>&nbsp;&nbsp;<input type="text" id="Customer" name="Customer"><br>
	  			<span>密码</span>&nbsp;&nbsp;<input type="password" id="Password" name="Password"><br>
	  			<span>验证码</span>&nbsp;&nbsp;<input type="text" id="Text" name="Text" style="float:none;width:50px;margin-left:32px;">
	  			<input style="width:85px;height:30px;" type="button" id="button" onclick="testAjax(this)" value="发送验证码" /><br>
	  		</div>
	  		<input class="subButton" type="submit" name="Submit" value="登录"/>
	  	</form>
  	</div>
  </body>
</html>
