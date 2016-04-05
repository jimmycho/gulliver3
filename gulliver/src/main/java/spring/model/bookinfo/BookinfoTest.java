package spring.model.bookinfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.bookinfo.BookinfoDAO;
import spring.model.bookinfo.BookinfoDTO;

public class BookinfoTest {
	public static void main(String[] args) {
		Resource resource = new ClassPathResource("gulliver_test_notice.xml");

		BeanFactory beans = new XmlBeanFactory(resource);

		BookinfoDAO dao = (BookinfoDAO) beans.getBean("dao");

//ok		 create(dao);
// 		 read(dao); 
//ok		 update(dao); 
		 list(dao); 
//ok		 delete(dao); 
//ok		 total(dao); 

	}

	private static void total(BookinfoDAO dao) {
		String col = "";
		String word = "";
		int total = dao.total(col, word);
		p("total:" + total);

	}

	private static void delete(BookinfoDAO dao) {
		int cnt = dao.delete(1);
		
		if (cnt == 1) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void list(BookinfoDAO dao) {
		int sno = 1;
		int eno = 5;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
//		map.put("bookid", 1); 
		map.put("col", 1000);
		map.put("word", "칼의");
//		map.put("BOOK_CATE_CD", 1101); //카테고리 번호 받아서 검색하기 위한 부분
		
		List<BookinfoDTO> list = dao.mainList(map);
//		List<BookinfoDTO> list = dao.list(map);

		for (int i = 0; i < list.size(); i++) {
			BookinfoDTO dto = list.get(i);

			p(dto);
			p("-------------------");
		}

	}

	private static void update(BookinfoDAO dao) {
		BookinfoDTO dto = dao.read(2);
		
		dto.setBookname("어린왕자의 영문법 길들이기123123");                                                                                                                      
		dto.setSale_price(10620);
		dto.setBookfront_photo("https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788982205866%3Fmoddttm=20160303063400");
		dto.setBook_explain("세상에서 가장 쉽고 재밌는 영문법 가이드북 ≪어린 왕자의 영문법 길들이기-보급판≫. 이 책은 기존의 문법 용어나 문장 형태에 국한된 설명 대신 영어식 ;사고를 익힘으로써 영문법을...");     
		dto.setISBN10("1186748605");
		dto.setISBN13("9791186748602");
		dto.setStock_cnt(10);
		dto.setCur_price(11800);
		dto.setPublisher("넥서스");
		dto.setPub_date("20050705");
		dto.setBOOK_CATE_CD(2210);
		dto.setWriter("이재웅");
		dto.setTraductor("");
		
		int cnt = dao.update(dto);
		
		if (cnt == 1) {
			p("성공");
			dto = dao.read(2);
			p(dto);
		} else {
			p("실패");
		}

	}

	private static void read(BookinfoDAO dao) {
		BookinfoDTO dto = dao.read(1);
		p(dto);

	}


	private static void create(BookinfoDAO dao) {

		BookinfoDTO dto = new BookinfoDTO();

		dto.setBookname("어린왕자의 영문법 길들이기");                                                                                                                      
		dto.setSale_price(10620);
		dto.setBookfront_photo("https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788982205866%3Fmoddttm=20160303063400");
		dto.setBook_explain("세상에서 가장 쉽고 재밌는 영문법 가이드북 ≪어린 왕자의 영문법 길들이기-보급판≫. 이 책은 기존의 문법 용어나 문장 형태에 국한된 설명 대신 영어식 ;사고를 익힘으로써 영문법을...");     
		dto.setISBN10("1186748605");
		dto.setISBN13("9791186748602");
		dto.setStock_cnt(10);
		dto.setCur_price(11800);
		dto.setPublisher("넥서스");
		dto.setPub_date("20050705");
		dto.setBOOK_CATE_CD(2210);
		dto.setWriter("이재웅");
		dto.setTraductor("");
		
		int cnt = dao.create(dto);
		
		if (cnt == 1) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void p(String string) {
		System.out.println(string);

	}

	private static void p(BookinfoDTO dto) {
		p("책번호:" + 	dto.getBookid());
		p("책이름:" + 	dto.getBookname());
		p("저자:" 	+   	dto.getWriter());
		p("출판일:" + 	dto.getPub_date());
		p("분류:"+ dto.getBOOK_CATE_CD());
		
		
		
		
	}
	
	
	
	
}
