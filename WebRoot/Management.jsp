<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.*" %>
<%@ page import="njupt.model.T_User" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  
    <title>用户管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<style>
	ul{margin:0;padding:0;}
	li{ list-style:none;}
	.clear{ display:block; clear:both; content:"";}
	.clear{ zoom:1;}
	.mask { background: #000; opacity: 0.5;position: fixed;z-index: 9999;top: 0;left: 0;}
    
	.managemnet{height:453px; width:800px;margin:150px auto 0;padding-top:10px; background:#4B8FA5; border-radius:5px;}
	
	.managemnet-top{height:30px; width:770px; margin:0 auto; background:#fff; border-radius:5px;}
	.managemnet-top span{font-size:14px;padding-left:10px;height:30px; width:700px; line-height:30px; display:block; float:left;}
	
	.managemnet-top  button{padding:0;border:0;border-radius:5px;display:block; height:25px; width:50px; background:#5A98DE;color:#fff;float:right;margin:2.5px 5px;}
	
	.management-bottom{ height:400px;width:790px; margin:10px auto;}
	.management-bottom .bottom-left{ height:400px; width:120px; float:left;}

	.bottom-left .control li{ border-radius:5px;cursor:pointer;display:block; height:30px; width:100px; line-height:30px; text-align:center;margin:10px auto;background:#fff;}
	
	.management-bottom .bottom-right{height:400px; width:655px; float:left;margin-left:5px; background:#fff;border-radius:5px;}
	.management-bottom .bottom-right li{border-radius:5px;display:block;  height:378px; width:614px;padding:10px 20px; background:#fff;}
	
	.bottom-right  .head{ height:30px;background: #DCDCDC; border-radius: 5px;width:100px;line-height:30px;text-align:center;}
	
	.bottom-right  .search{ margin:10px 0;}
	.bottom-right  .search span{margin-left:20px;display:inline-block; width:70px; height:30px; line-height:30px;text-align:center;background:#ECF4FF;}
	.bottom-right  .search span:first-child{margin-left:0;}
	.bottom-right  .search input{width:60px;height:30px;margin-left:10px;}
	.bottom-right  .search select{display:inline-block;height: 30px;width: 70px; margin-left: 10px;border: 0;background:#ECF4FF;}
	.bottom-right  .search button{width:100px;height:30px;margin:0 10px;float:right;background:#5A98DE;color:#fff; border-radius:5px;}
	
	.bottom-right  .usage{ height:50px; width:668px; margin:0 auto; }
	.bottom-right  .usage button{float:left;width:100px;height:30px;margin-left:10px; border-radius:5px;background:#5A98DE;color:#fff;}
	.bottom-right  .usage button:first-child{ margin-left:0;}
	
	.bottom-right  .lists{ height:180px; width:600px;}
	.bottom-right  .lists table th,td{height:30px; width:auto;text-align:center;border:1px solid #A9A9A9; box-sizing:border-box; line-height:30px;}
	
	.bottom-right  .pages{ height:30px; width:300px;border:1px solid #000; margin-top:20px;}
	.bottom-right  .pages span{height:100%; width:100%; line-height:30px;padding-left:10px;}
	
	.bottom-right  .two .cover{ height:200px; width:300px; position:fixed; z-index:100000;background:#ECF4FF; top:200px; left:550px; display:none;border:1px solid #000;}
	.bottom-right  .two .cover .use span{ height:30px; width:100px; display:inline-block; line-height:30px; text-align:center;background:#B7CEEF;margin:10px 5px;}
	.bottom-right  .two .cover .use input{ height:30px; width:150px; margin:10px 5px;} 
	
	.bottom-right  .three .cover{padding:10px; height:520px; width:450px; position:fixed;z-index:100000; background:#ECF4FF; top:150px; left:550px;display:none;border:1px solid #000; }
	.bottom-right  .three .cover .left{float:left;width:300px;height:500px;}
	.bottom-right  .three .cover .left .use span{ height:30px; width:100px; display:inline-block; line-height:30px; text-align:center;background:#B7CEEF;margin:10px 5px;float:left;}
	.bottom-right  .three .cover .left .use input{ height:30px; width:150px; margin:10px 5px;float:right;} 
	
	.bottom-right  .three .cover .right{ float:right;width:100px; height:150px;padding-top:330px;padding-right:10px;}
	
	.bottom-right  .four .cover{ height:240px; width:300px;position:fixed; z-index:100000;background:#ECF4FF;border:1px solid #000; top:100px; left:550px;margin:150px auto 0;padding-top:10px; display:none;}
	.bottom-right  .four .cover .top{height:30px; width:280px; margin:10px auto 0 ; background:#fff;border:1px solid #000;}
	.bottom-right  .four .cover .top span{height:100%; width:100%; padding-left:10px; line-height:30px;}
	
	.bottom-right  .four .cover .middle{ height:130px; width:280px; margin:20px auto 0;}
	.bottom-right  .four .cover .middle span{ background:#B7CEEF;display:inline-block;height:30px; width:100px; text-align:center; line-height:30px;}
	.bottom-right  .four .cover .middle span:first-child{ float:left;display:inline-block;height:30px; width:100px; text-align:center; line-height:30px;}
	.bottom-right  .four .cover .middle select{ border:0; height: 30px; width:150px; float:right; }
	.bottom-right  .four .cover .middle input{ height:30px; width:150px; float:right;}
	
	.bottom-right  .five .cover{ height:340px; width:300px;padding:10px;position:fixed;z-index:100000;background:#ECF4FF;border:1px solid #000; top:50px; left:550px;margin:150px auto 0;padding-top:10px; display:none;}
	
	.bottom-right  .five .cover .use span{ height:30px; width:100px; display:inline-block; line-height:30px; text-align:center;background:#B7CEEF;margin:10px 5px 0 ;float:left;}
	.bottom-right  .five .cover .use input{ height:30px; width:150px; margin:10px 5px 0;float:right;}
	.bottom-right  .five .cover .use .check{ height:60px; width:290px;}
	.bottom-right  .five .cover .use .check span{     height: 20px; width: 54px; background: none; float: left; line-height: 16px;text-align: left;}
	
	.bottom{ height:30px; width:280px;padding:0 10px;}
	.bottom input{height:30px; width:100px; border:0;}
	</style>
	
<script>
	var status;
	function check(){
		var customer=$("#Customer").val();
		var number=$("#Number").val();
		if((number==""||number==null)&&(customer==""||customer==null)){
			return false;
		}
		return true;
	}
	
	function check1(){
		if($("#gameType").val()==""||$("#gameType").val()==null)return false;
	}
	function gameQuery(){
		if(($('#gameNameThree').val()==""||$('#gameNameThree').val()==null)&&($('#gameTypeThree').val()==""||$('#gameTypeThree').val()==null))return false;
	}
	function oneAjax(){
		$.ajax({
			url : "\statusAjax",  
			type : "GET",
			data : {Text:"status",beeStatus:status},
			success : function(root) {
			alert("ok");  
	        },
			error:function(root) {  
			alert("false");  
	        }
		});
		var statu=$('#statusId').html();
		if(parseInt(statu)==1)
			$('#statusId').text("2");
		else
			$('#statusId').text("1");
	}
	
	function addGameTypeAjax(){
		$.ajax({
			url : "\addGameAjax",  
			type : "GET",
			data : {Text:"addGameType",addGameType:$("#addGameType").val(),addGameStatus:$('input[name="addBusiness"]:checked').val()},
			success : function(root) {
				alert("ok");  
	        },
			error:function(root) {  
				alert("false");  
	        }
		});
	}
	
	function gameTypeChange(){
		$.ajax({
			url : "\gameTypeChange",  
			type : "GET",
			data : {Text:"gameTypeChange",changeGameTypeName:$("#change0").val(),changeGameTypeBusiness:$('input[name="changeGameTypeBusiness"]:checked').val()},
			success : function(root) {
				alert("ok");  
	        },
			error:function(root) {  
				alert("false");  
	        }
		});
		var statu=$('#gameTypeStatusId').html();
		if(parseInt(statu)==1)
			$('#gameTypeStatusId').text("2");
		else
			$('#gameTypeStatusId').text("1");
	}
	
	function addGame(){
		$.ajax({
			url : "\addGame",  
			type : "GET",
			data : {Text:"addGame",
					gameName:$("#gameName").val(),
					gameStatus:$('input[name="gameStatus"]:checked').val(),
					gameType:$('#select1 option:selected').val(),//选中的值
					textAera:$('#textAera').val(),
					iconAddress:$('#iconAddress').val(),
					chargeFee:$('#chargeFee').val(),
					beanFee:$('#chargeFee').val()
					},
			success : function(root) {
				alert("ok");  
	        },
			error:function(root) {  
				alert("false");  
	        }
		});
	}	
	function changeGame(){
		alert($("#change100").val()+"id "+$("#change1").val()+"name "+$('input[name="changeStatus"]:checked').val()+"status "+$('#changeType option:selected').val()+"type "+$('#change4').val())
		$.ajax({
			url : "\changeGame",  
			type : "GET",
			data : {Text:"changeGame",
					gameId:$("#change100").val(),
					gameName:$("#change1").val(),
					gameStatus:$('input[name="changeStatus"]:checked').val(),
					textAera:$("#changeTextAera").val(),
					iconAddress:$("#iconAddress").val(),
					chargeFee:$("#change3").val(),
					beanFee:$("#change4").val()
					},
			success : function(root) {
				alert("ok");  
	        },
			error:function(root) {  
				alert("false");  
	        }
		});
	}
	
	function out(){
		window.location.href="http://localhost:8080/JoyBean/login.jsp";
	}
	
</script>
  </head>
  	<%
  		  String user = (String) session.getAttribute("user");  
  		  String pwd = (String) session.getAttribute("password");  
  		  if(user.equals("")||user==null)
  		  response.sendRedirect("/login.jsp");
  	 %>
  <body>
  	<!--用户管理-->
  	<div class="managemnet">
  		<div class="managemnet-top clear">
  			<span>[<%=session.getAttribute("user") %>]号 管理员，欢迎使用邮豆后台管理系统！ </span>
  			<button onclick="out()">退出</button>
  		</div>
  		<div class="management-bottom clear">
  			<div class="bottom-left">
  				<ul class="control">
  					<li style="margin-top:0;">用户管理</li>
  					<li>游戏类型</li>
  					<li>游戏列表</li>
  					<!-- <li>乐豆换算比例</li>
  					<li>生成密保卡</li> -->
  				</ul>
  			</div>
  			<div class="bottom-right">
  				<ul>
  					<li class="one">     
  					<form action="<%=path %>/user/beanFeeInfo.action" method="post" onSubmit="return check()" id="form1">                                         
  						<div class="head">用户管理</div>
  						<div class="search">
  							<span>帐号</span><input type="text"  id="Customer" name="Customer" style="width:110px;">
  							<span>手机号码</span><input type="text" id="Number" name="Number" style="width:150px;">
  							<button >查询</button>
  						</div>
  						<div class="usage clear">
  							<button onclick="oneAjax()">更改状态</button>
  						</div>
  						<div class="lists">
  						
  							<table border="1" cellspacing="0"   >
  								<tr>
  									<th></th>
  									<th>ID</th>
  									<th>用户帐号</th>
  									<th>手机号码</th>
  									<th>状态</th>
  									<th>创建时间</th>
  								</tr>
  								<tr>
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
  								</tr>
  							</table>
  							
  						</div>
  						<%-- <div class="pages">
  							<span>总共5页，当前是第1页，</span>
  						</div> --%>
  						</form>
  					</li>
  					
<!-- ---------000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000-------- -->
  					<li class="two">
  						<div class="cover cover1">
  							<div class="use">
				    		
				    			<span style="display:block; width:250px; padding-left:10px;text-align:left; ">新增游戏类型</span>
				    			<span>类型名称</span><input name="addGameType" id="addGameType">
				    			<span>状态</span><input type="radio" id="addBusiness" name="addBusiness" checked=true style="width:15px; height:15px;" value="1">商用
				    			<input type="radio" id="addBusiness" name="addBusiness" style="height:15px; width:15px;" value="2">下线
				    			<input type="button" onclick="addGameTypeAjax()" name="Submit" value="提交" style="float:left;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
				    			<input type="button" name="Cancel" class="close" value="取消" style="float:right;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
				    		</div>
  						</div>
  						<div class="cover cover2">
  							
	  							<div class="use">
					    			<span style="display:block; width:250px; padding-left:10px;text-align:left; ">修改游戏类型</span>
					    			<span>类型名称</span><input  id="change0" type="text" id="changeGameTypeName" name="changeGameTypeName">
					    			<span>状态</span><input type="radio" id="changeGameTypeBusiness" name="changeGameTypeBusiness" checked=true style="width:15px; height:15px;"value="1">
					    			商用<input type="radio" name="changeGameTypeBusiness" style="height:15px; width:15px;"value="2">下线
					    			<input type="submit" name="Submit" onclick="gameTypeChange()" value="提交" style="float:left;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
					    			<input type="button" name="Cancel" class="close" value="取消" style="float:right;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
					    		</div>
				    		
  						</div>
  						<div class="head">游戏类型</div>
  						<form action="<%=path %>/user/gameType.action" method="post" onSubmit="return check1()">
  						<div class="search">
  							<span>类型名称</span><input type="text" id="gameType" name="gameType">
  							<span>状态</span><select>
  								<option>商用</option>
  								<option>下线</option>
  							</select>
  							<button>查询</button>
  						</div>
  						<div class="usage clear">
  							<button id="gameAdd">新增</button>
  							<button id="gameRevise">修改</button>
  						</div>
  						<div class="lists">
  						
  							<table border="1" cellspacing="0" >
  								<tr>
  									<th></th>
  									<th>ID</th>
  									<th>类型名称</th>
  									<th>状态</th>
  									<th>创建时间</th>
  									<th>更新时间</th>
  								</tr>
  								<tr>
  									<s:iterator value="listGameType" status="stu">
						    	<tr>
						    		<td><input type="radio" ></td>
						    		<td><s:property value="id"/></td>
						    		<td><s:property value="type_name"/></td>
						    		<td id="gameTypeStatusId"><s:property value="type_status"/></td>
						    		<td><s:property value="create_time"/></td>
						    		<td><s:property value="modify_time"/></td>
						    	</tr>
		    				</s:iterator>
  								</tr>
  								
  							</table>
  							</form>
  						</div>
  					</li>
<!-- ---------000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000-------- -->
  					
  					<li class="three">
  						
  						<div class="cover cover1" style="top:50px;">
  							<div class="left">
	  							<div class="use clear">
					    		
					    			<span style="display:block; width:280px; padding-left:10px;text-align:left;">新增游戏</span>
					    			<span>游戏名称</span><input id="gameName"  name="gameName"><br>
					    			<span>游戏状态</span><input type="radio" id="gameStatus" name="gameStatus" checked=true value="1" style="margin-left:35px;width:15px; height:30px;float:left;">
					    			<span style="height:30px; width:40px; background:none;">商用</span>   <input type="radio" id="gameStatus" name="gameStatus" value="2" style="height:30px; width:15px;float:left;">
					    			<span style="height:30px;width:40px; background:none;">下线</span>    <br>
					    			<span  style="float:left;">游戏类别</span>
					    			<select id="select1" style="background:#B7CEEF;width:150px;height:30px; float:right;margin:10px 5px;">
					    				<option value="adventure">冒险</option>
		  								<option value="puzzle">解密</option>
		  								<option value="shoot">射击</option>
		  								<option value="strategy">竞策略类</option>
		  								<option value="fantasy">迷幻</option>
					    			</select><br>
					    			<span style="height:100px;width:100px;">游戏详情</span><textarea id="textAera" name="textAera"style="margin:10px 5px;height:100px;width:150px;overflow:scroll;float:right;"></textarea><br>
					    			<span id="picFile">游戏图片</span><input id="iconAddress" name="iconAddress"><br>
					    			<span>话费价格</span><input id="chargeFee" name="chargeFee"><br>
					    			<span>乐豆价格</span><input id="beenFee" name="beenFee"><br>
					    			<input type="submit" name="Submit" value="提交" onclick="addGame()" style="float:left;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
				    				<input type="button" name="Cancel" value="取消" class="close" style="float:right;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
					    		
					    		</div>
  							</div>
  							<div class="right">
  								<label class="ui_button ui_button_primary" for="xFile" style="display:block;width:100px;height:30px; background:#5A98DE;border-radius:5px;line-height:30px;text-align:center;color:#fff;">选择上传地址</label>
								<input type="file" id="xFile" style="position:absolute;clip:rect(0 0 0 0);">
  							</div>
  							
  						</div>
  						<div class="cover cover2" style="top:50px;">
  							<div class="left">
	  							<div class="use clear">
					    			<span style="display:block; width:280px; padding-left:10px;text-align:left;">修改游戏</span>
					    			<span>游戏ID</span><input id="change100" type="text" name="change100" ><br>
					    			<span>游戏名称</span><input id="change1" type="text" name="change1" ><br>
					    			<span>游戏状态</span><input type="radio" id="changeStatus" name="changeStatus" checked=true value="1" style="margin-left:35px;width:15px; height:30px;float:left;"><span style="height:30px; width:40px; background:none;">商用</span>   <input type="radio" id="changeStatus" name="changeStatus" value="2" style="height:30px; width:15px;float:left;"><span style="height:30px;width:40px; background:none;">下线</span>    <br>
					    			<span  style="float:left;">游戏类别</span>
					    			<select id="changeType" style="background:#B7CEEF;width:150px;height:30px; float:right;margin:10px 5px;">
					    				<option value="1">冒险</option>
		  								<option value="2">解密</option>
		  								<option value="3">射击</option>
		  								<option value="4">竞策略类</option>
		  								<option value="5">迷幻</option>
					    			</select><br>
					    			<span style="height:100px;width:100px;">游戏详情</span>
					    			<textarea id="changeTextAera" style="margin:10px 5px;height:100px;width:150px;overflow:scroll;float:right;" id="change2"></textarea><br>
					    			<span id="picFile">游戏图片</span><input id="change5"><br>
					    			<span>话费价格</span><input id="change3" type="text" name="TypeName" ><br>
					    			<span>乐豆价格</span><input id="change4" type="text" name="TypeName" ><br>
					    			<input type="submit" name="Submit" value="提交" onclick="changeGame()" style="float:left;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
				    				<input type="button" name="Cancel" value="取消" class="close" style="float:right;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
					    		</div>
  							</div>
  							<div class="right">
  								<label class="ui_button ui_button_primary" for="xFile" style="display:block;width:100px;height:30px; background:#5A98DE;border-radius:5px;line-height:30px;text-align:center;color:#fff;">选择上传地址</label>
								<form><input type="file" id="xFile" style="position:absolute;clip:rect(0 0 0 0);"></form>
  							</div>
  							
  						</div>
						<div class="head">游戏列表</div>
						<div class="usage clear">
  							<button>新增</button>
  							<button>修改</button>
  						</div>
						<form action="<%=path %>/user/game.action" method="post" onsubmit="return gameQuery()">
  						<div class="search">
  							<span>游戏名称</span><input type="text" id="gameNameThree" name="gameNameThree">
  							<span>游戏类别</span><select id="gameTypeThree" name="gameTypeThree">
  								<option value="1">冒险</option>
  								<option value="2">解密</option>
  								<option value="3">射击</option>
  								<option value="4">竞策略类</option>
  								<option value="5">迷幻</option>
  							</select>
  							<button>查询</button>
  						</div>
  						
  						<div class="lists" style="overflow-y:scroll; ">
  							<table border="1" cellspacing="0" >
  								<tr>
  									<th></th>
  									<th>ID</th>
  									<th>游戏名称</th>
  									<th>游戏图片</th>
  									<th>状态</th>
  									<th>乐豆价格</th>
  									<th>话费价格</th>
  									<th>创建时间</th>
  									<th>更新时间</th>
  								</tr>
  								<tr>
  									<s:iterator value="listGame" status="stu">
								    	<tr>
								    		<td><input type="radio" name="l"></td>
								    		<td><s:property value="id"/></td>
								    		<td><s:property value="game_name"/></td>
								    		<td><s:property value="game_picture"/></td>
								    		<td><s:property value="game_status"/></td>
								    		<td><s:property value="beans_price"/></td>
								    		<td><s:property value="charge_price"/></td>
								    		<td><s:property value="create_time"/></td>
								    		<td><s:property value="modify_time"/></td>
								    	</tr>
				    				</s:iterator>
  								</tr>
  								
  							</table>
  						</div>
  						</form>
					</li>
<!-- ---------000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000-------- -->
<%-- 
  					<li class="four">
  						<div class="usage clear">
  							<button>新增</button>
  							<button>修改</button>
  							<button>删除</button>
  						</div>
  						  <div class="cover cover1">
					    	<div class="top">
					    		<span>新增乐豆比例</span>
					    	</div>
					    	<form action="" method="post">
						    	<div class="middle clear">
						    		<span>省份</span>
						    		<select style="background:#B7CEEF;">
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
						    		<input type="submit" name="Submit" value="提交" style="float:left;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
				    				<input type="button" name="Cancel" class="close" value="取消" style="float:right;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
						    	</div>
					    	</form>
					    </div>
					     <div class="cover cover2">
					    	<div class="top">
					    		<span>修改乐豆比例</span>
					    	</div>
					    	<form action="" method="post">
						    	<div class="middle clear">
						    		<span>省份</span>
						    		<select style="background:#B7CEEF;">
						    			<option>江苏省</option>
						    			<option>浙江省</option>
						    			<option>湖北省</option>
						    			<option>山东省</option>
						    			<option>河南省</option>
						    		</select>
						    		<span style="width:280px;margin:10px auto;">请输入赠送一个乐豆所需要的话费：</span>
						    		<span style="float:left;">消费金额</span><input id="change5" type="text" name="TypeName" >
						    		
						    	</div>
						    	<div class="bottom clear">
						    		<input type="submit" name="Submit" value="提交" style="float:left;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
				    				<input type="button" name="Cancel" class="close" value="取消" style="float:right;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
						    	</div>
					    	</form>
					    </div>
						<div class="head">乐豆换算比例</div>
						<span style="display:block;background:#ECF4FF;margin:10px 0;width:300px; height:30px; text-align:center; line-height:30px;">默认配置：消费一元赠送一个乐豆</span>
  						<div class="search">
  							<span>省份</span><input type="text" name="user">
  					
  							<button>查询</button>
  						</div>
  						
  						<div class="lists">
  							<table border="1" cellspacing="0" style="overflow-y:scroll; ">
  								<tr>
  									<th></th>
  									<th>ID</th>
  									<th>省份</th>
  									<th>消费金额</th>
  									<th>创建时间</th>
  									<th>更新时间</th>
  								</tr>
  								<tr>
  									<td><input type="radio" name="Radio"></td>
  									<td>dfhbsdf</td>
  									<td>dfhzd</td>
  									<td>ZSDHFzd</td>
  									<td>fg00000000000</td>
  									<td>SGHZS</td>
  								</tr>
  								<tr>
  									<td><input type="radio" name="Radio"></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  								</tr>
  							</table>
  						</div>
					</li>
<!-- ---------000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000-------- -->
					
  					<li class="five">
  						<div class="cover">
  							<div class="use clear">
  								<span  style="width:290px;text-align:left;background:#fff;border:1px solid #000;;">批量生成定向密保卡</span>
	  							<span>数量（张）</span><input type="text" name="TypeName" placeholder="50" >
	  							<span>选择省份：</span><div class="check clear">
	  							<form action="" method="post">
	  								<input type="checkbox" name="Hunan" style="height:15px; width:15px;float:left;"> <span>湖南</span>
	  								<input type="checkbox" name="Jiangsu" style="height:15px; width:15px;float:left;"> <span>江苏</span>
	  								<input type="checkbox" name="Shanghai" style="height:15px; width:15px;float:left;"> <span>上海</span>
	  								<input type="checkbox" name="Hubei" style="height:15px; width:15px;float:left;"> <span>湖北</span>
	  								<input type="checkbox" name="Henan" style="height:15px; width:15px;float:left;"> <span>河南</span>
	  								<input type="checkbox" name="Beijing" style="height:15px; width:15px;float:left;"> <span>北京</span>
	  							</form></div>
	  							<span>金额（个）</span><input id="change6" type="text" name="TypeName" >
	  							<span>有效开始时间</span><input id="change7" type="text" name="TypeName" >
	  							<span>有效结束时间</span><input id="change8" type="text" name="TypeName" >
	  							<input type="submit" name="Submit" value="提交" style="float:left;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
				    			<input type="button" name="Cancel" class="close" value="取消" style="float:right;width:100px;border:0;border-radius:5px;background:#5A98DE;color:#fff;">
  							</div>
  							
  						</div>
						<div class="head" style="width:120px;">定向密保卡管理</div>
  						<div class="search">
  							<span style="margin-left:0;">卡号</span><input type="text" name="user">
  							<span style="width:120px;">密保卡到期时间</span><input type="text" name="name">
  							<span>省份</span><input type="text" name="tel">
  							<button style="width:70px;">查询</button>
  						</div>
  						<div class="usage clear">
  							<button>导出</button>
  							<button style="width:150px;">批量生成定向密保卡</button>
  						</div>
  						<div class="lists">
  							<table border="1" cellspacing="0" >
  								<tr>
  									<th></th>
  									<th>卡号</th>
  									<th>密码</th>
  									<th>金额</th>
  									<th>省份</th>
  									<th>有效开始时间</th>
  									<th>有效结束时间</th>
  									<th>状态</th>
  									<th>创建时间</th>
  								</tr>
  								<tr>
  									<td><input type="radio" name="Radio"></td>
  									<td>dfhbsdf</td>
  									<td>dfhzd</td>
  									<td>ZSDHFzd</td>
  									<td>fg00000</td>
  									<td>SGHZS0000</td>
  									<td>SHG</td>
  									<td>SGHZS</td>
  									<td>SHG</td>
  								</tr>
  								<tr>
  									<td><input type="radio" name="Radio"></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  								</tr>
  								<tr>
  									<td><input type="radio" name="Radio"></td>
  									<td></td>
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
					</li> --%>
  				</ul>
  			</div>
  		</div>
  	</div>
     <script>
     
     /*点击切换界面*/
     
     $(function(){
     	$(".bottom-right").find('li:gt(0)').css("display","none");
     
     	$(".bottom-left").find('li').click(function(){
     		This = this;
     		var index = $(This).index();
     		$(".bottom-right").find("li").css("display","none");
     		$(".bottom-right").find("li").eq(index).css("display","block");	
     	});
     });
     /* 点击弹窗，背景覆盖*/
     $(function(){
     	/* 新增按钮 */
     	$(".bottom-right li").slice(1,4).find(".usage button:first-child").click(function(){
     		mask();
     		$(this).parents('li').find(".cover1").css("display","block");
     		$(".close").click(function(){
     			$(this).parents('li').find(".cover1").css("display","none");
     			$(".mask").remove();
     		});
     	});
     	/* 修改按钮 */
     	$(".bottom-right li").slice(1,4).each(function(){
     		$(this).find(".usage button").slice(1,2).click(function(){
     			mask();
	     		$(this).parents('li').find(".cover2").css("display","block");
	     		$(".close").click(function(){
	     			$("#change0,#change1,#change2,#change3,#change4,#change5").val("");
	     			$(this).parents('li').find(".cover2").css("display","none");
	     			$(".mask").remove();
	     		});
	     	});
     	});  
     	/* 生成密保卡*/
     	$(".bottom-right li:gt(3) .usage button:last-child").click(function(){
     		mask();
     		$(this).parents('li').find(".cover").css("display","block");
     		$(".close").click(function(){
     			$("#change6,#change7,#change8,#change9").val();
     			$(this).parents('li').find(".cover").css("display","none");
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
     /* 点击input radio 按钮，存储数据*/
     $(function(){
     	$(".lists").find("tr:gt(0)").each(function(){
     		This = this;
     		$(This).find("td:first-child > input").click(function(){
	     		That = this;
	     		var num = $(That).parents("tr").children("td:gt(0)");
	     		$(num).each(function(){
	     			ta=this;
	     			status = $(ta).parents("tr").children("td").eq(2).html();
	     		});
     		});
     	})
     	
     });
     
     /* 修改 中的数据添加*/
     $(function(){
     	$(".two .lists").find("tr:gt(0)").each(function(){
     		This = this;
     		
     		$(This).find("td:first-child > input").click(function(){
	     		That = this;
	     		var con = $(That).parents("tr").children("td").eq(2).html();
	     		$(".two .use #change0").val(con);	
     		});
     		
     		
     	});
     });
     
     $(function(){
     	$(".three .lists").find("tr:gt(0)").each(function(){
     		This = this;
     		$(This).find("td:first-child > input").click(function(){
	     		That = this;
	     		var con01 = $(That).parents("tr").children("td").eq(1).html();
	     		var con0 = $(That).parents("tr").children("td").eq(2).html();
	     		var con4 = $(That).parents("tr").children("td").eq(3).html();
	     		var con1 = $(That).parents("tr").children("td").eq(4).html();
	     		var con2 = $(That).parents("tr").children("td").eq(5).html();
	     		var con3 = $(That).parents("tr").children("td").eq(6).html();
	     		//$(".three .use #change100").attr("placeholder",con01);
	     		$(".three .use #change100").val(con01);
	     		//$(".three .use #change1").attr("placeholder",con0);
	     		$(".three .use #change1").val(con0);
	     		//$(".three .use #change2").attr("placeholder",con1);
	     		$(".three .use #change2").val(con1);
	     		//$(".three .use #change3").attr("placeholder",con2);
	     		$(".three .use #change3").val(con2);
	     		//$(".three .use #change4").attr("placeholder",con3);
	     		$(".three .use #change4").val(con3);
	     		$(".three .use #change5").val(con4);
     		});
     	});
     });
     $(function(){
     	$(".four .lists").find("tr:gt(0)").each(function(){
     		This = this;
     		$(This).find("td:first-child > input").click(function(){
	     		That = this;
	     		var con = $(That).parents("tr").children("td").eq(3).html();
	     		$(".four  #change5").attr("placeholder",con);
     		});
     	});
     });
     
     $(function(){
     	$(".five .lists").find("tr:gt(0)").each(function(){
     		This = this;
     		$(This).find("td:first-child > input").click(function(){
	     		That = this;
	     		var con0 = $(That).parents("tr").children("td").eq(3).html();
	     		var con1 = $(That).parents("tr").children("td").eq(5).html();
	     		var con2 = $(That).parents("tr").children("td").eq(6).html();
	     		$(".five  #change6").attr("placeholder",con0);
	     		$(".five  #change7").attr("placeholder",con1);
	     		$(".five  #change8").attr("placeholder",con2);
     		});
     	});
     });
     
     </script>
  </body>
</html>
