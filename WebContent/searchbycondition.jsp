<%@page import="shop.model.bean.Goods"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>条件查询</title>
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
<!--header-->
<%@include file="header.jsp" %>
<!--//header-->

<!-- 条件查询 -->
<div class="container">
	<div class="register">
		<h1>SearchByCondition</h1>
		  	  <form action="GoodsServlet?method=searchbycondition" id="inputpanel" method="post"> 
				 <div class="col-md-6  register-top-grid">
					
					<div class="mation">
						<span>价格</span>
						<%if(request.getParameter("minprice")!=null){ %>
						<input type="text" style="width:49%" name="minprice" value="<%=request.getParameter("minprice")%>">-
						<%}else{ %>
						<input type="text" style="width:49%" name="minprice">-
						<% }%> 
						<%if(request.getParameter("maxprice")!=null){ %>
						<input type="text" style="width:49%" name="maxprice" value="<%=request.getParameter("maxprice")%>"> 
						<%}else{ %>
						<input type="text" style="width:49%" name="maxprice">
						<%}%>
						<%-- <span>类型</span>
						<%if(request.getParameter("goodstype")!=null){ %>
						<input type="text" name="goodstype" value="<%=request.getParameter("goodstype")%>"> 
					 	<% }else{%>
					 	<input type="text" name="goodstype">
					 	<%} %> --%>
						<span>品牌</span>
						<%if(request.getParameter("goodsbrand")!=null){ %>
						<input type="text" name="goodsbrand" value="<%=request.getParameter("goodsbrand")%>"> 
					 	<% }else{%>
					 	<input type="text" name="goodsbrand">
					 	<%} %>
						 <span>类别</span>
						 <%if(request.getParameter("goodsclass")!=null){ %>
						 <input type="text" name="goodsclass" value="<%=request.getParameter("goodsclass")%>"> 
						 <%}else{ %>
						 <input type="text" name="goodsclass">
						 <%} %>
						 <span>适合人群</span>
						 <%if(request.getParameter("person")!=null){ %>
						<input type="text" name="person" value="<%=request.getParameter("person")%>">
						<%}else{ %>
						<input type="text" name="person">
						<%} %> 
					</div>
					 	
				</div>
				<div class="clearfix"> </div>
					<input type="submit" value="确   定" id="search-submit" style="margin-left:15px;background-color: #52D0C4;color:white;border:none">
				<div class="clearfix"> </div>
			</form>
	 </div>
</div>
<!-- 条件查询结束 -->
<script type="text/javascript">
	$(document).ready(function(){
	   $("#search-submit").click(function(){
		   $("#inputpanel").submit();
	   }); 
	});
</script>
<% if(request.getAttribute("searchGoods")!=null) {%>
<!--content-->
<div class="content">
	<div class="container">
		<div class="content-top">
			<!-- 商品展示部分 -->
			<div class="content-top1">
			<% 
				ArrayList<Goods> allGoods=(ArrayList<Goods>)request.getAttribute("searchGoods"); 
				int i=0;
				for(Goods g:allGoods)
				{	
			%>
					<div class="col-md-3 col-md2">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="GoodsServlet?method=single&goods_id=<%=g.getGoods_id()%>">
								<img class="img-responsive" src="<%=g.getGoods_imgid()%>" alt="" style="width:185px;height:207px;"/>
							</a>
							<h3><a href="GoodsServlet?method=single&goods_id=<%=g.getGoods_id()%>"><%=g.getGoods_brand()%>&nbsp;<%=g.getGoods_name()%>&nbsp;<%=g.getGoods_person()==0?'男':'女' %><%=g.getGoods_class()%></a></h3>
							<div class="price">
								<h5 class="item_price">￥<%=g.getGoods_price()%></h5>
								<a href="#" class="item_add">加入购物车</a>
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
<!--//content-->
<% }%>
<!--footer-->
<%@include file="footer.jsp" %>
<!--//footer-->
</body>
</html>