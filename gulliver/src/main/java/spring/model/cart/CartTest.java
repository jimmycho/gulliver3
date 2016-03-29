package spring.model.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.cart.CartDTO;
import spring.model.cart.CartDAO;
import spring.model.faq.FaqDTO;

public class CartTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Resource resource=new ClassPathResource("gulliver_test.xml");
		BeanFactory beans=new XmlBeanFactory(resource);
		CartDAO dao=(CartDAO) beans.getBean("dao");
		
		//create(dao);
		read(dao);
		//readAll(dao);
		//delete(dao);
		//update(dao);
	}
	
	private static void update(CartDAO dao) {
		// TODO Auto-generated method stub
		int cartno=2;
		CartDTO dto=dao.read(cartno);
		dto.setCart_cnt(40);//수량수정
		if(dao.update(dto)>0){
			p("수정성공");
			dto=dao.read(cartno);
			p(dto);
		}else{
			p("수정실패");
		}
		
	}

	/**
	 * 장바구니 삭제
	 * @param dao
	 */
	private static void delete(CartDAO dao) {
		// TODO Auto-generated method stub
		if(dao.delete(4)>0){
			p("삭제성공");
		}else{
			p("삭제실패");
		}
		
	}
	/**
	 * Admin이 전체 장바구니 목록 조회
	 * @param dao
	 */
	private static void readAll(CartDAO dao) {
		// TODO Auto-generated method stub
		int sno=1;
		int eno=15;
		String word="";
		Map map=new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("word", word);
		List<CartDTO> list=dao.cartOfAllUser(map);
		for(int i=0;i<list.size();i++){
			CartDTO dto=list.get(i);
			p(dto);
			p("-------------------");
		}
		
	}

	/**
	 * 회원개인별 장바구니 조회기능
	 * @param dao
	 */

	private static void read(CartDAO dao) {
		 // TODO Auto-generated method stub
		String userid="user7";
		int total_cnt=0;
		long total_price=0;
		List<CartDTO> list=dao.cartOfUser(userid);
		for(int i=0;i<list.size();i++){
			CartDTO dto=list.get(i);
			p("---------------");
			p(dto);
			
			total_cnt+=dto.getCart_cnt();
			total_price+=dto.getCur_price()*dto.getCart_cnt();
		}
		p("---------------");
		String charge=String.format("%,d", total_price);
		System.out.println("총아이템수:"+total_cnt);
		System.out.println("총 금액:"+charge+"원");
		
	
	}
	
	/**
	 * 장바구니 담기
	 * @param dao
	 */

	private static void create(CartDAO dao) {
		// TODO Auto-generated method stub
		CartDTO dto=new CartDTO();
		int cart_cnt=3;
		dto.setCart_cnt(cart_cnt); //3권주문
		dto.setOrder_whether("N");
		dto.setUserid("user7");
		dto.setBookid(5);
		
		if(dao.create(dto)>0){
			p("카트추가성공");
		}else{
			p("카트추가실패");
		}		
	}
	
	private static void p(CartDTO dto) {
		// TODO Auto-generated method stub
		p("카트번호:"+dto.getCartno());
		p("주문자ID:"+dto.getUserid());
		p("주문자성명:"+dto.getName());
		p("주문상품ID:"+dto.getBookid());//yyyy-mm-dd
		p("주문상품명:"+dto.getBookname());
		p("가격:"+String.format("%,d", dto.getCur_price())+"원");
		p("수량:"+dto.getCart_cnt());
		p("주문여부:"+dto.getOrder_whether());
		p("주문일시:"+dto.getInput_date().subSequence(0, 10));
		
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

}
