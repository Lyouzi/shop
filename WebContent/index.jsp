<%@page import="java.util.ArrayList"%>
<%@page import="shop.model.bean.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<% 
	if(request.getAttribute("allGoods")==null){
		request.getRequestDispatcher("GoodsServlet?method=index").forward(request,response);
	}
%>

<html>
<head>
<title>购物商城</title>
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
<!-- 导航栏部分 -->
<%@include file="header.jsp" %>

<!--banner轮播图部分-->
<div class="banner">
	<div class="col-sm-3 banner-mat">
		<img class="img-responsive"	src="images/ba1.jpg" alt="">
	</div>
	
	<!-- 中间轮播部分 -->
	<div class="col-sm-6 matter-banner">
	 	<div class="slider">
	    	<div class="callbacks_container">
	      		<ul class="rslides" id="slider">
	        		<li>
	          			<img src="images/banner1.jpg" alt="">
	       			 </li>
			 		 <li>
	          			<img src="images/banner2.jpg" alt="">   
	       			 </li>
					 <li>
	          			<img src="images/banner1.jpg" alt="">
	        		</li>	
	      		</ul>
	 	 	</div>
		</div>
	</div>
	
	<div class="col-sm-3 banner-mat">
		<img class="img-responsive" src="images/ba.jpg" alt="">
	</div>
	<div class="clearfix"> </div>
</div>
<!--//banner-->

<!--content-->
<div class="content">
	<div class="container">
		<div class="content-top">
			<h1>最新产品</h1>
			
			<!-- 商品展示部分 -->
			<div class="content-top1">
			<% 
				ArrayList<Goods> allGoods=(ArrayList<Goods>)request.getAttribute("allGoods"); 
				int i=0;
				for(Goods g:allGoods)
				{	
			%>
					<div class="col-md-3 col-md2">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="GoodsServlet?method=single&goods_id=<%=g.getGoods_id()%>">
								<img class="img-responsive" src="<%=g.getGoods_imgid()%>" alt="" style="width:185px;height:207px;"/>
							</a>
							<h3><a href="GoodsServlet?method=single&goods_id=<%=g.getGoods_id()%>"><%=g.getGoods_brand()%>&nbsp;<%=g.getGoods_name()%>&nbsp;<%=g.getGoods_class()%></a></h3>
							<div class="price">
								<h5 class="item_price">￥<%=g.getGoods_price()%></h5>
								<a href="ShoppingCarServlet?method=add&goods_id=<%=g.getGoods_id()%>" class="item_add">加入购物车</a>
								<div class="clearfix"> </div>
							</div>
						</div>
					</div>	
				<%	
					i++;
					if(i%4==0){
				%>
					<div class="clearfix"> </div>
					</div>
					<div class="content-top1">	
				<%	}
				}
				%>
			<!-- 控制展示商品间距 -->
			<div class="clearfix"> </div>
			</div>
	
				
		</div>
	</div>
</div>
<div align="right" style="margin-right: 150px;margin-top: -100px"><a style="font-size: 20px" class="color6" href="GoodsServlet?method=listGoodsByPage&page=1&count=6">查看更多</a></div>
<!--//content-->

<!--footer最底部信息-->
<%@include file="footer.jsp" %>

</body>
</html>