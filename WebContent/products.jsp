<%@page import="shop.model.bean.PageBean"%>
<%@page import="shop.model.bean.Goods"%>
<%@page import="java.util.ArrayList"%>
<%!String sex=null; %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>更多商品</title>
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

<!--content-->
<div class="products">
	<div class="container">
		<h1>Products</h1>
		<div class="col-md-9">
<!-- 分类商品展示 -->	
		<div class="content-top1">
		<%
		ArrayList<Goods> classifyGoods=(ArrayList<Goods>)request.getAttribute("classifyGoods");
		int i=0;
		for(Goods g:classifyGoods){ 
			if(g.getGoods_person()==0){
				sex="男";
			}else{
				sex="女";
			}
		%>	
			<div class="col-md-4 col-md3">
				<div class="col-md1 simpleCart_shelfItem">
					<a href="GoodsServlet?method=single&goods_id=<%=g.getGoods_id()%>">
						<img class="img-responsive" src="<%=g.getGoods_imgid()%>" alt="" />
					</a>
					<h3><a href="GoodsServlet?method=single&goods_id=<%=g.getGoods_id()%>"><%=g.getGoods_brand()%>&nbsp;<%=g.getGoods_name()%>&nbsp;<%=sex%><%=g.getGoods_class()%></a></h3>
					<div class="price">
						<h5 class="item_price"><%=g.getGoods_price()%></h5>
						<a href="#" class="item_add">加入购物车</a>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>	
		<%i++;
			if(i%3==0){
				%>
				<div class="clearfix"> </div>
				</div>	
				<div class="content-top1">
				<%
			}
		} %>
		<div class="clearfix"> </div>
		</div>
		<!-- 分页显示模块 -->
			<div style="width: 100%;margin: auto;text-align: center;">
			<%if(request.getAttribute("pageBean")!=null){ %>
				<a  href="GoodsServlet?method=listGoodsByPage&page=1&count=6"  class="pages">首页</a>
				<a  href="GoodsServlet?method=listGoodsByPage&page=${requestScope.pageBean.previousPage}&count=6"  class="pages">上一页</a>
				<a  href="GoodsServlet?method=listGoodsByPage&page=${requestScope.pageBean.nextPage}&count=6"  class="pages">下一页</a>
				<a  href="GoodsServlet?method=listGoodsByPage&page=${requestScope.pageBean.allPage}&count=6"  class="pages">尾页</a>
				第${requestScope.pageBean.nowPage}页/共${requestScope.pageBean.allPage}页,
				每页${requestScope.pageBean.everyPageCount}条/共${requestScope.pageBean.allCount}条,
				跳到第
				<select  id="goto"  style="width:30px;height: 20px; position: relative;top:2px;"  class="">
				<%
					for(int n=1;n<=((PageBean)request.getAttribute("pageBean")).getAllPage();n++)
					{
				%>
						<option value="<%=n%>"><%=n %></option>
				<%
					}
				%>			
				</select>页
				<%} %>
			</div>
	<!-- 分页结束 -->		
		</div>
<!-- 分类商品展示 结束-->			
		<div class="col-md-3 product-bottom">
			<!--categories-->
				<div class=" rsidebar span_1_of_left">
						<h3 class="cate">Categories</h3>
							 <ul class="menu-drop">
							<li class="item1"><a href="#">Men </a>
								<ul class="cute">
									<li class="subitem1"><a href="single.jsp">Cute Kittens </a></li>
									<li class="subitem2"><a href="single.jsp">Strange Stuff </a></li>
									<li class="subitem3"><a href="single.jsp">Automatic Fails </a></li>
								</ul>
							</li>
							<li class="item2"><a href="#">Women </a>
								<ul class="cute">
									<li class="subitem1"><a href="single.jsp">Cute Kittens </a></li>
									<li class="subitem2"><a href="single.jsp">Strange Stuff </a></li>
									<li class="subitem3"><a href="single.jsp">Automatic Fails </a></li>
								</ul>
							</li>
							<li class="item3"><a href="#">Kids</a>
								<ul class="cute">
									<li class="subitem1"><a href="single.jsp">Cute Kittens </a></li>
									<li class="subitem2"><a href="single.jsp">Strange Stuff </a></li>
									<li class="subitem3"><a href="single.jsp">Automatic Fails</a></li>
								</ul>
							</li>
							<li class="item4"><a href="#">Accesories</a>
								<ul class="cute">
									<li class="subitem1"><a href="single.jsp">Cute Kittens </a></li>
									<li class="subitem2"><a href="single.jsp">Strange Stuff </a></li>
									<li class="subitem3"><a href="single.jsp">Automatic Fails</a></li>
								</ul>
							</li>
									
							<li class="item4"><a href="#">Shoes</a>
								<ul class="cute">
									<li class="subitem1"><a href="product.jsp">Cute Kittens </a></li>
									<li class="subitem2"><a href="product.jsp">Strange Stuff </a></li>
									<li class="subitem3"><a href="product.jsp">Automatic Fails </a></li>
								</ul>
							</li>
						</ul>
					</div>
				<!--initiate accordion-->
						<script type="text/javascript">
							$(function() {
							    var menu_ul = $('.menu-drop > li > ul'),
							           menu_a  = $('.menu-drop > li > a');
							    menu_ul.hide();
							    menu_a.click(function(e) {
							        e.preventDefault();
							        if(!$(this).hasClass('active')) {
							            menu_a.removeClass('active');
							            menu_ul.filter(':visible').slideUp('normal');
							            $(this).addClass('active').next().stop(true,true).slideDown('normal');
							        } else {
							            $(this).removeClass('active');
							            $(this).next().stop(true,true).slideUp('normal');
							        }
							    });
							
							});
						</script>
<!--//menu-->
<!--seller-->
				<div class="product-bottom">
						<h3 class="cate">Best Sellers</h3>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive " src="images/pr.jpg" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="single.jsp" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
							<span class=" price-in1"> $40.00</span>
						</div>	
						<div class="clearfix"> </div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive " src="images/pr1.jpg" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="single.jsp" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
							<span class=" price-in1"> $40.00</span>
						</div>	
						<div class="clearfix"> </div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive " src="images/pr2.jpg" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="single.jsp" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
							<span class=" price-in1"> $40.00</span>
						</div>	
						<div class="clearfix"> </div>
					</div>	
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive " src="images/pr3.jpg" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="single.jsp" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
							<span class=" price-in1"> $40.00</span>
						</div>	
						<div class="clearfix"> </div>
					</div>		
				</div>

<!--//seller-->
<!--tag-->
				<div class="tag">	
						<h3 class="cate">Tags</h3>
					<div class="tags">
						<ul>
							<li><a href="#">design</a></li>
							<li><a href="#">fashion</a></li>
							<li><a href="#">lorem</a></li>
							<li><a href="#">dress</a></li>
							<li><a href="#">fashion</a></li>
							<li><a href="#">dress</a></li>
							<li><a href="#">design</a></li>
							<li><a href="#">dress</a></li>
							<li><a href="#">design</a></li>
							<li><a href="#">fashion</a></li>
							<li><a href="#">lorem</a></li>
							<li><a href="#">dress</a></li>
						<div class="clearfix"> </div>
						</ul>
				</div>					
			</div>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>
<!--//content-->


<!--footer-->
<%@include file="footer.jsp" %>
<!--//footer-->
<!-- 页面跳转功能实现 -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#goto").change(function(){
			//用js发起请求
			location.href='GoodsServlet?method=listGoodsByPage&page='+$(this).val()+'&count=6';
		})
	})
</script>
</body>
</html>