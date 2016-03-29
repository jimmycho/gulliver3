package spring.model.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NoticeDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 글 작성
	public int create(NoticeDTO dto){
		return sqlSessionTemplate.insert("notice.create", dto);
	}
	
	// 글 목록 
	public List<NoticeDTO> list(Map map){
		return sqlSessionTemplate.selectList("notice.list", map);
	}
	
	// 글 수정
	public int update(NoticeDTO dto){
		return sqlSessionTemplate.update("notice.update", dto);
	}
	
	// 글 삭제
	public int delete(int noticeno){
		return sqlSessionTemplate.delete("notice.delete", noticeno);
	}
	
	// 글 총글수
	public int total(String col, String word){
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		
		return sqlSessionTemplate.selectOne("notice.total", map);
	}
	
	// 글 읽기
	public NoticeDTO read(int noticeno){
		return sqlSessionTemplate.selectOne("notice.read", noticeno);
	}
	
	// 글 조횟수
	public int readCnt(int noticeno){
		return sqlSessionTemplate.update("notice.readCnt", noticeno);
	}
	
}
