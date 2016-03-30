package spring.model.user ;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;


public class UserTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Resource resource=new ClassPathResource("gulliver_test.xml");
		BeanFactory beans=new XmlBeanFactory(resource);
		UserDAO dao=(UserDAO) beans.getBean("dao");
		
		//create(dao);
		read(dao);
		//list(dao);
		//update(dao);
		//delete(dao);
		//total(dao);
	}

	private static void total(UserDAO dao) {
		// TODO Auto-generated method stub
		int sno=1;
		int eno = 15;
		String word="";
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("word", word);
		int total=dao.total(map);
		p("회원수:"+total+" 명");
		
	}

	private static void delete(UserDAO dao) {
		// TODO Auto-generated method stub
		if(dao.delete("user78")){
			p("성공");
		}else{
			p("실패");
		}
		
	}

	private static void create(UserDAO dao){
		UserDTO dto=new UserDTO();
		dto.setUserid("user78");
		dto.setName("방길동");
		dto.setPasswd("1234");
		dto.setPhone("010-1111-2222");
		dto.setEmail("user77@email.com");
		dto.setBirthdate("2000-10-10") ;
		dto.setCallphone("02-1111-1111") ;
		dto.setZipcode("");
		dto.setGrade("M") ;
		dto.setAddress1("서울시 강남구 논현동") ;
		dto.setAddress2("123") ;
		//dto.setJoindate("2016-03-08") ;
		dto.setUserphoto("member77.jpg") ;
		
		if(dao.create(dto)>0){
			p("성공");
		} else{
			p("실패");
		}
	}
	
	private static void list(UserDAO dao){
		int sno=1;
		int eno = 15;
		String word="";
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("word", word);

		List<UserDTO> list = dao.list(map);

		for (int i = 0; i < list.size(); i++) {
			UserDTO dto = list.get(i);

			p(dto);
			p("-------------------");
		}
		
	}
	private static void read(UserDAO dao) {
		// TODO Auto-generated method stub
		UserDTO dto=dao.read("user7");
		p(dto);		
	}
	
	private static void update(UserDAO dao){
		UserDTO dto=dao.read("user2");
		dto.setCallphone("010-8888-9999");
		if(dao.update(dto)>0){
			p("성공");
			dto=dao.read("user2");
			p(dto);
		}else{
			p("실패");
		}
	}

	private static void p(UserDTO dto) {
		// TODO Auto-generated method stub
		p("아이디:"+dto.getUserid());
		p("이름:"+dto.getName());
		p("패스워드:"+dto.getPasswd());
		p("전화번호:"+dto.getPhone());
		p("이메일:"+dto.getEmail());
		p("생년월일:"+dto.getBirthdate());
		p("핸드폰번호:"+dto.getCallphone());
		p("등급:"+dto.getGrade());
		p("우편번호:"+dto.getZipcode());
		p("주소1:"+dto.getAddress1());
		p("주소2:"+dto.getAddress2());
		p("가입일자:"+dto.getJoindate());
		p("사진명:"+dto.getUserphoto());
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
		
	}

}
