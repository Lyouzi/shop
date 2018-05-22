package shop.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.model.bean.Goods;
import shop.model.bean.PageBean;
import shop.model.dao.GoodsDAOImp;

/**
 * Servlet implementation class GoodsServlet
 */
@WebServlet("/GoodsServlet")
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private GoodsDAOImp dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao=new GoodsDAOImp();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//设置统一字符编码
		response.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//通过前端传过来的method参数来识别用户要调用那个方法,选择跳转到不同的网页
		String methodName=request.getParameter("method");
		//System.out.println("选择进行的GoodsServlet方法："+methodName);
		switch(methodName){
		case "index":
			index(request, response);
			break;
		case "single":
			single(request, response);
			break;
		case "searchbycondition":
			searchbycondition(request, response);
			break;
		case "products":
			products(request,response);
			break;
		case "searchAny":
			searchAny(request,response);
			break;
		case "listGoodsByPage":
			listGoodsByPage(request,response);
			break;
		default:
			break;
		}
	}
	/*
	 * 定义一个为首页准备数据的方法
	 */
	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//调用查询n件商品的信息
		ArrayList<Goods> allGoods=dao.listRecentGoodsByCount(12);
		
		request.setAttribute("allGoods", allGoods);
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}
	/*
	 * 加载一个商品的详细信息
	 */
	protected void single(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//通过id查询的商品信息
		Goods goodInfo=dao.seacrchOneGoodById(Integer.parseInt(request.getParameter("goods_id")));
		ArrayList<Goods> recommendGoods=dao.listBrandRecommend(goodInfo.getGoods_brand());
		
		request.setAttribute("goodInfo", goodInfo);
		request.setAttribute("recommendGoods", recommendGoods);
		request.getRequestDispatcher("single.jsp").forward(request, response);
		
	}
	/*
	 *  根据输入的条件筛选商品
	 */
	protected void searchbycondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String goodsBrand=null;
		String goodsClass=null;
		String person=null;
		String minPrice=request.getParameter("minprice");
		String maxPrice=request.getParameter("maxprice");

		if(request.getParameter("goodsbrand")!=null) {
			goodsBrand=request.getParameter("goodsbrand");
		}
		if(request.getParameter("goodsclass")!=null) {
			goodsClass=request.getParameter("goodsclass");
		}
		if(request.getParameter("person")!=null) {
			person=request.getParameter("person");
		}
		int sex=2;
		if(person.equals("男")||person.equals("男士")){
			sex=0;
		}
		if(person.equals("女")||person.equals("女士")){
			sex=1;
		}
		System.out.println("SQL");
		//根据数据查询你数据库，找到对应的商品信息
		ArrayList<Goods> searchGoods=dao.searchGoodsByCondition(minPrice, maxPrice, goodsBrand, goodsClass, sex);
		//将查出来的集合存储到request,通过转发传递到下一个JSP
		request.setAttribute("searchGoods", searchGoods);
		System.out.println("条件查询返回的值："+searchGoods);
		request.getRequestDispatcher("searchbycondition.jsp").forward(request, response);
	}
	/*
	 * 导航栏商品分类展示
	 */
	protected void products(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("导航栏商品分类展示");
		int sex=Integer.parseInt(request.getParameter("sex"));
		String goods_class=request.getParameter("goods_class");
		String goods_brand=request.getParameter("goods_brand");
		System.out.println(sex);
		System.out.println(goods_class);
		System.out.println(goods_brand);
		
		ArrayList<Goods> classifyGoods=dao.searchGoodsByclassify(sex, goods_brand, goods_class);
		request.setAttribute("classifyGoods", classifyGoods);
		request.getRequestDispatcher("products.jsp").forward(request, response);
	}
	
	/*
	 * 处理关键词模糊匹配查询
	 */
	protected void searchAny(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String key=request.getParameter("key");
		ArrayList<Goods> goods=dao.searchAllByKey(key);
		request.setAttribute("classifyGoods", goods);
		request.getRequestDispatcher("products.jsp").forward(request, response);
	}
	/*
	 *分页显示功能模块
	 */
	protected void listGoodsByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("分页");
		String page=request.getParameter("page");
		String count=request.getParameter("count");
		ArrayList<Goods> goods=dao.listGoodsByPage(Integer.parseInt(page), Integer.parseInt(count));
		
		System.out.println("查出来的分页"+goods);
		//计算出所有要用到的数字
		int nowPage=Integer.parseInt(page);
		int allCount=dao.getAllCountofGoods();//获取表中有多少条信息
		int pageOfCount=Integer.parseInt(count);
		int allPage=(allCount%pageOfCount==0)?allCount/pageOfCount:(allCount/pageOfCount+1);//求总页数
		int previousPage=nowPage<=1?1:(nowPage-1);
		int nextPage=nowPage>=allPage?allPage:(nowPage+1);
		
		//将所有分页中的属性封装成一个bean,将一整个对象传到网页上
		PageBean pageBean=new PageBean();
		pageBean.setNowPage(nowPage);
		pageBean.setPreviousPage(previousPage);
		pageBean.setNextPage(nextPage);
		pageBean.setAllPage(allPage);
		pageBean.setAllCount(allCount);
		pageBean.setEveryPageCount(pageOfCount);
		
		request.setAttribute("pageBean",pageBean);
		request.setAttribute("classifyGoods", goods);
		System.out.println(pageBean);
		request.getRequestDispatcher("products.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
