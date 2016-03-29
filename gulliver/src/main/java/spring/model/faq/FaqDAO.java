package spring.model.faq;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class FaqDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;	
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	
	public int create(FaqDTO dto){
		return sqlSessionTemplate.insert("faq.create", dto);
				
	}
	public List<FaqDTO> list(Map map){
		return sqlSessionTemplate.selectList("faq.list", map);		
	}
	public FaqDTO read(int faqno) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("faq.read", faqno);
	}
	
	public int update(FaqDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("FaqDAO 호출");
		int cnt=sqlSessionTemplate.update("faq.update", dto);
		return cnt;
		
	}
	
	public int delete(int faqno) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("faq.delete",faqno);
		
	}
	public int total(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("faq.total", map);
	}
}
