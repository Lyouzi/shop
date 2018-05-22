<%@page import="shop.model.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--header-->
<div class="header">
	<div class="header-top">
		<div class="container">
			<div class="col-sm-4 world">
				<ul>
					<li><select class="in-drop">
							<option>中文</option>
							<option>英语</option>
							<option>日语</option>
							<option>法语</option>
					</select></li>
					<li><select class="in-drop1">
							
							<option>美元</option>
							<option>欧元</option>
							<option>韩元</option>
					</select></li>
				</ul>
			</div>

			<!-- logo图标 -->
			<div class="col-sm-4 logo">
				<a href="index.jsp"><img src="images/logo.png" alt=""></a>
			</div>

			<div class="col-sm-4 header-left">
				<p class="log">
				<%
				if(session.getAttribute("loginedUser")!=null){
					%>
					<a href="userinfo.jsp">welcome!&nbsp;&nbsp;${sessionScope.loginedUser.username}</a>
					<img alt="" src="${sessionScope.loginedUser.headImg}" style="width:25px;height:25px;margin-top:-5px;">
					<a href="UserServlet?method=logoff">退出登录</a>
					<%
				}else{
				%>
					<a href="account.jsp">登陆</a> <span>or</span><a href="register.jsp">注册</a>
					<% 
				}
				%>	
				</p>
				<div class="cart box_1">
					<a href="checkout.jsp">
						<h3>
							<div class="total">
								<span class="simpleCart_total"></span>
							</div>
							<img src="images/cart.png" alt="" />
						</h3>
					</a>
					<p>
						<a href="javascript:" class="simpleCart_empty">清空购物车</a>
					</p>

				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div class="head-top">
			<div class="col-sm-2 number">
				<span><i class="glyphicon glyphicon-phone"></i>0356 596 666</span>
			</div>
			<div class="col-sm-8 h_menu4">
				<ul class="memenu skyblue">
					<li class=" grid"><a href="index.jsp">主页</a></li>
					<li><a href="#">男士区</a>
						<div class="mepanel">
							<div class="row">
								<div class="col1">
									<div class="h_nav">
										<h4>衣服类</h4>
										<ul>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=T恤">T恤</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=衬衫">衬衫</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=夹克">夹克</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=外套">外套</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=卫衣">卫衣</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=牛仔裤">牛仔裤</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=休闲裤">休闲裤</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=风衣">风衣</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=西装">西装</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=针织衫">针织衫</a></li>

										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>鞋类</h4>
										<ul>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=帆布鞋">帆布鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=小皮鞋">小皮鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=平底鞋">平底鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=穆勒鞋">穆勒鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=休闲鞋">休闲鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=板鞋">板鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=运动风">运动风</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=船鞋">船鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=增高鞋">增高鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_class=正装商务">正装商务</a></li>

										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>热门品牌</h4>
										<ul>
											<li><a href="GoodsServlet?method=products&sex=0&goods_brand=杰克琼斯">杰克琼斯</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_brand=森马">森马</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_brand=太平鸟">太平鸟</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_brand=与狼共舞">与狼共舞</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_brand=美特斯邦威">美特斯邦威</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_brand=马克华菲">马克华菲</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_brand=真维斯">真维斯</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_brand=红豆男装">红豆男装</a></li>
											<li><a href="GoodsServlet?method=products&sex=0&goods_brand=染牌">染牌</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div></li>
					<li class="grid"><a href="#"> 女士区</a>
						<div class="mepanel">
							<div class="row">
								<div class="col1">
									<div class="h_nav">
										<h4>衣服类</h4>
										<ul>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=羽绒服">羽绒服</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=毛呢外套">毛呢外套</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=针织衫">针织衫</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=连衣裙">连衣裙</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=裤子">裤子</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=打底衫">打底衫</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=皮衣">皮衣</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=妈妈装">妈妈装</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=阔腿裤">阔腿裤</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=西装">西装</a></li>

										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>鞋类</h4>
										<ul>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=帆布鞋">帆布鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=小皮鞋">小皮鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=平底鞋">平底鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=穆勒鞋">穆勒鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=休闲鞋">休闲鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=板鞋">板鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=运动风">运动风</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=船鞋">船鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=增高鞋">增高鞋</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_class=正装商务">正装商务</a></li>
										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>热门品牌</h4>
										<ul>
											<li><a href="GoodsServlet?method=products&sex=1&goods_brand=玛丝菲尔">玛丝菲尔</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_brand=哥弟">哥弟</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_brand=欧时力">欧时力</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_brand=宝姿">宝姿</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_brand=玖姿">玖姿</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_brand=朗姿">朗姿</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_brand=森马">森马</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_brand=美特斯邦威">美特斯邦威</a></li>
											<li><a href="GoodsServlet?method=products&sex=1&goods_brand=迪图">迪图</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div></li>
					
					<li><a href="typo.jsp">博客</a></li>
					<li><a class="color6" href="contact.jsp">联系我们</a></li>
				</ul>
			</div>
			<div class="col-sm-2 search">
				<a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i
					class="glyphicon glyphicon-search"> </i> </a>
				<a href="searchbycondition.jsp">搜索</a>
			</div>
			<div class="clearfix"></div>

			<!---pop-up-box---->
			<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
			<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
			<!---//pop-up-box---->
			<div id="small-dialog" class="mfp-hide">
			<!-- 模糊搜索模块 -->
			<form action="GoodsServlet" id="searchform" method="get">
				<input type="hidden" name="method" value="searchAny"/>
				<div class="search-top">
					<div class="login">
						<input type="submit" value=""> <input type="text"
							value="请输入 . . ." name="key" onFocus="this.value = '';"
							onBlur="if (this.value == '') {this.value = '';}">
					</div>
					<p>购物新体验！</p><a href="searchbycondition.jsp">搜索</a>
				</div>
			</form>
			</div>
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
			<!---->
		</div>
	</div>
</div>

