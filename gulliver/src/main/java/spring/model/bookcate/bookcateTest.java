package spring.model.bookcate;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.bookcate.BookcateDAO;
import spring.model.bookcate.BookcateDTO;

public class bookcateTest {

	public static void main(String[] arg){
		Resource resource=new ClassPathResource("gulliver_test.xml");
		BeanFactory beans=new XmlBeanFactory(resource);
		BookcateDAO dao=(BookcateDAO) beans.getBean("dao");
		//listSubCate(dao);
		//realPath(dao);
		listAllCate(dao);
		
	}

	private static void realPath(BookcateDAO dao) {
		// TODO Auto-generated method stub
		int code=1370;
		String path=dao.realPath(code);
		p(Integer.toString(code)+":"+path);
	}

	private static void listSubCate(BookcateDAO dao) {
		// TODO Auto-generated method stub
		int code=2000;
		List<BookcateDTO> list=dao.list(code);
		for(int i=0;i<list.size();i++)
			{			
				BookcateDTO dto=list.get(i);
				p(dto);	
			}	
	}//method listSubCate
	private static void listAllCate(BookcateDAO dao){
		
		
		//중분류 리스트 (각 엘리먼트도 리스트)
		List<BookcateDTO> midCateListElement=new ArrayList<BookcateDTO>();
		List< List<BookcateDTO> > midCateList=new ArrayList<List<BookcateDTO>>();
		//소분류 리스트 (각 엘리먼트로 리스트)
		List<BookcateDTO> lowestCateListElement=new ArrayList<BookcateDTO>();
		List< List<BookcateDTO>> lowestCateList=new ArrayList<List<BookcateDTO>>();
		
		///////////////////////
		//대분류 리스트
		List<BookcateDTO> topCateList=dao.listTopCate();
		for(int i=0;i<topCateList.size();i++){
			p(topCateList.get(i));///
			
			int topCateCD=topCateList.get(i).getBOOK_CATE_CD();
			midCateListElement=dao.list(topCateCD);			 
			midCateList.add(midCateListElement);
			
				for(int j=0;j<midCateListElement.size();j++){
					System.out.print(" ");
					p(midCateListElement.get(j));///
					int midCateCD=midCateListElement.get(j).getBOOK_CATE_CD();
					
					lowestCateListElement=dao.list(midCateCD);
					lowestCateList.add(lowestCateListElement);
					
					for(int k=0;k<lowestCateListElement.size();k++){
						System.out.print("   ");
						p(lowestCateListElement.get(k));///
					}
					
				}
			}
		
		
	
	
	}

	private static void p(BookcateDTO dto) {
		// TODO Auto-generated method stub
		String HigherCD=Integer.toString(dto.getHIGH_LINK_CD());		
		String SubCD=Integer.toString(dto.getBOOK_CATE_CD());
		p(HigherCD+":"+SubCD+":"+dto.getBOOK_CATE_NAME());
		
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

}
