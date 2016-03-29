package spring.sts.gulliver;

import java.util.ArrayList;
import java.util.List;

import org.apache.tiles.AttributeContext;
import org.apache.tiles.context.TilesRequestContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.bookcate.BookcateDAO;
import spring.model.bookcate.BookcateDTO;

public class Bookcate implements ViewPreparer{
	Resource resource=new ClassPathResource("gulliver_test.xml");
	BeanFactory beans=new XmlBeanFactory(resource);
	BookcateDAO dao=(BookcateDAO) beans.getBean("dao");
	//BookcateDAO dao=new BookcateDAO();

	@Override
	public void execute(TilesRequestContext tilesContext, 
						AttributeContext attributeContext) {
		
		List<BookcateDTO> midCateListElement=new ArrayList<BookcateDTO>();
		List< List<BookcateDTO>> midCateList=new ArrayList<List<BookcateDTO>>();
		
		List<BookcateDTO> lowestCateListElement=new ArrayList<BookcateDTO>();
		List< List<BookcateDTO>> lowestCateList=new ArrayList<List<BookcateDTO>>();
		//System.out.println("bookcate.java-->topCate 호출");
		List<BookcateDTO> topCateList=dao.listTopCate();
		tilesContext.getRequestScope().put("topCateList", topCateList);
		
		for(int i=0;i<topCateList.size();i++){
			int topCateCD=topCateList.get(i).getBOOK_CATE_CD();
			midCateListElement=dao.list(topCateCD);
			//System.out.println("bookcate.java-->midCate 호출");
			midCateList.add(midCateListElement);
			
			for(int j=0;j<midCateListElement.size();j++){
				int midCateCD=midCateListElement.get(j).getBOOK_CATE_CD();
				
				lowestCateListElement=dao.list(midCateCD);
				//System.out.println("bookcate.java-->lowCate 호출");
				//System.out.println(lowestCateListElement.get(j).getBOOK_CATE_CD());
				lowestCateList.add(lowestCateListElement);
			}
			tilesContext.getRequestScope().put("lowestCateList", lowestCateList);
		}
		tilesContext.getRequestScope().put("midCateList", midCateList);
	}
}
