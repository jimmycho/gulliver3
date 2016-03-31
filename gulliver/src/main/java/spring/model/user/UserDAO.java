package spring.model.user ;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
public class UserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public int create(UserDTO dto){
		return sqlSessionTemplate.insert("user.create", dto);
	}
	
	public List<UserDTO> list(Map map){
		return sqlSessionTemplate.selectList("user.list", map);
	}
	
	public int total(Map map){
		return sqlSessionTemplate.selectOne("user.total", map);		
	}
	
	public UserDTO read(String userid){
		return sqlSessionTemplate.selectOne("user.read", userid);
	}

	public int update(UserDTO dto) {
		return(sqlSessionTemplate.update("user.update", dto));
	}

	public int delete(String userid) {
		return(sqlSessionTemplate.delete("user.delete", userid));
	}
	
	public int duplicateId(String id) {
		return sqlSessionTemplate.selectOne("user.checkId", id);
	}

	public int duplicateEmail(String email) {
		System.out.println("email(dao)"+email);
		return sqlSessionTemplate.selectOne("user.emailCheck", email);
	}

	public String getGrade(String userid) {
		return sqlSessionTemplate.selectOne("user.getGrade", userid);
	}

	public int loginCheck(Map map) {
		System.out.println(map.get("userid"));
		return sqlSessionTemplate.selectOne("user.loginCheck", map);
	}

	public String getFname(String id) {
		return null;
	}

	public int updateFile(Map map) {
		return(sqlSessionTemplate.update("user.updateFile", map));
		
	}

}
