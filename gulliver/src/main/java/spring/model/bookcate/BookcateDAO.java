package spring.model.bookcate;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BookcateDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	public List<BookcateDTO> list(int BOOK_CATE_CD){
		return sqlSessionTemplate.selectList("bookcate.listSubCate", BOOK_CATE_CD);
	}
	
	public String realPath(int BOOK_CATE_CD){
		return sqlSessionTemplate.selectOne("bookcate.readPath", BOOK_CATE_CD);
	}
	public List<BookcateDTO> listTopCate() {
		// TODO Auto-generated method stub
		//System.out.println("dao.listTopCate호출");
		return sqlSessionTemplate.selectList("bookcate.listTopCate");
		
	}
}
