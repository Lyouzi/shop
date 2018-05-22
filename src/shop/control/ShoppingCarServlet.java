package shop.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import shop.model.bean.Goods;
import shop.model.dao.GoodsDAOImp;

/**
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/ShoppingCarServlet")
public class ShoppingCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GoodsDAOImp dao;
	public ShoppingCarServlet(){
		dao=new GoodsDAOImp();
	}
	
	
	/*private static final long serialVersionUID = 1L;
       
    *//**
     * @see HttpServlet#HttpServlet()
     *//*
    public ShoppingCarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }*/

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("选择进行的GoodsServlet方法：");
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");//设置统一字符编码
		response.setCharacterEncoding("UTF-8");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String methodName=request.getParameter("method");
		System.out.println("选择进行的GoodsServlet方法："+methodName);
		switch(methodName){
		case "add":
		{
			add(request,response);
			break;
		}
		case "deleteGoods"://判断用户请求的参数中，告诉我们是进入哪个后台业务方法
		{
			deleteGoods(request,response);
			break;
		}
		case "deleteAll":
		{
			deleteAll(request,response);
			break;
		}
		case "reduceGoods":
		{
			reduceGoods(request,response);
			break;
		}
		default:
			break;
		}
	}
	
	/*shoppingCar.put(Integer.parseInt(goods_id), 1);
	request.getSession().setAttribute("shoppingCart", shoppingCart);
	request.getRequestDispatcher("checkout.jsp").forward(request, response);*/
	/*
	 * 将商品加入购物车
	 */
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("加入购物车");
		//获取前端点击添加到购物车的商品id
		String Goods_id=request.getParameter("goods_id");
		//将这个商品id存储到购物车里
		//先判断session中有没有存储购物车集合，如果有，说明之前已经买过东西，如果没有说明没买过东西
		if(request.getSession().getAttribute("goodes")==null)
		{
			HashMap<Goods,Integer> shoppinggoodes=new HashMap<>();
			//创建一个map集合。这个集合就是购物车，这里存用户添加了哪些商品及对应的数量
			shoppinggoodes.put(dao.getGoodsInfoByGoods_id(Integer.parseInt(Goods_id)), 1);//将页面中添加的商品id和数量存储到购物车里
			
			//为了保证购物车能够在多次操作后依然能读取里面的数据，用session来存储购物车的数据
			request.getSession().setAttribute("goodes", shoppinggoodes);
		}else{
			HashMap<Goods,Integer> shoppinggoodes=(	HashMap<Goods, Integer> )request.getSession().getAttribute("goodes"); 
            //创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
			
			//因为session中已经存过购物车集合，说明之前买过东西，此时在添加新商品的时候应该先判断之前买过这个商品吗
			//如果买过，应该是在原来的数量上加现在的数量，如果没买过就直接将这个商品添加到集合中
			
			if(shoppinggoodes.containsKey(new Goods(Integer.parseInt(Goods_id))))
			{
				Goods c=dao.getGoodsInfoByGoods_id(Integer.parseInt(Goods_id));
				int nowcount=shoppinggoodes.get(c)+1;
				shoppinggoodes.put(c, nowcount);
				//System.out.println(shoppinggoodes);
			}
			else{
				shoppinggoodes.put(dao.getGoodsInfoByGoods_id(Integer.parseInt(Goods_id)), 1);//将页面中添加的商品id和数量存储到购物车里
			}
			//为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
			request.getSession().setAttribute("goodes", shoppinggoodes);
		}
		response.sendRedirect("checkout.jsp");//当数据添加到购物车之后，直接跳转到购物车页面，让用户看一下购物车的信息
		
	}
	/*
	 * 删除购物车商品
	 */
	protected void deleteGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取要删除的商品id
		String id=request.getParameter("goods_id");
		//从session里取出购物车集合
		HashMap<Goods, Integer> shoppinggoodes=(HashMap<Goods, Integer> )request.getSession().getAttribute("goodes");		
		for(Goods c:shoppinggoodes.keySet()){				
			if(c.getGoods_id()==Integer.parseInt(id)){						
				shoppinggoodes.remove(c);					
				break;					
			}				
		}				
		//当购物车的商品删除成功后，跳转到购物车页面				
		response.sendRedirect("checkout.jsp");				
	}
	/*
	 * 清空购物车
	 */
	protected void deleteAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入到清空购物车");
		request.getSession().removeAttribute("goodes");
		response.sendRedirect("checkout.jsp");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * 处理只减少一件商品
	 */
	protected void reduceGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("goods_id");
		HashMap<Goods,Integer> shoppinggoodes=(HashMap<Goods,Integer>)request.getSession().getAttribute("goodes");
		for(Goods c:shoppinggoodes.keySet()){
			if(c.getGoods_id()==Integer.parseInt(id)){
				shoppinggoodes.put(c, shoppinggoodes.get(c)-1);
				break;
			}
		}
		response.sendRedirect("checkout.jsp");
	}
	

	
}
