package spring.model.notice;
   
public class NoticeDTO {
	private int    noticeno;	//공지번호
	private String title; 		//제목
	private String content; 	//내용
	private String writer; 		//작성자
	private String notice_cnt; 	//조회수
	private String in_date;		//작성일
	
	
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getNotice_cnt() {
		return notice_cnt;
	}
	public void setNotice_cnt(String notice_cnt) {
		this.notice_cnt = notice_cnt;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	} 
	
	
}
