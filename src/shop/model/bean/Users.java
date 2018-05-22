package shop.model.bean;
/**
 * 定义用户类保存用户信息
 * @author user
 *
 */
public class Users {
	
	private String account;
	private String username;
	private String password;
	private String introduce;
	private String headImg;
	private int sex;
	private String birthday;
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getHeadImg() {
		return headImg;
	}
	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public Users() {
		super();
	}
	public Users(String account, String username, String password, String introduce, String headImg, int sex,
			String birthday) {
		super();
		this.account = account;
		this.username = username;
		this.password = password;
		this.introduce = introduce;
		this.headImg = headImg;
		this.sex = sex;
		this.birthday = birthday;
	}
	@Override
	public String toString() {
		return "User [account=" + account + ", username=" + username + ", password=" + password + ", introduce="
				+ introduce + ", headImg=" + headImg + ", sex=" + sex + ", birthday=" + birthday + "]";
	}
	
	
}
