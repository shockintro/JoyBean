<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'structReceive.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
		$("input").click(function(){
		alert("sadf");
			$(this).parents("tr").children("td").each(function(){
		
				alert($(this).val());
			});
		})
	</script>
  </head>
  
  <body>
    <form action="<%=path %>/user/test.action" method="post">
    	<img  src="./icon/1.jpg" />
    	<table>
	    	<tr>
	    		<th></th>
		    	<th>id</th>
		    	<th>phone</th>
	    	</tr>
	    	<tr>
		    	<s:iterator value="listUser" status="stu">
			    	<tr>
			    	
			    		<td><input type="radio" ></td>
			    		<td><s:property value="id"/></td>
			    		<td><s:property value="User_account"/></td>
			    	</tr>
		    	</s:iterator>
	    	</tr>
	    	<input type="text" id="lhf"/>
	    	<input type="text" id="lhf1"/>
    	</table>
    </form>
  </body>
</html>
