package shop.model.bean;
/**
 * 定义商品—衣服类
 * @author user
 *
 */
public class Goods {
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + goods_id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Goods other = (Goods) obj;
		if (goods_id != other.goods_id)
			return false;
		return true;
	}

	public Goods(int Goods_id) {
		super();
		this.goods_id = Goods_id;
	}
	
	@Override
	public String toString() {
		return "Goods [goods_id=" + goods_id + ", goods_class=" + goods_class
				+ ", goods_brand=" + goods_brand + ", goods_name=" + goods_name + ", goods_price=" + goods_price
				+ ", goods_store=" + goods_store + ", goods_des=" + goods_des + ", goods_imgid=" + goods_imgid
				+ ", goods_person=" + goods_person + "]";
	}
	
	private int goods_id;
	private String goods_class;
	private String goods_brand;
	private String goods_name;
	private float goods_price;
	private int goods_store;
	private String goods_des;
	private String goods_imgid;
	private int goods_person;
	
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_class() {
		return goods_class;
	}
	public void setGoods_class(String goods_class) {
		this.goods_class = goods_class;
	}
	public String getGoods_brand() {
		return goods_brand;
	}
	public void setGoods_brand(String goods_brand) {
		this.goods_brand = goods_brand;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public float getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(float goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_store() {
		return goods_store;
	}
	public void setGoods_store(int goods_store) {
		this.goods_store = goods_store;
	}
	public String getGoods_des() {
		return goods_des;
	}
	public void setGoods_des(String goods_des) {
		this.goods_des = goods_des;
	}
	public String getGoods_imgid() {
		return goods_imgid;
	}
	public void setGoods_imgid(String goods_imgid) {
		this.goods_imgid = goods_imgid;
	}
	public int getGoods_person() {
		return goods_person;
	}
	public void setGoods_person(int goods_person) {
		this.goods_person = goods_person;
	}
	
	public Goods() {
		super();
	}
	public Goods(int goods_id, String goods_class, String goods_brand, String goods_name,
			float goods_price, int goods_store, String goods_des, String goods_imgid, int goods_person) {
		super();
		this.goods_id = goods_id;
		this.goods_class = goods_class;
		this.goods_brand = goods_brand;
		this.goods_name = goods_name;
		this.goods_price = goods_price;
		this.goods_store = goods_store;
		this.goods_des = goods_des;
		this.goods_imgid = goods_imgid;
		this.goods_person = goods_person;
	}
	
	
}
