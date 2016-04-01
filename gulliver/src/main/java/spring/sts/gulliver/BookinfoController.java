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

import spring.model.bookinfo.BookinfoDAO;
import spring.model.bookinfo.BookinfoDTO;
import spring.model.comment.CommentDAO;
import spring.model.comment.CommentDTO;
import spring.utility.gulliver.Paging;
import spring.utility.gulliver.Utility;

@Controller
public class BookinfoController {

	@Autowired
	private BookinfoDAO dao;

	@Autowired
	private CommentDAO cdao;
	
	
	/////////100자평 관련 시작
	
	//100자평 등록
	@RequestMapping(value="/bookinfo/ccreate", method=RequestMethod.POST)
	public String ccreate(CommentDTO dto, Model model){
		
		int cnt = cdao.create(dto);
		
		if(cnt > 0){
			model.addAttribute("bookid", dto.getBookid());
			return "redirect:./read";
		}else{
			return "/error";
		}
	}
	
	@RequestMapping(value="/bookinfo/ccreate", method=RequestMethod.GET)
	public String ccreate(){
		
		return "/bookinfo/ccreate";
	}
	
	
	//100자평 삭제
	
	
	//100자평 수정
	
	
	//100자평 목록
	@RequestMapping(value="/bookinfo/cread")
	public String cread(String col, String word, String nowPage, Model model){
		
		
		
		return "/bookinfo/read";
	}
	
	
	
	////////100자평 관련 끝
	
	
	
	//책정보 읽기
	@RequestMapping("/bookinfo/read")
	public String read(int bookid, Model model, String col, String word, int nowPage, HttpServletRequest request){
		
		BookinfoDTO dto = dao.read(bookid);
		
		String book_explain = dto.getBook_explain();
		
		dto.setBook_explain(book_explain.replaceAll("\r\n", "<br")); 
		
		model.addAttribute("dto", dto);
		
		////////100자평 시작
		String url = "read";
		int nPage= 1; //시작 페이지 번호는 1부터 
		 
		if (request.getParameter("nPage") != null) { 
			nPage= Integer.parseInt(request.getParameter("nPage"));  
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		 
		int sno = ((nPage-1) * recordPerPage) + 1; // 
		int eno = nPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bookid", bookid);

		List<CommentDTO> clist = cdao.list(map);
		
		int total = cdao.total(bookid);
		
		String paging = Utility.paging(total, nPage, recordPerPage, url, bookid, nowPage, col, word);
		 
		model.addAttribute("clist", clist);
		model.addAttribute("paging", paging);
		model.addAttribute("nPage", nPage);
		model.addAttribute("bookid", bookid);
		///////100자평 끝
		
		
		return "/bookinfo/read";
	}
	
	
	//책정보 관리자 목록
	@RequestMapping("/adm/bookinfo/admin_bookinfoList")
	public String adminList(HttpServletRequest request){
		// 검색 부분
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이징 관련 부분
		int nowPage = 1;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 20; // 한 페이지당 출력할 레코드 수

		// DB에서 가져올 순번
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		// 글의 총 갯수를 구한다
		int total = dao.total(col, word);

		List<BookinfoDTO> list = dao.list(map);

		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);

		if (list.size() == 0) {
			nowPage = 1;
		}

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);

		return "/adm/bookinfo/admin_bookinfoList";
	}
	
	
	// 책정보 목록
	@RequestMapping("/bookinfo/list")
	public String list(HttpServletRequest request) {
		// 검색 부분
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이징 관련 부분
		int nowPage = 1;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 20; // 한 페이지당 출력할 레코드 수

		// DB에서 가져올 순번
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		// 글의 총 갯수를 구한다
		int total = dao.total(col, word);

		List<BookinfoDTO> list = dao.list(map);

		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);

		if (list.size() == 0) {
			nowPage = 1;
		}

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);

		return "/bookinfo/list";
	}

	// 입력할 책 daum api 에서 읽어오기
	@RequestMapping(value="/bookinfo/tempServer", method = RequestMethod.POST)
	public String tempServer() {
		return "/bookinfo/tempServer";
	}

	
	// 책정보 등록
	@RequestMapping(value="/adm/bookinfo/create", method = RequestMethod.POST)
	public String create(BookinfoDTO dto){
		int cnt = dao.create(dto);
		
		if(cnt > 0){
			return "redirect:./admin_bookinfoList";
		}else{
			return "/error";
		}
	}
	
	@RequestMapping(value="/adm/bookinfo/create", method = RequestMethod.GET)
	public String create() {
		return "/adm/bookinfo/create";
	}
}
