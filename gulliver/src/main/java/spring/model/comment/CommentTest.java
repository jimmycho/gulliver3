package spring.model.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.comment.CommentDAO;
import spring.model.comment.CommentDTO;

public class CommentTest {

	public static void main(String[] args) {
		Resource resource = new ClassPathResource("gulliver_test_notice.xml");

		BeanFactory beans = new XmlBeanFactory(resource);

		CommentDAO dao = (CommentDAO) beans.getBean("dao");

//ok		 create(dao);
//ok		 read(dao); 
//		 update(dao); 
		 list(dao); 
//ok		 delete(dao); 
//ok		 total(dao); 

	}

	private static void total(CommentDAO dao) {
		int total = dao.total(1);
		p("total:" + total);

	}

	private static void delete(CommentDAO dao) {
		int cnt = dao.delete(7);
		
		if (cnt == 1) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void list(CommentDAO dao) {
		int sno = 1;
		int eno = 5;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bookid", 1); 

		List<CommentDTO> list = dao.list(map);

		for (int i = 0; i < list.size(); i++) {
			CommentDTO dto = list.get(i);

			p(dto);
			p("-------------------");
		}

	}

	private static void update(CommentDAO dao) {
		CommentDTO dto = dao.read(2);
		
		dto.setStar_cnt(4);
		dto.setSay100ja("핵노잼");
		dto.setBookid(1);
		dto.setSeq(1);
		
		int cnt = dao.update(dto);
		
		if (cnt == 1) {
			p("성공");
			dto = dao.read(1);
			p(dto);
		} else {
			p("실패");
		}

	}

	private static void read(CommentDAO dao) {
		CommentDTO dto = dao.read(7);
		p(dto);

	}


	private static void create(CommentDAO dao) {

		CommentDTO dto = new CommentDTO();
		
		dto.setStar_cnt(4);
		dto.setSay100ja("핵노잼");
		dto.setBookid(1);
		
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

	private static void p(CommentDTO dto) {
		p("댓글번호 : " 	+ dto.getSeq());
		p("별점 : " 	+ dto.getStar_cnt());
		p("100자평 : " + dto.getSay100ja());
		p("입력일 : " + dto.getInput_date());
		p("bookid : " + dto.getBookid());
	}
	
}
