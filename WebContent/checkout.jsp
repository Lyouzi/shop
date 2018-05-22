
<%@page import="java.util.HashMap"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>购物车</title>
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
<%@include file="header.jsp" %>
<!---->
<div class="container">
	<div class="check-out">
		<h1>Checkout</h1>
    	    <table >
    	    
    	    <c:if test="${empty sessionScope.goodes}">
		 <tr><td >亲，您的购物车是空的<a href="index.jsp">去首页逛逛</a></td></tr>
		 </c:if>
		
		 
		  <tr>
			<th>购物车</th>
			<th>数量</th>		
			<th>单价</th>
			<th>更多细节</th>
			<th>总价</th>
			<th>删除</th>
		  </tr>
		  
		 <c:forEach var="s" items="${sessionScope.goodes}">
		  <tr>		  
			<td class="ring-in"><a href="GoodsServlet?method=single&goods_id=${s.key.goods_id }" class="at-in"><img src="${s.key.goods_imgid }" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5>${s.key.goods_brand}-${s.key.goods_name}-${s.key.goods_class}</h5>
				<p>(${s.key.goods_des })</p>
			
			</div>
			<div class="clearfix"> </div></td>
			
		    <td ><a  href="javascript:addGoods('ShoppingCarServlet?method=add&goods_id=${s.key.goods_id }')">
				<img src="images/add.png"  width="20" height="20"style="width: 20px;height: 20px;float: left;position: relative;top:2px;"/>
				</a>
					<input id="number" disabled="disabled"  type="text" value="${s.value }"  style="width:35px;float: left;position: relative;top: 0px;left:3px;"/>
					<a  href="javascript:reduceGoods('ShoppingCarServlet?method=reduceGoods&goods_id=${s.key.goods_id}')">
						<img src="images/reduce.png"  width="20" height="20" style="width: 21px;height: 21px;float: left;position: relative;left:6px;top:2px;"/>
					</a>
			</td>
								
		
			<!-- <td class="check"><input type="text" value="1" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}"></td>		 -->
			<td>${s.key.goods_price }</td>
			<td>FREE SHIPPING</td>
			<td><fmt:formatNumber type="number" value="${(s.key.goods_price)*(s.value) }" pattern="0.00" maxFractionDigits="2"/></td>
			
			
			<td>
					<a  href="javascript:deleteGoodsFromGouwuche('ShoppingCarServlet?method=deleteGoods&goods_id=${s.key.goods_id }')">
						<img src="images/remove.png"  width="20" height="20" style="cursor: pointer;position: relative;top: 2px;margin-right:10px; margin-left:10px;" title="删除该商品"/>
						</a>
			</td>
			
		  </tr>
		</c:forEach>
		
	</table>
	<a href="#" class=" to-buy">结算</a>
		<a href="javascript:deleteAll()" class=" to-buy">清空购物车</a>
	<div class="clearfix"> </div>
    </div>
</div>
<!--footer-->
<%@include file="footer.jsp" %>
<!--//footer-->
</body>
</html>

<script>
function addGoods(url){
	location.href=url;
}

function reduceGoods(url){
	
	var count=$("#number").val();
	if(count==1){
		var userChoice=window.confirm("您确定要删除该商品吗？");
		if(userChoice)
		{
			location.href=$("#delete").val();
		}
	}else{
		location.href=url;
	}
}

	function deleteGoodsFromGouwuche(url){
		//ShoppingCarServlet?method=deletegoods&carid=${s.key.goods_id }
		var  userChoice=window.confirm("您确认要删除这个商品吗?");
		if(userChoice)
		{
			location.href=url;
		}
	}
	function deleteAll(){
		var  userChoice=window.confirm("客官，您真的要删除所有的商品吗?");
		if(userChoice)
		{
			location.href='ShoppingCarServlet?method=deleteAll';
		}
	}
	
	
	
</script>
