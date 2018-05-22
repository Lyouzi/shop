package shop.model.dao;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;


import shop.model.bean.Goods;

public class GoodsDAOImp extends BaseDAOImp implements GoodsDAO{

	@Override
	public boolean add(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Object id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object list() {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*
	 * 根据传入的参数，查询数据库显示在index页面的衣服信息
	 */
	@Override
	public ArrayList<Goods> listRecentGoodsByCount(int count) {
		// TODO Auto-generated method stubr
		//定义一个集合存储查询出来的物品信息
		ArrayList<Goods> goods=new ArrayList<Goods>();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select * from goods order by goods_id desc limit "+count);
			while(rs.next())
			{
				Goods g=new Goods();
				g.setGoods_id(rs.getInt("goods_id"));
				g.setGoods_class(rs.getString("goods_class"));
				g.setGoods_brand(rs.getString("goods_brand"));
				g.setGoods_name(rs.getString("goods_name"));
				g.setGoods_price(rs.getFloat("goods_price"));
				g.setGoods_store(rs.getInt("goods_store"));
				g.setGoods_des(rs.getString("goods_des"));
				g.setGoods_imgid(rs.getString("goods_imgid"));
				g.setGoods_person(rs.getInt("goods_person"));
				goods.add(g);
				
				//System.out.println(g);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disposeResource(getSta(), rs, getCon());
		}
		return goods;
	}
	
	//根据传入的商品id查询商品信息,用于展示商品细节
	public Goods seacrchOneGoodById(int goodid) {
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select * from goods where goods_id="+goodid);
			while(rs.next())
			{
				Goods g=new Goods();
				g.setGoods_id(rs.getInt("goods_id"));
				g.setGoods_class(rs.getString("goods_class"));
				g.setGoods_brand(rs.getString("goods_brand"));
				g.setGoods_name(rs.getString("goods_name"));
				g.setGoods_price(rs.getFloat("goods_price"));
				g.setGoods_store(rs.getInt("goods_store"));
				g.setGoods_des(rs.getString("goods_des"));
				g.setGoods_imgid(rs.getString("goods_imgid"));
				g.setGoods_person(rs.getInt("goods_person"));
				
				System.out.println(g);
				
				return g;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disposeResource(getSta(), rs, getCon());
		}
		return null;
	}
	
	//根据传入的品牌名，推荐同类商品
	@Override
	public ArrayList<Goods> listBrandRecommend(String goods_brand) {
		System.out.println("传入品牌名"+goods_brand);
		// TODO Auto-generated method stub
		ArrayList<Goods> goods=new ArrayList<Goods>();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select * from goods where goods_brand='"+goods_brand+"'");
			while(rs.next())
			{
				Goods g=new Goods();
				g.setGoods_id(rs.getInt("goods_id"));
				g.setGoods_class(rs.getString("goods_class"));
				g.setGoods_brand(rs.getString("goods_brand"));
				g.setGoods_name(rs.getString("goods_name"));
				g.setGoods_price(rs.getFloat("goods_price"));
				g.setGoods_store(rs.getInt("goods_store"));
				g.setGoods_des(rs.getString("goods_des"));
				g.setGoods_imgid(rs.getString("goods_imgid"));
				g.setGoods_person(rs.getInt("goods_person"));
				goods.add(g);
				
				//System.out.println(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disposeResource(getSta(), rs, getCon());
		}
		return goods;
	}
	
	//根据用户输入的条件，查找相应的商品信息
	@Override
	public ArrayList<Goods> searchGoodsByCondition(String minPrice,String maxPrice, String goodsBrand,String goodsClass,int person) {
		// TODO Auto-generated method stub
		System.out.println("进入条件搜索实现方法");
		String sql="select * from goods where 1=1";
		if(minPrice!=null&&!minPrice.equals("")) {
			sql+=" and goods_price>="+minPrice+"";
		}
		if(maxPrice!=null&&!maxPrice.equals("")) {
			sql+=" and goods_price<="+maxPrice+"";
		}
		if(goodsBrand!=null&&!goodsBrand.equals("")) {
			sql+=" and goods_brand='"+goodsBrand+"'";
		}
		if(goodsClass!=null&&!goodsClass.equals("")) {
			sql+=" and goods_class='"+goodsClass+"'";
		}
		if(person==0||person==1) {
			sql+=" and goods_person="+person+"";
		}
		System.out.println("条件查询:"+sql);
		
		ArrayList<Goods> goods=new ArrayList<Goods>();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery(sql);
			while(rs.next()) 
			{
				Goods g=new Goods();
				g.setGoods_id(rs.getInt("goods_id"));
				g.setGoods_class(rs.getString("goods_class"));
				g.setGoods_brand(rs.getString("goods_brand"));
				g.setGoods_name(rs.getString("goods_name"));
				g.setGoods_price(rs.getFloat("goods_price"));
				g.setGoods_store(rs.getInt("goods_store"));
				g.setGoods_des(rs.getString("goods_des"));
				g.setGoods_imgid(rs.getString("goods_imgid"));
				g.setGoods_person(rs.getInt("goods_person"));
				goods.add(g);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disposeResource(getSta(),rs,getCon());
		}
		return goods;
	}
	
	//导航栏中点击分类显示商品
	@Override
	public ArrayList<Goods> searchGoodsByclassify(int sex, String goods_brand, String goods_class) {
		// TODO Auto-generated method stub
		String sql="select * from goods where 1=1";
		if(goods_brand!=null&&!goods_brand.equals("")) {
			sql+=" and goods_brand='"+goods_brand+"'";
		}
		if(goods_class!=null&&!goods_class.equals("")) {
			sql+=" and goods_class='"+goods_class+"'";
		}
		if(sex==0||sex==1) {
			sql+=" and goods_person="+sex+"";
		}
		System.out.println("条件查询:"+sql);
		
		ArrayList<Goods> goods=new ArrayList<Goods>();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery(sql);
			while(rs.next()) 
			{
				Goods g=new Goods();
				g.setGoods_id(rs.getInt("goods_id"));
				g.setGoods_class(rs.getString("goods_class"));
				g.setGoods_brand(rs.getString("goods_brand"));
				g.setGoods_name(rs.getString("goods_name"));
				g.setGoods_price(rs.getFloat("goods_price"));
				g.setGoods_store(rs.getInt("goods_store"));
				g.setGoods_des(rs.getString("goods_des"));
				g.setGoods_imgid(rs.getString("goods_imgid"));
				g.setGoods_person(rs.getInt("goods_person"));
				goods.add(g);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disposeResource(getSta(),rs,getCon());
		}
		return goods;
	}
	/*
	 * 根据关键字模糊搜索查询数据库
	 */
	@Override
	public ArrayList<Goods> searchAllByKey(String key) {
		// TODO Auto-generated method stub
		//根据给定的正则表达式拆分字符串
		String [] keys=key.split("\\s+");
		ArrayList<Goods> goods=new ArrayList<Goods>();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select * from goods limit 1");
			ResultSetMetaData data=rs.getMetaData();
			String sql="select * from goods where 1=0 or ";
			String[] columnName=new String [data.getColumnCount()];
			for(int n=1;n<=data.getColumnCount();n++) 
			{
				columnName[n-1]=data.getColumnLabel(n);
			}
			for(String k:keys) {
				if(k.equals("男")) {
					sql+=" ( 1=0";
					for(String column:columnName) {//给每列赋值相同查询是否有匹配的项
						sql+=" or  "+column+" like '0' ";
					}
					sql+=") and";
				}else if(k.equals("女")) {
					sql+=" ( 1=0";
					for(String column:columnName) {
						sql+=" or  "+column+" like '1' ";
					}
					sql+=") and";
				}else {
				sql+=" ( 1=0";
				for(String column:columnName) {
					sql+=" or  "+column+" like '%"+k+"%' ";
				}
				sql+=") and";
				}
			}
			//去掉结尾的and
			sql=sql.substring(0,sql.length()-3);
			
			System.out.println("模糊查询sql:"+sql);
			rs=getSta().executeQuery(sql);
			while(rs.next()) 
			{
				Goods g=new Goods();
				g.setGoods_id(rs.getInt("goods_id"));
				g.setGoods_class(rs.getString("goods_class"));
				g.setGoods_brand(rs.getString("goods_brand"));
				g.setGoods_name(rs.getString("goods_name"));
				g.setGoods_price(rs.getFloat("goods_price"));
				g.setGoods_store(rs.getInt("goods_store"));
				g.setGoods_des(rs.getString("goods_des"));
				g.setGoods_imgid(rs.getString("goods_imgid"));
				g.setGoods_person(rs.getInt("goods_person"));
				goods.add(g);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		disposeResource(getSta(),rs, getCon());
		return goods;
	}
	
	//数据库分页查询
	@Override
	public ArrayList<Goods> listGoodsByPage(int page, int count) {
		// TODO Auto-generated method stub
		ArrayList<Goods> goods=new ArrayList<Goods>();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select * from goods limit "+(page-1)*count+","+count);
			while(rs.next()) {
				Goods g=new Goods();
				g.setGoods_id(rs.getInt("goods_id"));
				g.setGoods_class(rs.getString("goods_class"));
				g.setGoods_brand(rs.getString("goods_brand"));
				g.setGoods_name(rs.getString("goods_name"));
				g.setGoods_price(rs.getFloat("goods_price"));
				g.setGoods_store(rs.getInt("goods_store"));
				g.setGoods_des(rs.getString("goods_des"));
				g.setGoods_imgid(rs.getString("goods_imgid"));
				g.setGoods_person(rs.getInt("goods_person"));
				System.out.println(g);
				goods.add(g);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return goods;
	}
	
	//查询数据总条数
	@Override
	public int getAllCountofGoods() {
		// TODO Auto-generated method stub
		int n=0;
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select count(goods_id) from goods");
			rs.next();
			n=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public static void main(String[] args) {
		GoodsDAOImp g=new GoodsDAOImp();
		g.listGoodsByPage(1, 3);
		//System.out.println(g.getAllCountofGoods());
	}


	public Goods getGoodsInfoByGoods_id(int goods_id) {
		// TODO Auto-generated method stub
		Goods c=null;
		ResultSet rs=null;
		try{
			rs=getSta().executeQuery("select * from goods where goods_id="+goods_id);
			if(rs.next()){
				c=parsetResultToGoods(rs);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return c;
		
	}

	private Goods parsetResultToGoods(ResultSet rs) {
		// TODO Auto-generated method stub
		Goods c=null;
		try {
			c = new Goods();
			c.setGoods_id(rs.getInt("goods_id"));
			c.setGoods_class(rs.getString("goods_class"));
			c.setGoods_brand(rs.getString("goods_brand"));
			c.setGoods_name(rs.getString("goods_name"));
			c.setGoods_price(rs.getFloat("goods_price"));
			c.setGoods_store(rs.getInt("goods_store"));
			c.setGoods_des(rs.getString("goods_des"));
			c.setGoods_imgid(rs.getString("goods_imgid"));
			c.setGoods_person(rs.getInt("goods_person"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	
	
}
