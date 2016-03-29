package spring.model.order;

public class OrderDTO {
	
	private int orderno;             	// 주문번호(PK)
	private String del_method;          // 배송방법
	private String recipient;           // 수령인
	private int total;               	// 총금액
	private int order_cnt;           	// 수량
	private String del_zipcode;         // 우편번호
	private String del_address1;        // 주소1
	private String del_address2;        // 주소2
	private String order_comment;       // 배달원에게 남기는 말
	private String order_date;			// 주문일
	private int bookid;              // bookid	(FK)
	private String userid;              // userid (FK)
	private String bookname;
	private String bookfront_photo;
	
	
	
	public String getBookfront_photo() {
		return bookfront_photo;
	}
	public void setBookfront_photo(String bookfront_photo) {
		this.bookfront_photo = bookfront_photo;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public String getDel_method() {
		return del_method;
	}
	public void setDel_method(String del_method) {
		this.del_method = del_method;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}
	public String getDel_zipcode() {
		return del_zipcode;
	}
	public void setDel_zipcode(String del_zipcode) {
		this.del_zipcode = del_zipcode;
	}
	public String getDel_address1() {
		return del_address1;
	}
	public void setDel_address1(String del_address1) {
		this.del_address1 = del_address1;
	}
	public String getDel_address2() {
		return del_address2;
	}
	public void setDel_address2(String del_address2) {
		this.del_address2 = del_address2;
	}
	public String getOrder_comment() {
		return order_comment;
	}
	public void setOrder_comment(String order_comment) {
		this.order_comment = order_comment;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
}
