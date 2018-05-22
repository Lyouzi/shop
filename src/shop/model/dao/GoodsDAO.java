package shop.model.dao;

import java.util.ArrayList;

import shop.model.bean.Goods;

public interface GoodsDAO extends BaseDAO{
	
	//根据用户传入的显示数量，在首页显示衣服信息
	public ArrayList<Goods> listRecentGoodsByCount(int count);
	
	///根据传入的商品id查询商品信息
	public Goods seacrchOneGoodById(int id);
	
	//根据传入的品牌名,推荐相同品牌商品
	public ArrayList<Goods> listBrandRecommend(String goods_brand);
	
	//根据用户输入的条件查询匹配的商品
	public ArrayList<Goods> searchGoodsByCondition(String minPrice,String maxPrice, String goodsBrand,String goodsClass,int person);
	
	//导航栏中点击分类展示商品
	public ArrayList<Goods> searchGoodsByclassify(int sex,String goods_brand,String goods_class);
	
	//根据模糊关键字查询所有内容
	public abstract ArrayList<Goods> searchAllByKey(String key);
	
	//分页查询商品信息的方法
	public ArrayList<Goods> listGoodsByPage(int page,int count);
	
	//查询商品信息表有多少条数据
	public int getAllCountofGoods();
}
