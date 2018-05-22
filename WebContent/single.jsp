<%@page import="shop.model.bean.Goods"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.model.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Goods goodInfo=(Goods)request.getAttribute("goodInfo");
	ArrayList<Goods> recommendGoods=(ArrayList<Goods>)request.getAttribute("recommendGoods");
%>
<!DOCTYPE html>
<html>
<head>
<title>商品详情</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!---->
</head>
<body>
<%@include file="header.jsp" %>

	<!-- 商品详情细节展示部分 -->
	<div class="single">
		<div class="container">
			<div class="col-md-9">
			<!-- 衣服图片展示模块 -->
				<div class="col-md-5 grid">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="<%=goodInfo.getGoods_imgid() %>">
								<div class="thumb-image">
									<img src="<%=goodInfo.getGoods_imgid() %>" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="<%=goodInfo.getGoods_imgid() %>">
								<div class="thumb-image">
									<img src="<%=goodInfo.getGoods_imgid() %>" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="<%=goodInfo.getGoods_imgid() %>">
								<div class="thumb-image">
									<img src="<%=goodInfo.getGoods_imgid() %>" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-7 single-top-in">
					<div class="single-para simpleCart_shelfItem">
						<h1><%=goodInfo.getGoods_brand()%>&nbsp;&nbsp;&nbsp;<%=goodInfo.getGoods_name()%>&nbsp;&nbsp;&nbsp;<%=goodInfo.getGoods_class()%></h1>
						<div style="height:90px;">
							<%=goodInfo.getGoods_des() %>
						</div>
						<div class="star-on">
							<ul>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
							</ul>
							<div class="review">
								<a href="#"> 3 评论 </a>/ <a href="#"> 发表评论</a>
							</div>
							<div class="clearfix"></div>
						</div>

						<label class="add-to item_price">￥<%=goodInfo.getGoods_price() %></label>
						<div class="star-on">
							剩余<%=goodInfo.getGoods_store()%>件
						</div>
						<div class="available">
							<h6>可选方式 :</h6>
							<ul>

								<li>尺寸:<select>
										<option>S</option>
										<option>M</option>
										<option>L</option>
										<option>XL</option>
										<option>XXL</option>
								</select></li>
								<li>支付方式: <select>
										<option>支付宝</option>
										<option>微信</option>
										<option>银行卡</option>
										
								</select></li>
							</ul>
						</div>
						<a href="#" class="cart item_add">更多细节</a>
					</div>
				</div>
				<div class="clearfix"></div>
				
				<!-- 同一品牌其他商品展示 -->
				<div class="content-top1">
				<%
					int n=0; 
					for(Goods brandgood:recommendGoods){
						n++;
						if(n>3) break;
						if(goodInfo.getGoods_id()==brandgood.getGoods_id()){
							continue;
						}
				%>
					<div class="col-md-4 col-md3">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="GoodsServlet?method=single&goods_id=<%=brandgood.getGoods_id()%>"> 
							<img class="img-responsive" src="<%=brandgood.getGoods_imgid()%>" alt="" />
							</a>
							<h3>
								<a href="GoodsServlet?method=single&goods_id=<%=brandgood.getGoods_id()%>"><%=brandgood.getGoods_brand()%>&nbsp;<%=brandgood.getGoods_name()%>&nbsp;<%=brandgood.getGoods_class()%></a>
							</h3>
							<div class="price">
								<h5 class="item_price">￥<%=brandgood.getGoods_price() %></h5>
								<a href="ShoppingCarServlet?method=add&goods_id" class="item_add">加入购物车</a>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				<%
					}
				%>

					<div class="clearfix"></div>
				</div>
			</div>
			<!----->
			<div class="col-md-3 product-bottom">
				<!--categories分类-->
				<div class=" rsidebar span_1_of_left">
					<h3 class="cate">Categories</h3>
					<ul class="menu-drop">
						<li class="item1"><a href="#">男士 </a>
							<ul class="cute">
								<li class="subitem1"><a href="single.jsp">Cute Kittens
								</a></li>
								<li class="subitem2"><a href="single.jsp">Strange Stuff
								</a></li>
								<li class="subitem3"><a href="single.jsp">Automatic
										Fails </a></li>
							</ul></li>
						<li class="item2"><a href="#">女士 </a>
							<ul class="cute">
								<li class="subitem1"><a href="single.jsp">Cute Kittens
								</a></li>
								<li class="subitem2"><a href="single.jsp">Strange Stuff
								</a></li>
								<li class="subitem3"><a href="single.jsp">Automatic
										Fails </a></li>
							</ul></li>
						<li class="item3"><a href="#">小孩</a>
							<ul class="cute">
								<li class="subitem1"><a href="single.jsp">Cute Kittens
								</a></li>
								<li class="subitem2"><a href="single.jsp">Strange Stuff
								</a></li>
								<li class="subitem3"><a href="single.jsp">Automatic
										Fails</a></li>
							</ul></li>
						<li class="item4"><a href="#">饰品</a>
							<ul class="cute">
								<li class="subitem1"><a href="single.jsp">Cute Kittens
								</a></li>
								<li class="subitem2"><a href="single.jsp">Strange Stuff
								</a></li>
								<li class="subitem3"><a href="single.jsp">Automatic
										Fails</a></li>
							</ul></li>

						<li class="item4"><a href="#">鞋子</a>
							<ul class="cute">
								<li class="subitem1"><a href="single.jsp">Cute Kittens
								</a></li>
								<li class="subitem2"><a href="single.jsp">Strange Stuff
								</a></li>
								<li class="subitem3"><a href="single.jsp">Automatic
										Fails </a></li>
							</ul></li>
					</ul>
				</div>
				<!--initiate accordion-->
				<script type="text/javascript">
					$(function() {
						var menu_ul = $('.menu-drop > li > ul'), menu_a = $('.menu-drop > li > a');
						menu_ul.hide();
						menu_a.click(function(e) {
							e.preventDefault();
							if (!$(this).hasClass('active')) {
								menu_a.removeClass('active');
								menu_ul.filter(':visible').slideUp('normal');
								$(this).addClass('active').next().stop(true,
										true).slideDown('normal');
							} else {
								$(this).removeClass('active');
								$(this).next().stop(true, true).slideUp(
										'normal');
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
							<a href="single.jsp"><img class="img-responsive "
								src="images/pr.jpg" alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href="single.jsp">Lorem ipsum dolor sitamet consectetuer
								</a>
							</h6>
							<span class=" price-in1"> $40.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive "
								src="images/pr1.jpg" alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href="single.jsp">Lorem ipsum dolor sitamet consectetuer
								</a>
							</h6>
							<span class=" price-in1"> $40.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive "
								src="images/pr2.jpg" alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href="single.jsp">Lorem ipsum dolor sitamet consectetuer
								</a>
							</h6>
							<span class=" price-in1"> $40.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive "
								src="images/pr3.jpg" alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href="single.jsp">Lorem ipsum dolor sitamet consectetuer
								</a>
							</h6>
							<span class=" price-in1"> $40.00</span>
						</div>
						<div class="clearfix"></div>
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
							<div class="clearfix"></div>
						</ul>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--footer-->
	<%@include file="footer.jsp" %>
	<!-- slide -->
	<script src="js/jquery.min.js"></script>
	<script src="js/imagezoom.js"></script>
	<!-- start menu -->
	<link href="css/memenu.css" rel="stylesheet" type="text/css"
		media="all" />
	<script type="text/javascript" src="js/memenu.js"></script>
	<script>
		$(document).ready(function() {
			$(".memenu").memenu();
		});
	</script>
	<script src="js/simpleCart.min.js">
		
	</script>
	<!--initiate accordion-->
	<script type="text/javascript">
		$(function() {
			var menu_ul = $('.menu-drop > li > ul'), menu_a = $('.menu-drop > li > a');
			menu_ul.hide();
			menu_a.click(function(e) {
				e.preventDefault();
				if (!$(this).hasClass('active')) {
					menu_a.removeClass('active');
					menu_ul.filter(':visible').slideUp('normal');
					$(this).addClass('active').next().stop(true, true)
							.slideDown('normal');
				} else {
					$(this).removeClass('active');
					$(this).next().stop(true, true).slideUp('normal');
				}
			});

		});
	</script>
	<!-- FlexSlider -->
	<script defer src="js/jquery.flexslider.js"></script>
	<link rel="stylesheet" href="css/flexslider.css" type="text/css"
		media="screen" />

	<script>
		// Can also be used with $(document).ready()
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				controlNav : "thumbnails"
			});
		});
	</script>
	<!---pop-up-box---->
	<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
		media="all" />
	<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
	<!---//pop-up-box---->
	<script>
		$(document).ready(function() {
			$('.popup-with-zoom-anim').magnificPopup({
				type : 'inline',
				fixedContentPos : false,
				fixedBgPos : true,
				overflowY : 'auto',
				closeBtnInside : true,
				preloader : false,
				midClick : true,
				removalDelay : 300,
				mainClass : 'my-mfp-zoom-in'
			});

		});
	</script>
</body>
</html>