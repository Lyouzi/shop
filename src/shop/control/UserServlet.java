package shop.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.model.bean.Users;
import shop.model.dao.UserDAOImp;
import shop.util.MD5;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAOImp dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao=new UserDAOImp();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//设置统一字符编码
		response.setCharacterEncoding("UTF-8");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String methodName=request.getParameter("method");
		switch(methodName) {
		case "login":
			login(request,response);
			break;
		case "register":
			register(request,response);
			break;
		case "update":
			update(request,response);
			break;
		case "logoff":
			logoff(request,response);
			break;
		default:
			break;
		}
	}
	/*
	 * 处理登陆的方法
	 */
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
		//取出用户输入的验证码
		String code=request.getParameter("code");
		
		System.out.println("在网页上输入验证码"+code);
		//系统生成的验证码
		String systemCode=request.getSession().getAttribute("generateCode").toString();
		//equalsIgnoreCase比较时会忽略大小写
		if(!code.equalsIgnoreCase(systemCode)) {
			System.out.println("验证码验证失败");
			request.setAttribute("loginResultInfo", "codeError");
			request.getRequestDispatcher("account.jsp").forward(request, response);
			//转发或重定向后不能再执行其他业务
			return;
		}
		String account=request.getParameter("inputaccount");
		String password=request.getParameter("inputpassword");
		
		Users user=dao.login(account, MD5.MD5(password));
		//会话范围内存储用户资料
		request.getSession().setAttribute("loginedUser", user);
		if(user!=null){
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else{
			request.setAttribute("loginResultInfo", "userError");
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}
	}
	/*
	 * 处理注册的方法
	 */
	protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("注册新用户功能模块");
		//取出用户输入的验证码
		String code=request.getParameter("code");
		System.out.println("在网页上输入验证码"+code);
		//系统生成的验证码
		String systemCode=request.getSession().getAttribute("generateCode").toString();
		//equalsIgnoreCase比较时会忽略大小写
		if(!code.equalsIgnoreCase(systemCode)) {
			System.out.println("验证码验证失败");
			request.setAttribute("loginResultInfo", "codeError");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			//转发或重定向后不能再执行其他业务
			return;
		}
		
		String account=request.getParameter("inputaccount");
		String username=request.getParameter("inputusername");
		String introduce=request.getParameter("inputintroduce");
		String password=request.getParameter("inputpassword");
		Users user=new Users();
		user.setAccount(account);
		user.setUsername(username);
		//密码使用MD5算法加密
		user.setPassword(MD5.MD5(password));
		user.setIntroduce(introduce);
		boolean result=dao.add(user);
		if(result) {
			request.getSession().setAttribute("loginedUser", user);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			request.setAttribute("loginResultInfo", "registerError");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		
	}
	
	/**
	 * 退出登陆的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void logoff(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("loginedUser");
		response.sendRedirect("index.jsp");
	}
	
	/*
	 * 处理更新个人信息
	 */
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("更新个人信息实现模块");
		int person=0;
		String headImg=request.getParameter("inputheadimg");
		String account=request.getParameter("inputaccount");
		String username=request.getParameter("inputusername");
		String sex=request.getParameter("intputsex");
		if(sex.equals("女")) {
			person=1;
		}
		String birthday=request.getParameter("inputbirthday");
		String introduce=request.getParameter("inputintroduce");
		String password=request.getParameter("inputpassword");
		
		Users user=new Users();
		user.setHeadImg(headImg);
		user.setAccount(account);
		user.setUsername(username);
		user.setSex(person);
		user.setBirthday(birthday);
		user.setIntroduce(introduce);
		user.setPassword(MD5.MD5(password));
		
		boolean result=dao.update(user);
		if(result) {
			request.getSession().setAttribute("loginedUser", user);
			request.getRequestDispatcher("userinfo.jsp").forward(request, response);
		}else {
			request.setAttribute("loginResultInfo", "updateError");
			request.getRequestDispatcher("userinfo.jsp").forward(request, response);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
