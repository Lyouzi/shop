package shop.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import shop.model.bean.Goods;
import shop.model.bean.Users;

public class UserDAOImp extends BaseDAOImp implements UserDAO{

	@Override
	public boolean add(Object o) {
		// TODO Auto-generated method stub
		Users user=(Users)o;
		boolean result=false;
		Statement sta=null;
		try {
			sta=getSta();
			System.out.println("insert into users(account,name,password,introduce) values('"+user.getAccount()+"','"+user.getUsername()+"','"+user.getPassword()+"','"+user.getIntroduce()+"')");
			int count=sta.executeUpdate("insert into users(account,name,password,introduce) values('"+user.getAccount()+"','"+user.getUsername()+"','"+user.getPassword()+"','"+user.getIntroduce()+"')");
			result=(count>0)?true:false;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean delete(Object id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Object o) {
		// TODO Auto-generated method stub
		System.out.println("更新个人信息数据库操作");
		Users user=(Users)o;
		boolean result=false;
		Statement sta=null;
		try {
			sta=getSta();
			String sql="update users set name='"+user.getUsername()+"',password='"+user.getPassword()+"',introduce='"+user.getIntroduce()+"',headimg='"+user.getHeadImg()+"',sex="+user.getSex()+",birthday='"+user.getBirthday()+"' where account='"+user.getAccount()+"'";
			System.out.println(sql);
			int count=sta.executeUpdate(sql);
			result=(count>0)?true:false;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Object list() {
		// TODO Auto-generated method stub
		return null;
	}
	/*
	 *处理登录事件
	 */
	@Override
	public Users login(String account, String password) {
		System.out.println(account);
		System.out.println(password);
		// TODO Auto-generated method stub
		PreparedStatement sta=null;
		ResultSet res=null;
		try {
			
			sta=getPreSta("select * from users where account=? and password=?");
			sta.setString(1, account);
			sta.setString(2, password);
			res=sta.executeQuery();
			//res=getSta().executeQuery("select * from users where account='"+account+"' and password='"+password+"'");
			while(res.next()) {
				Users user=new Users();
				user.setAccount(res.getString("account"));
				user.setUsername(res.getString("name"));
				user.setPassword(res.getString("password"));
				user.setIntroduce(res.getString("introduce"));
				user.setHeadImg(res.getString("headimg"));
				user.setSex(res.getInt("sex"));
				user.setBirthday(res.getString("birthday"));
				System.out.println(user);
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disposeResource(getSta(), res, getCon());
		}
		return null;
	}

	@Override
	public ArrayList<Goods> searchGoodsByCondition(String minPrice, String maxPrice, String goodsBrand,
			String goodsClass, int person) {
		// TODO Auto-generated method stub
		return null;
	}

}
