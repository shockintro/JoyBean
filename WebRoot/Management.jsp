<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	.managemnet{border:1px solid #000;height:450px; width:800px;margin:200px auto 0;padding-top:5px; }
	.managemnet-top{border:1px solid #000;height:30px; width:790px; margin:0 auto; background:#fff;}
	.managemnet-top span{font-size:14px;padding-left:10px;height:30px; width:720px; line-height:30px; display:block; float:left;}
	button{padding:0;border:0;display:block; height:25px; width:50px; background:#388bff;color:#fff;float:right;margin:2.5px 5px;}
	
	.management-bottom{ height:400px;width:790px; margin:10px auto;background:#ff0000;}
	.management-bottom .bottom-left{ height:400px; width:120px; background:#fff;float:left;}

	.bottom-left .control li{ cursor:pointer;display:block; height:30px; width:100px; line-height:30px; text-align:center;border:1px solid #000;margin:10px auto;}
	
	.management-bottom .bottom-right{ border:1px solid #000;height:398px; width:668px; float:right; background:#fff;}
	.management-bottom .bottom-right li{display:block;border:1px solid #000;  height:378px; width:626px;padding:10px 20px; background:#fff;}
	
	.bottom-right  .head{ height:30px; width:100px; border:1px solid #000;line-height:30px;text-align:center;}
	.bottom-right  .search{ margin:10px 0;}
	.bottom-right  .search span{margin-left:20px;display:inline-block; width:70px; height:30px; line-height:30px;text-align:center;background:#bdbdbd;}
	.bottom-right  .search input{width:60px;height:30px;margin-left:10px;}
	.bottom-right  .search button{width:50px;height:30px;margin-left:10px;float:right;background:#388bff;color:#fff; border-radius:5px;}
	.bottom-right  .usage{ height:50px; width:668px; margin:0 auto; }
	.bottom-right  .usage button{float:left;width:100px;height:30px;margin-left:10px; border-radius:5px;background:#388bff;color:#fff;}
	.bottom-right  .lists{ height:180px; width:400px;}
	.bottom-right  .lists table th,td{height:30px; width:100px;text-align:center; line-height:30px;}
	.bottom-right  .pages{ height:30px; width:300px;border:1px solid #000; margin-top:20px;}
	.bottom-right  .pages span{height:100%; width:100%; line-height:30px;padding-left:10px;}
	
	
	</style>
	

  </head>
  
  <body>
  	<div class="managemnet">
  		<div class="managemnet-top clear">
  			<span>管理员，欢迎使用乐豆后台管理系统！ 2016年6月23日 星期一</span>
  			<button>退出</button>
  		</div>
  		<div class="management-bottom clear">
  			<div class="bottom-left">
  				<ul class="control">
  					<li style="margin-top:0;">用户管理</li>
  					<li>游戏类型</li>
  					<li>游戏列表</li>
  					<li>乐豆换算比例</li>
  					<li>生成密保卡</li>
  				</ul>
  			</div>
  			<div class="bottom-right">
  				<ul>
  					<li>
  						<div class="head">用户管理</div>
  						<div class="search">
  							<span>帐号</span><input type="text" name="user">
  							<span>姓名</span><input type="text" name="name">
  							<span>手机号码</span><input type="text" name="tel">
  							<button>查询</button>
  						</div>
  						<div class="usage clear">
  							<button>恢复使用</button>
  							<button>暂停使用</button>
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
  								<tr>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  								</tr>
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
  					</li>
  					<li>
  						<div class="head">游戏类型</div>
  						<div class="search">
  							<span>类型名称</span><input type="text" name="user">
  							<span>状态</span><select>
  								<option>商用</option>
  								<option>下线</option>
  							</select>
  							<button>查询</button>
  						</div>
  						<div class="usage clear">
  							<button>新增</button>
  							<button>修改</button>
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
  								<tr>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  								</tr>
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
  					</li>
  					<li>
						<div class="head">游戏列表</div>
  						<div class="search">
  							<span>游戏名称</span><input type="text" name="user">
  							<span>游戏类别</span><select>
  								<option>棋牌类</option>
  								<option>竞技类</option>
  							</select>
  							<button>查询</button>
  						</div>
  						<div class="usage clear">
  							<button>新增</button>
  							<button>修改</button>
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
  								<tr>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  								</tr>
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
					</li>
  					<li>
						<div class="head">乐豆换算比例</div>
						<span style="display:block;background:#000;margin:10px 0;width:300px; height:30px; text-align:center; line-height:30px;">默认配置：消费一元赠送一个乐豆</span>
  						<div class="search">
  							<span>省份</span><input type="text" name="user">
  					
  							<button>查询</button>
  						</div>
  						<div class="usage clear">
  							<button>新增</button>
  							<button>修改</button>
  							<button>删除</button>
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
  						<div class="pages" style="margin-top:-15px;">
  							<span>总共5页，当前是第1页，</span>
  						</div>
					</li>
  					<li>
						<div class="head" style="width:120px;">定向密保卡管理</div>
  						<div class="search">
  							<span>卡号</span><input type="text" name="user">
  							<span style="width:120px;">密保卡到期时间</span><input type="text" name="name">
  							<span>省份</span><input type="text" name="tel">
  							<button>查询</button>
  						</div>
  						<div class="usage clear">
  							<button>导出</button>
  							<button style="width:120px;">批量生成定向密保卡</button>
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
  								<tr>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  									<td></td>
  								</tr>
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
					</li>
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
     	
     </script>
  </body>
</html>
