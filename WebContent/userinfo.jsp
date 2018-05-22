<%@page import="shop.model.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! String person=null;%>
<%
	if(session.getAttribute("loginedUser")!=null){
		int sex=((Users)session.getAttribute("loginedUser")).getSex();

		if(sex==0){
			person="男";
		}
		if(sex==1){
			person="女";
		}

	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>

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

<script type="application/x-javascript"> 
	addEventListener("load", function() { 
		setTimeout(hideURLbar, 0); 
	}, false); 
	function hideURLbar(){ 
		window.scrollTo(0,1); 
	} 
</script>

<!-- start menu -->
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>
	$(document).ready(function(){
		$(".memenu").memenu();
	});
</script>
<script src="js/simpleCart.min.js"> </script>

<!-- slide -->
<script src="js/responsiveslides.min.js"></script>
<script>
    $(function () {
    	$("#slider").responsiveSlides({
      		auto: true,
      		speed: 500,
        	namespace: "callbacks",
        	pager: true,
    	});
    });
   
</script>
</head>
<body>
<%@include file="header.jsp" %>

<!-- 显示个人信息 -->
<div class="container">
	<div class="register">
		<h1>personal details</h1>
			<form id="updateForm" method="post" action="UserServlet?method=update">
				<div class="col-md-6  register-top-grid">
					<div class="mation">
						<span>头像</span>
						<img alt="" src="<%=((Users)session.getAttribute("loginedUser")).getHeadImg()%>" style="width:50px;height:50px;margin-left:30px;">
						<br/><input type="text" name="inputheadimg" value="<%=((Users)session.getAttribute("loginedUser")).getHeadImg()%>"/>
						
						<span>账户</span>
						<input type="text" id="account" value="<%=((Users)session.getAttribute("loginedUser")).getAccount()%>" disabled="disabled"> 
						<input type="hidden" id="account" name="inputaccount" value="<%=((Users)session.getAttribute("loginedUser")).getAccount()%>" > 
						<span>昵称</span>
						<input type="text" name="inputusername" value="<%=((Users)session.getAttribute("loginedUser")).getUsername()%>"> 
					 
					 	<span>性别</span>
					 	<input type="text" name="intputsex" value="<%=person%>"/>
					 	
					 	<span>生日</span>
						<input type="text" name="inputbirthday" value="<%=((Users)session.getAttribute("loginedUser")).getBirthday()%>"> 
					 	
						<span>个性签名</span>
						<input type="text" name="inputintroduce" value="<%=((Users)session.getAttribute("loginedUser")).getIntroduce()%>"> 
						 
						 <span>更换密码</span>
						 <input type="text" name="inputpassword" value="<%=((Users)session.getAttribute("loginedUser")).getPassword()%>"/>
					</div>
				 </div>
		
					 <div class="clearfix"> </div>
			
					 <input id="submitButton" type="submit" value="修   改" style="margin-left:15px;background-color: #52D0C4;color:white;border:none">
					 <div class="clearfix"> </div>
			</form>
		 </div>
</div>

<%@include file="footer.jsp" %>

	<% if(request.getAttribute("loginResultInfo")!=null&&request.getAttribute("loginResultInfo").toString().equals("updateError")){ %>
	<script type="text/javascript">
	alert("温馨提示:\r\n更新个人信息失败!");
	</script>
	<%} %> 
</body>
</html>