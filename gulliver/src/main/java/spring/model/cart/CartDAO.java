package spring.model.cart;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CartDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	
	public int create(CartDTO dto){
		return(sqlSessionTemplate.insert("cart.create", dto));
	}

	//회원개인의 장바구니 내용 보여주기
	public List<CartDTO> cartOfUser(String userid) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("cart.cartOfUser", userid);
	}
	
	//모든회원의 장바구니 내용보여주기(Admin)
	public List<CartDTO> cartOfAllUser(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("cart.cartOfAllUser", map);
	}

	public int delete(int cartno) {
		// TODO Auto-generated method stub
		return (sqlSessionTemplate.delete("cart.delete", cartno));
		
	}

	public CartDTO read(int cartno) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("cart.read", cartno);
	}

	public int update(CartDTO dto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("cart.update", dto);
		
	}

	public int updateCart_cnt(int cartno) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("cart.updateCart_cnt", cartno);
	}

	public int total(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("cart.total", map);
	}

}
