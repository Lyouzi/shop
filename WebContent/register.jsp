<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>注册新用户</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" type="password/css" />	
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
<!--header-->
<%@include file="header.jsp" %>
<!--//header-->

<!-- 用户注册内容部分 -->
<div class="container">
	<div class="register">
		<h1>Register</h1>
			<form id="registerForm" method="post" action="UserServlet?method=register">
				<div class="col-md-6  register-top-grid">
					<div class="mation">
						<span>邮箱/手机号</span>
						<input type="text" id="account" name="inputaccount"> 
					
						<span>昵称</span>
						<input type="text" name="inputusername"> 
					 
						 <span>个性签名</span>
						 <input type="text" name="inputintroduce"> 
						 
						 <span>验证码</span>
						 <img id="code" src="CodeServlet"  style="position: relative;border:1px;width:46%;height:43px;" />
						 <input type="text" name="code" style="width:50%;margin-left:10px;"> 
					</div>
				
					 <div class="clearfix"> </div>
					 	<a class="news-letter" href="#">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>同意相关协议</label>
					 	</a>
					 </div>
					 
				     <div class=" col-md-6 register-bottom-grid">
							<div class="mation">
								<span>密码</span>
								<input type="text" id="password" name="inputpassword">
								<span>确认密码</span>
								<input type="password" id="password1">
							</div>
					 </div>
					 <div class="clearfix"> </div>
			
					 <input id="submitButton" type="submit" value="确   定" style="margin-left:15px;background-color: #52D0C4;color:white;border:none">
					 <div class="clearfix"> </div>
			</form>
		 </div>
</div>
	<script type="text/javascript">
	 $(document).ready(function(){
		//更新验证码
		 $("#code").click(function(){
			   $("#code").attr("src",'CodeServlet?time='+new Date())
		   });
		
		//验证输入不能为空
		$("#account").blur(function(){   
			if($(this).val() == ""||$.trim($(this).val()).length == 0){
				alert("邮箱/手机号 不能为空！")
			}
		});
		
		$("#password").blur(function(){   
			if($(this).val() == ""||$.trim($(this).val()).length == 0){
				alert("密码 不能为空！")
			}
		});
		
		$("#password1").blur(function(){   
			if($(this).val() != $("#password").val() ){
				alert("密码不一致！")
			}
		});
		//表单提交代码
		$("#submitButton").click(function(){ 
			 $("#registerForm").submit();	
		}); 
	
	 });
	</script>
<!--footer-->
<%@include file="footer.jsp" %>
<!--//footer-->

	<%  if(request.getAttribute("loginResultInfo")!=null&&request.getAttribute("loginResultInfo").toString().equals("codeError")) {%>
	<script type="text/javascript">
	alert("温馨提示:\r\n验证码填写错误!");
	</script>
	<%} else if(request.getAttribute("loginResultInfo")!=null&&request.getAttribute("loginResultInfo").toString().equals("registerError")){ %>
	<script type="text/javascript">
	alert("温馨提示:\r\n注册失败!");
	</script>
	<%} %> 

</body>
</html>