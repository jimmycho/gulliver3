package spring.model.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class OrderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	
	//관리자 주문이력
	public List<OrderDTO> list(Map map){
		return sqlSessionTemplate.selectList("order.list", map); //네임스페이스.아이디 , 파라미터 
	}
	
	//등록
	public int create(OrderDTO dto){
		return sqlSessionTemplate.insert("order.create", dto);
	}
	
	//읽기
	public OrderDTO read(int orderno){
		return sqlSessionTemplate.selectOne("order.read", orderno);
	}
	
	//총 게시물 수
	public int total(String col, String word, String grade, String userid){
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("grade", grade);
		map.put("userid", userid);
		
		return sqlSessionTemplate.selectOne("order.total", map);
	}
	
	//삭제
	public int delete(int orderno){
		return sqlSessionTemplate.delete("order.delete", orderno);
	}
	
	//주문전에 장바구니에서 주문자의 정보, 장바구니 내용 가져오기
//	public  cartRead
	
}
