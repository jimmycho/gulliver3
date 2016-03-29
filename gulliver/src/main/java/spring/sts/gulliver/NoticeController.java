package spring.sts.gulliver;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.notice.NoticeDAO;
import spring.model.notice.NoticeDTO;
import spring.utility.gulliver.Paging;
import spring.utility.gulliver.Utility;

@Controller
public class NoticeController {

	@Autowired
	private NoticeDAO dao;
	
	//글 목록
	@RequestMapping("/notice/list")
	public String list(HttpServletRequest request){
		//검색 부분
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")){
			word = "";
		}
		
		
		//페이징 관련 부분
		int nowPage = 1;
		
		if(request.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int recordPerPage = 5; //한 페이지당 출력할 레코드 수
		
		//DB에서 가져올 순번
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		//글의 총 갯수를 구한다
		int total = dao.total(col, word);
		
		List<NoticeDTO> list = dao.list(map);
		
		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
		
		if(list.size() == 0){
			nowPage = 1;
		}
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		return "/notice/list";
	}
	
	//글 등록
	@RequestMapping(value="/notice/create", method=RequestMethod.POST)
	public String create(NoticeDTO dto){
		
		int cnt = dao.create(dto);
		
		if(cnt > 0){
			return "redirect:list"; 
		}else{
			return "/error";
		}
	}
	//글 등록
	@RequestMapping(value="/notice/create", method=RequestMethod.GET)
	public String create(){
		return "/notice/create";
	}
	
	//글 읽기
	@RequestMapping("/notice/read")
	public String read(int noticeno, Model model, HttpServletRequest request){
		//조회수 증가
		dao.readCnt(noticeno);
		
		NoticeDTO dto = dao.read(noticeno);
		
		//글내용 줄바꿈 처리
		String content = dto.getContent();
		dto.setContent(content.replaceAll("\r\n", "<br>"));
		
		model.addAttribute("dto", dto);
		
		return "/notice/read";
	}
	
	//글 수정
	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
	public String update(NoticeDTO dto, HttpServletRequest request, Model model){
		
		int cnt = dao.update(dto);
		System.out.println(cnt);
		if(cnt > 0){
			return "redirect:list";
		}else{
			return "error";
		}
	}
	
	//글 수정
	@RequestMapping(value="/notice/update", method=RequestMethod.GET)
	public String update(int noticeno, Model model){
		//업데이트 할 내용이 있어야 하니까 가장 처음 업데이트전에 글 내용을 한번 읽어온다
		NoticeDTO dto = dao.read(noticeno);
		
		model.addAttribute("dto", dto);
		
		return "/notice/update";
	}
	
	@RequestMapping(value="/notice/delete", method=RequestMethod.POST)
	public String delete(int noticeno, HttpServletRequest request, Model model){
		int cnt = dao.delete(noticeno);
		
		if(cnt == 1){
			System.out.println(request.getParameter("col"));
			System.out.println(request.getParameter("word"));
			System.out.println(request.getParameter("nowPage"));
			model.addAttribute("col", request.getParameter("col"));
			request.setAttribute("word", request.getParameter("word"));
			request.setAttribute("nowPage", request.getParameter("nowPage"));

			return "redirect:./list";
		}else{
			return "/error";
		}
	}
	
	@RequestMapping(value="/notice/delete", method=RequestMethod.GET)
	public String delete(){
		return "/notice/delete";
	}
	
}
