package shop.model.bean;

public class PageBean {
	
	private int nowPage;		//当前页
	private int previousPage;	//上一页
	private int nextPage;		//下一页
	private int allPage;		//总页数
	private int everyPageCount; //每页显示数据条数
	private int allCount;		//数据总条数
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getPreviousPage() {
		return previousPage;
	}
	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getAllPage() {
		return allPage;
	}
	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}
	public int getEveryPageCount() {
		return everyPageCount;
	}
	public void setEveryPageCount(int everyPageCount) {
		this.everyPageCount = everyPageCount;
	}
	public int getAllCount() {
		return allCount;
	}
	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}
	@Override
	public String toString() {
		return "PageBean [nowPage=" + nowPage + ", previousPage=" + previousPage + ", nextPage=" + nextPage
				+ ", allPage=" + allPage + ", everyPageCount=" + everyPageCount + ", allCount=" + allCount + "]";
	}
	
	

}
