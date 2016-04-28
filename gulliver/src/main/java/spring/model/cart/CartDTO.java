package spring.model.cart;

public class CartDTO {
	
	private int cartno;       
	private int cart_cnt;     
	private String order_whether;
	private String input_date;
	private String userid;
	private int bookid;
	private String bookname;
	private int cur_price;
	
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	private int sale_price;
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCur_price() {
		return cur_price;
	}
	public void setCur_price(int cur_price) {
		this.cur_price = cur_price;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public int getCartno() {
		return cartno;
	}
	public void setCartno(int cartno) {
		this.cartno = cartno;
	}
	
	public int getCart_cnt() {
		return cart_cnt;
	}
	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
	}
	
	public String getOrder_whether() {
		return order_whether;
	}
	public void setOrder_whether(String order_whether) {
		this.order_whether = order_whether;
	}
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
}
