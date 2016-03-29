package spring.model.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
/**
 * 
 * bd쪽 이랑 연결이 잘 되어있나 test하는 검증클레스 
 * 톰캣이랑 상관없이 실행 가능해야한다
 *
 */
public class NoticeTest {

	public static void main(String[] args) {
		Resource resource = new ClassPathResource("gulliver_test_notice.xml");

		BeanFactory beans = new XmlBeanFactory(resource);

		NoticeDAO dao = (NoticeDAO) beans.getBean("dao");

//		 create(dao);
		 read(dao); 
//		 update(dao); 
//		 list(dao); 
//		 delete(dao); 
//		 total(dao); 

	}

	private static void total(NoticeDAO dao) {
		String col = "title";
		String word = "공지10";
		int total = dao.total(col, word);
		p("total:" + total);

	}

	private static void delete(NoticeDAO dao) {
		int cnt = dao.delete(1);
		
		if (cnt == 1) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void list(NoticeDAO dao) {
		int sno = 1;
		int eno = 5;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("noticeno", 1); 

		List<NoticeDTO> list = dao.list(map);

		for (int i = 0; i < list.size(); i++) {
			NoticeDTO dto = list.get(i);

			p(dto);
			p("-------------------");
		}

	}

	private static void update(NoticeDAO dao) {
		NoticeDTO dto = dao.read(2);
		
		dto.setTitle("공지제목변경");
		dto.setContent("내용변경");
		dto.setWriter("관리자");
		dto.setNoticeno(2);
		
		int cnt = dao.update(dto);
		
		if (cnt == 1) {
			p("성공");
			dto = dao.read(2);
			p(dto);
		} else {
			p("실패");
		}

	}

	private static void read(NoticeDAO dao) {
		NoticeDTO dto = dao.read(1);
		p(dto);

	}


	private static void create(NoticeDAO dao) {

		NoticeDTO dto = new NoticeDTO();
		
		dto.setTitle("공지사항 테스트중입니다!!");
		dto.setContent("내용내용");
		dto.setWriter("관리자");
		
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

	private static void p(NoticeDTO dto) {
		p("번호:" + dto.getNoticeno());
		p("내용:" + dto.getContent());
		p("작성자:" + dto.getWriter());
		p("등록날짜:" + dto.getIn_date());

	}
}