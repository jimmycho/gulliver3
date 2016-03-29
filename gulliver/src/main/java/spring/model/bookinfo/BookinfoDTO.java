package spring.model.bookinfo;

public class BookinfoDTO {
	private int bookid;             // bookid (PK)
	private String bookname;        // 책이름
	private int sale_price;         // 할인가격
	private String bookfront_photo; // 책 표지 사진명
	private String book_explain;    // 책 설명
	private String ISBN10;          // ISBN 10자리
	private String ISBN13;          // ISBN 13자리
	private int stock_cnt;          // 재고량
	private int cur_price;          // 정가
	private String publisher;       // 출판사
	private String pub_date;        // 출판일시
	private int BOOK_CATE_CD;       // 책분류 코드 (FK)
	private String writer;          // 저자
	private String traductor;       // 번역자
	private String input_date;      // 입력일시
	
	
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public String getBookfront_photo() {
		return bookfront_photo;
	}
	public void setBookfront_photo(String bookfront_photo) {
		this.bookfront_photo = bookfront_photo;
	}
	public String getBook_explain() {
		return book_explain;
	}
	public void setBook_explain(String book_explain) {
		this.book_explain = book_explain;
	}
	public String getISBN10() {
		return ISBN10;
	}
	public void setISBN10(String iSBN10) {
		ISBN10 = iSBN10;
	}
	public String getISBN13() {
		return ISBN13;
	}
	public void setISBN13(String iSBN13) {
		ISBN13 = iSBN13;
	}
	public int getStock_cnt() {
		return stock_cnt;
	}
	public void setStock_cnt(int stock_cnt) {
		this.stock_cnt = stock_cnt;
	}
	public int getCur_price() {
		return cur_price;
	}
	public void setCur_price(int cur_price) {
		this.cur_price = cur_price;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPub_date() {
		return pub_date;
	}
	public void setPub_date(String pub_date) {
		this.pub_date = pub_date;
	}
	public int getBOOK_CATE_CD() {
		return BOOK_CATE_CD;
	}
	public void setBOOK_CATE_CD(int bOOK_CATE_CD) {
		BOOK_CATE_CD = bOOK_CATE_CD;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTraductor() {
		return traductor;
	}
	public void setTraductor(String traductor) {
		this.traductor = traductor;
	}
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}

	
	
	
	

}
