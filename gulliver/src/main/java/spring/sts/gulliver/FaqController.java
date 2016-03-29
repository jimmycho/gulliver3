package spring.sts.gulliver;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.faq.FaqDAO;
import spring.model.faq.FaqDTO;
import spring.utility.gulliver.Paging;
import spring.utility.gulliver.Utility;

@Controller
public class FaqController {
	
	@Autowired
	private FaqDAO dao;
	
	//회원용 faq 목록
	@RequestMapping("/faq/list")
	public String list(HttpServletRequest request){
		//1.model사용
		String col= Utility.checkNull(request.getParameter("col"));
		String word=Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")){
			word="";
		}
				
		//Paging 
		int nowPage=1;
		if(request.getParameter("nowPage")!=null){
			nowPage=Integer.parseInt(request.getParameter("nowPage"));			
		}
		int recordPerPage=5;
		//DB에서 가져올 순번
		int sno=((nowPage-1)*recordPerPage)+1;
		int eno=nowPage*recordPerPage;
		//DB에서 가져올 마지막 순번
		Map map=new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		List list=dao.list(map);
		int total=dao.total(map);
		String paging=new Paging().paging3(total, nowPage, recordPerPage, col, word);
		
		//2.request 저장
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		return "/faq/list";
		
	}
	
	@RequestMapping("/adm/faq/list")
	public String AdminList(HttpServletRequest request){
		//1.model사용
		String col= Utility.checkNull(request.getParameter("col"));
		String word=Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")){
			word="";
		}
				
		//Paging 
		int nowPage=1;
		if(request.getParameter("nowPage")!=null){
			nowPage=Integer.parseInt(request.getParameter("nowPage"));			
		}
		int recordPerPage=5;
		//DB에서 가져올 순번
		int sno=((nowPage-1)*recordPerPage)+1;
		int eno=nowPage*recordPerPage;
		//DB에서 가져올 마지막 순번
		Map map=new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		List list=dao.list(map);
		int total=dao.total(map);
		String paging=new Paging().paging3(total, nowPage, recordPerPage, col, word);
		
		//2.request 저장
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		return "/admin/faq/list"; //관리자용 faq 목록
	}
	
	//관리자용 faq 조회(수정,삭제,등록을 위함)
	@RequestMapping("/adm/faq/read")
	public String read(int nowPage, String col, String word, int faqno,
			Model model,HttpServletRequest request) {
		
		FaqDTO dto=dao.read(faqno);		
		String content = dto.getContent();
		dto.setContent(content.replaceAll("\r\n", "<br>"));
		model.addAttribute("dto",dto);
		return "/admin/faq/read";
	}
	
	@RequestMapping (value="/adm/faq/create", method=RequestMethod.POST)
	public String create(FaqDTO dto){
		int cnt=dao.create(dto);
		if(cnt>0){
			return "redirect:list";
		}else{
			return "/error";
		}
	}
	
	@RequestMapping(value="/adm/faq/create",method=RequestMethod.GET)
	public String create(){
		return "/admin/faq/create";
	}
	
	@RequestMapping(value="/adm/faq/update", method=RequestMethod.POST)
	public String update(FaqDTO dto,  Model model){
		System.out.println("faqController update 호출");
		System.out.println("FaqDTO.faqno:"+dto.getFaqno());
		System.out.println("FaqDTO.title:"+dto.getTitle());
		System.out.println("FaqDTO.content:"+dto.getContent());
		int cnt=dao.update(dto);
		if(cnt>0){
			return "redirect:list";
		}else{
			return "error";
		}
	}
	
	@RequestMapping(value="/adm/faq/update",method=RequestMethod.GET)
	public String update(int faqno, Model model ){
		FaqDTO dto=dao.read(faqno);
		model.addAttribute("dto",dto);
		return "/admin/faq/update";
	}
	
	@RequestMapping(value="/adm/faq/delete", method= RequestMethod.POST)
	public String delete(int faqno, HttpServletRequest request, Model model){
		int cnt=dao.delete(faqno);
		
		if(cnt>0){
		model.addAttribute("nowPage",request.getParameter("nowPage"));
		model.addAttribute("word",request.getParameter("word"));
		model.addAttribute("col",request.getParameter("col"));
		
		return "redirect:list";
	}else{
		return "error";
	}
		
	}
	
	@RequestMapping(value="/adm/faq/delete", method= RequestMethod.GET)
	public String delete(){
		return "/admin/faq/delete";
	}
}


