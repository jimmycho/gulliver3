package spring.sts.gulliver;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.bookcate.BookcateDAO;
import spring.model.bookcate.BookcateDTO;

@Controller
public class BookcateController {
	@Autowired
	private BookcateDAO dao;
	private BookcateDTO dto;
	
	@RequestMapping("/bookcate/listTopCate")
	public String listTopCate(HttpServletRequest request,Model model){
		List list=dao.listTopCate();
		
		model.addAttribute("list", list);
				
		return "/bookcate/listTopCate";
	}
	
	/*@RequestMapping(value="/bookcate/listSubCate", method=RequestMethod.GET)
	public String listSubCate(HttpServletRequest request,Model model) {
		//System.out.println("/bookcate/listSubCate호출");
		int subCode=Integer.parseInt(request.getParameter("subCode"));
		List<BookcateDTO> subCateList=dao.list(subCode);
		for (int i = 0; i < subCateList.size(); i++) {
		System.out.println(subCateList.get(i).getBOOK_CATE_NAME());
			
		}
		model.addAttribute("subCateList",subCateList);
		
		
		
		return "/bookcate/listSubCate";

	}//method listSubCate */
	
	@RequestMapping(value="/bookcate/listSubCate", method=RequestMethod.GET)
	public String listSubCate(HttpServletRequest request,HttpServletResponse response,Model model) {
		//System.out.println("/bookcate/listSubCate호출");
		int subCode=Integer.parseInt(request.getParameter("subCode"));
		List<BookcateDTO> subCateList=dao.list(subCode);
		
		model.addAttribute("subCateList",subCateList);
		// ----------------------------------------------
		// Ajax 대응용으로 SubCategory를 Cookie 저장 
		// ----------------------------------------------
		Cookie cookie = new Cookie("ListHTML", ""); 
		String subCatListHTML="";
		for (int i = 0; i < subCateList.size(); i++) {
			subCatListHTML+=subCateList.get(i).getBOOK_CATE_NAME()+":";				
			}
				 
				cookie.setMaxAge(120); // 2 분 유지
				cookie.setValue(URLEncoder.encode(subCatListHTML)); //한글인코딩하여 cookie 저장
				//response.addCookie(cookie); // 쿠키 기록
				String cv="";
				if(cookie.getName().equals("ListHTML")) cv=URLDecoder.decode(cookie.getValue());
				//System.out.println("cookie(subcate):"+URLDecoder.decode(cookie.getValue()));
				System.out.println("cookie from BookcateCont: "+cv);
				request.setAttribute("cv", cv);
				 
		return "/bookcate/listSubCate";
	}//method listSubCate 
	
	@RequestMapping("/bookcate/listJson")
	public @ResponseBody Map<?,?> listJson(@RequestParam int BOOK_CATE_CD, ModelMap model) throws Throwable{
		System.out.println("listJson호출");
		model.put("SubCategoryList", dao.list(BOOK_CATE_CD));
		return model;
	}
	

}//class BookcateController
