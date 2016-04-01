package spring.model.comment;

public class CommentDTO {
	private int seq; // 댓글번호
	private int star_cnt; // 별점
	private String say100ja; // 100자평
	private String input_date; // 입력일
	private int bookid; // bookid
	private String userid; //userid
	private String name; //user이름
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getStar_cnt() {
		return star_cnt;
	}
	public void setStar_cnt(int star_cnt) {
		this.star_cnt = star_cnt;
	}
	public String getSay100ja() {
		return say100ja;
	}
	public void setSay100ja(String say100ja) {
		this.say100ja = say100ja;
	}
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	
	
}
