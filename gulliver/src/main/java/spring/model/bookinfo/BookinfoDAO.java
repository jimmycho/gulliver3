package spring.model.bookinfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BookinfoDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	//글읽기
	public BookinfoDTO read(int bookid){
		return sqlSessionTemplate.selectOne("bookinfo.read", bookid);
	}
	
	//입력
	public int create(BookinfoDTO dto){
		return sqlSessionTemplate.insert("bookinfo.create", dto);
	}
	
	//목록
	public List<BookinfoDTO> list(Map map){
		return sqlSessionTemplate.selectList("bookinfo.list", map);
	}
	
	//수정
	public int update(BookinfoDTO dto){
		return sqlSessionTemplate.update("bookinfo.update", dto);
	}
	
	//삭제
	public int delete(int bookid){
		return sqlSessionTemplate.delete("bookinfo.delete", bookid);
	}
	
	//게시물 총갯수
	public int total(String col, String word){
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return sqlSessionTemplate.selectOne("bookinfo.total", map);
	}
}
