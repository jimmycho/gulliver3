package spring.model.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.order.OrderDTO;
import spring.model.order.OrderDAO;

public class OrderTest {
	/**
	 * 
	 * bd쪽 이랑 연결이 잘 되어있나 test하는 검증클레스 
	 * 톰캣이랑 상관없이 실행 가능해야한다
	 *
	 */
	public static void main(String[] args) {
		Resource resource = new ClassPathResource("gulliver_test_notice.xml");

		BeanFactory beans = new XmlBeanFactory(resource);

		OrderDAO dao = (OrderDAO) beans.getBean("dao");

		 create(dao);
//ok		 read(dao); 
//		 update(dao); 
//		 list(dao); 
//ok		 delete(dao); 
//		 total(dao); 

	}

//	private static void total(OrderDAO dao) {
//		String col = "recipient";
//		String word = "이길";
//		
//		int total = dao.total(col, word, "A", "user1");  //권한, userid 는 세션에서 받아서 처리한다.
//		p("total:" + total);
//
//	}

	private static void delete(OrderDAO dao) {
		int cnt = dao.delete(1);
		
		if (cnt == 1) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void list(OrderDAO dao) {
		int sno = 1;
		int eno = 5;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
//		map.put("orderno", 2); 

		List<OrderDTO> list = dao.list(map);

		for (int i = 0; i < list.size(); i++) {
			OrderDTO dto = list.get(i);

			p(dto);
			p("-------------------");
		}

	}

//	private static void update(OrderDAO dao) {
//		OrderDAO dto = dao.read(2);
//		
//		dto.setTitle("공지제목변경");
//		dto.setContent("내용변경");
//		dto.setWriter("관리자");
//		dto.setNoticeno(2);
//		
//		int cnt = dao.update(dto);
//		
//		if (cnt == 1) {
//			p("성공");
//			dto = dao.read(2);
//			p(dto);
//		} else {
//			p("실패");
//		}
//	}

	private static void read(OrderDAO dao) {
		OrderDTO dto = dao.read(1);
		p(dto);
	}


	private static void create(OrderDAO dao) {

		OrderDTO dto = new OrderDTO();

		dto.setDel_method("우체국택배");
		dto.setRecipient("이길동");
		dto.setTotal(12500);
		dto.setOrder_cnt(1);
		dto.setDel_zipcode("12-12");
		dto.setDel_address1("서울 연신내");
		dto.setDel_address2("111");
		dto.setOrder_comment("빨리좀 배달해줘요 쫌");
		dto.setBookid(3);
		dto.setUserid("user7");
		
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

	private static void p(OrderDTO dto) {
		p("배송방법 : " + dto.getDel_method());		
		p("수령인 : " + dto.getRecipient());		
		p("총금액 : " + dto.getTotal());		
		p("수량 : " + dto.getOrder_cnt());		
		p("우편번호 : " + dto.getDel_zipcode());		
		p("주소1 : " + dto.getDel_address1());		
		p("주소2 : " + dto.getDel_address2());		
		p("배달원에게 남기는 말 : " + dto.getOrder_comment());		
		p("주문일 : " + dto.getOrder_date());			

	}
}
