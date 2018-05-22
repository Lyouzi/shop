package shop.model.dao;

import shop.model.bean.Users;

public interface UserDAO extends BaseDAO{

	//֤登录验证
	public Users login(String account,String password);
}
