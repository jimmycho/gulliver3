package spring.model.comment;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CommentDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	//읽기
	public CommentDTO read(int bookid){
		return sqlSessionTemplate.selectOne("comment.read", bookid);
	}
	
	
	//목록
	public List<CommentDTO> list(Map map){
		return sqlSessionTemplate.selectList("comment.list", map);
	}
	
	
	//입력
	public int create(CommentDTO dto){
		return sqlSessionTemplate.insert("comment.create", dto);
	}
	
	//수정
	public int update(CommentDTO dto){
		return sqlSessionTemplate.update("comment.update", dto);
	}
	
	//삭제
	public int delete(int seq){
		return sqlSessionTemplate.delete("comment.delete", seq);
	}
	
	//댓글 총갯수
	public int total(int bookid){
		return sqlSessionTemplate.selectOne("comment.total", bookid);
	}

	public int deleteUserComment(String userid) {
		// TODO Auto-generated method stub
		System.out.println("deleteUserComment호출");
		return sqlSessionTemplate.delete("comment.deleteUser", userid);
	}
	
}
