<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新增乐豆比例</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		.addLedou{ height:220px; width:300px;background:#00ff00;margin:150px auto 0;padding-top:10px;}
		.top{height:30px; width:280px; margin:0 auto; background:#fff;}
		.top span{height:100%; width:100%; padding-left:10px; line-height:30px;}
		
		.middle{ height:130px; width:280px; margin:20px auto 0;}
		.middle span{ background:#bdbdbd;display:inline-block;height:30px; width:100px; text-align:center; line-height:30px;}
		.middle span:first-child{ float:left;background:#bdbdbd;display:inline-block;height:30px; width:100px; text-align:center; line-height:30px;}
		.middle select{ border:0; height: 30px; width:150px; float:right; }
		.middle input{ height:30px; width:150px; float:right;}
		
		
		.bottom{ height:30px; width:280px;padding:0 10px;}
		.bottom input{height:30px; width:100px; border:0;}
	</style>

  </head>
  
  <body>
    <div class="addLedou">
    	<div class="top">
    		<span>新增乐豆比例</span>
    	</div>
    	<form action="" method="post">
	    	<div class="middle clear">
	    		<span>省份</span>
	    		<select>
	    			<option>江苏省</option>
	    			<option>浙江省</option>
	    			<option>湖北省</option>
	    			<option>山东省</option>
	    			<option>河南省</option>
	    		</select>
	    		<span style="width:280px;margin:10px auto;">请输入赠送一个乐豆所需要的话费：</span>
	    		<span style="float:left;">消费金额</span><input type="text" name="Price">
	    		
	    	</div>
	    	<div class="bottom clear">
	    		<input type="submit" name="Submit" style="float:left;">
	    		<input type="reset" name="Reset" value="取消"style="float:right;">
	    	</div>
    	</form>
    </div>
  </body>
</html>
