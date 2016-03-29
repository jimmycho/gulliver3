package spring.model.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.user.UserDAO;
import spring.model.user.UserDTO;

public class faqTest {
	
	public static void main(String[] arg){
		Resource resource=new ClassPathResource("gulliver_test.xml");
		BeanFactory beans=new XmlBeanFactory(resource);
		FaqDAO dao=(FaqDAO) beans.getBean("dao");
		
		//create(dao);
		//list(dao);
		//read(dao);		
		update(dao);
		//delete(dao);
		//total(dao);
	}
	
	private static void create(FaqDAO dao){
		FaqDTO dto=new FaqDTO();
		//dto.setFaqno(); //자동 넘버링 
		dto.setFaq_cat("반품");
		dto.setTitle("반품절차가 어떻게 되나"); 
		dto.setContent("반품절차는 간단합니다. ");
		dto.setFaq_cnt(0);
		//dto.setIn_date(); //sysdate 로 처리		
		if(dao.create(dto)>0){
			p("성공");
		} else{
			p("실패");
		}
	}
	
	private static void list(FaqDAO dao) {
		// TODO Auto-generated method stub
		int sno=1;
		int eno=15;
		String word="";
		Map map=new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("word", word);
		List<FaqDTO> list=dao.list(map);
		for(int i=0;i<list.size();i++){
			FaqDTO dto=list.get(i);
			p(dto);
			p("-------------------");
		}
	}
	
	private static void read(FaqDAO dao){
		FaqDTO dto=dao.read(7);
		p(dto);
	}
	
	private static void update(FaqDAO dao){
		int faqno=7;
		FaqDTO dto=dao.read(faqno);
		dto.setTitle("title수정");
		if(dao.update(dto)>0){
			p("성공");
			dto=dao.read(faqno);
			p(dto);
		}else{
			p("실패");
		}
	}
	
	private static void delete(FaqDAO dao) {
		// TODO Auto-generated method stub
		if(dao.delete(4)>0){
			p("성공");
		}else{
			p("실패");
		}
	}
	
	private static void total(FaqDAO dao) {
		// TODO Auto-generated method stub
		int sno=1;
		int eno = 15;
		String word="배송";
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("word", word);
		int total=dao.total(map);
		p("faq갯수:"+total+" 개");
		
	}
	
	private static void p(FaqDTO dto) {
		// TODO Auto-generated method stub
		p("번호:"+dto.getFaqno());
		p("분류:"+dto.getFaq_cat());
		p("제목:"+dto.getTitle());
		p("내용:"+dto.getContent());
		p("조회수:"+dto.getFaq_cnt());
		p("등록일:"+dto.getIn_date().subSequence(0, 10));//yyyy-mm-dd
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

}//class
