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
		System.out.println("userid(dao):"+userid);
		return sqlSessionTemplate.selectOne("user.read", userid);
	}

	public int update(UserDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("UserDAO호출");
		System.out.println(dto.getCallphone());
		return(sqlSessionTemplate.update("user.update", dto));
	}

	public int delete(String userid) {
		// TODO Auto-generated method stub
		return(sqlSessionTemplate.delete("user.delete", userid));
	}
	
	public int duplicateId(String id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("user.checkId", id);
	}

	public int duplicateEmail(String email) {
		// TODO Auto-generated method stub
		System.out.println("email(dao)"+email);
		return sqlSessionTemplate.selectOne("user.emailCheck", email);
	}

	public String getGrade(String userid) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("user.getGrade", userid);
	}

	public int loginCheck(Map map) {
		// TODO Auto-generated method stub
		System.out.println(map.get("userid"));
		return sqlSessionTemplate.selectOne("user.loginCheck", map);
	}

	public String getFname(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
