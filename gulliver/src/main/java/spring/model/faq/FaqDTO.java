package spring.model.faq;

public class FaqDTO {
	
	private int faqno;
	private String faq_cat; 
	private String title;   
	private String content;
	private int faq_cnt;
	
	public int getFaqno() {
		return faqno;
	}
	public void setFaqno(int faqno) {
		this.faqno = faqno;
	}
	public String getFaq_cat() {
		return faq_cat;
	}
	public void setFaq_cat(String faq_cat) {
		this.faq_cat = faq_cat;
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
	public int getFaq_cnt() {
		return faq_cnt;
	}
	public void setFaq_cnt(int faq_cnt) {
		this.faq_cnt = faq_cnt;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
	private String in_date; 

}
