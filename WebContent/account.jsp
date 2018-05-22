<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>用户操作</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- start menu -->
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<script src="js/simpleCart.min.js"> </script>
<!-- slide -->
</head>

<body>
<!-- 导航栏部分 -->
<%@include file="header.jsp" %>

<!-- 用户登陆内容部分 -->
<div class="account">
	<div class="container">
		<h1>Account</h1>
		<div class="account_grid">
			   <div class="col-md-6 login-right">
				<form id="loginForm" method="post" action="UserServlet?method=login">
					<span>邮箱地址/手机号</span>
					<input type="text" name="inputaccount"> 
				
					<span>密码</span>
					<input type="text" name="inputpassword">
					
					<span>验证码</span>
					<img id="code" src="CodeServlet"  style="position: relative;border:1px;width:45%;height:43px;" />
					<input type="text" name="code" style="width:50%"> 
					<div class="word-in" name="password">
				  		<a class="forgot" href="#">忘记密码?</a>
				 		<input id="submitButton" type="submit" value="Login" style="margin-left:50px;">
				  	</div>
			    </form>
			   </div>
			   <!-- 登陆功能模块JS实现 -->	
			   <script type="text/javascript">
			   $(document).ready(function(){
				   $("#submitButton").click(function(){
					   $("#loginForm").submit();
				   }); 
			   });
			   //更新验证码
			   $("#code").click(function(){
				   $("#code").attr("src",'CodeServlet?time='+new Date())
			   })
			   </script>
			   
			   <div class="col-md-6 login-left">
			  	 <h4>新用户：</h4>
				 <p>通过在我们的商店中创建一个帐户，您将能够更快地通过结帐过程，存储多个送货地址，查看和跟踪您的帐户和更多的订单。</p>
				 <p>我们将为您提供最为优质的服务！</p>
				 <a class="acount-btn" href="register.jsp">&nbsp;注&nbsp;册&nbsp;账&nbsp;户&nbsp;</a>
			   </div>
			   <div class="clearfix"> </div>
			 </div>
	</div>
</div>

<!--footer-->
<%@include file="footer.jsp" %>

	<%  if(request.getAttribute("loginResultInfo")!=null&&request.getAttribute("loginResultInfo").toString().equals("codeError")) {%>
	<script type="text/javascript">
	alert("温馨提示:\r\n验证码填写错误!");
	</script>
	<%} else if(request.getAttribute("loginResultInfo")!=null&&request.getAttribute("loginResultInfo").toString().equals("userError")){ %>
	<script type="text/javascript">
	alert("温馨提示:\r\n用户名和密码错误!");
	</script>
	<%} %> 
</body>
</html>