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
	
	
	//////////////// 관리자용 시작
	
	//관리자 책정보 삭제
	@RequestMapping("/adm/bookinfo/admin_bookinfoDelete")
	public String adminDelete(int bookid){
		
		int cnt = dao.delete(bookid);
		
		if(cnt > 0){
			return "redirect:./admin_bookinfoList";
		}else{
			return "redirect:./error";
		}
	}
	
	//관리자 책정보 등록
	@RequestMapping(value="/adm/bookinfo/admin_bookinfoCreate", method = RequestMethod.POST)
	public String adminCreate(BookinfoDTO dto){
		
		int cnt = dao.create(dto);
		System.out.println("dto.getBookid() : " + dto.getBookid());
		if(cnt > 0){
			return "redirect:./admin_bookinfoList";
		}else{
			return "/error";
		}
	}
	
	@RequestMapping(value="/adm/bookinfo/admin_bookinfoCreate", method = RequestMethod.GET)
	public String adminCreate(){
		return "/adm/bookinfo/admin_bookinfoCreate";
	}
	
	
	//관리자 책정보 읽기
	@RequestMapping("/adm/bookinfo/admin_bookinfoRead")
	public String adminRead(int bookid, BookinfoDTO dto, Model model, HttpServletRequest request){
		
		dto = dao.read(bookid);
		
		String book_explain = dto.getBook_explain();
		
		dto.setBook_explain(book_explain.replaceAll("\n\r", "<br>"));
		
		model.addAttribute("dto", dto);
		
		
		return "/adm/bookinfo/admin_bookinfoRead";
	}
	
	//관리자 책정보 수정
	@RequestMapping(value="/adm/bookinfo/admin_bookinfoUpdate", method = RequestMethod.POST)
	public String adminUpdate(int bookid, BookinfoDTO dto){
		
		int cnt = dao.update(dto);
		
		if(cnt > 0){
			return "redirect:/adm/bookinfo/admin_bookinfoList";
		}else{
			return "/error";
		}
	}
	
	@RequestMapping(value="/adm/bookinfo/admin_bookinfoUpdate", method = RequestMethod.GET)
	public String adminUpdate(int bookid, Model model){
		
		BookinfoDTO dto = dao.read(bookid);
		
		model.addAttribute("dto", dto);
		
		return "/adm/bookinfo/admin_bookinfoUpdate";
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

		int recordPerPage = 5; // 한 페이지당 출력할 레코드 수

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

		String paging = new Paging().paging4(total, nowPage, recordPerPage, col, word);

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
	
	//////////////// 관리자용 끝
	
	
	/////////100자평 관련 시작
	
	//100자평 등록
	@RequestMapping(value="/bookinfo/ccreate")
	public String ccreate(CommentDTO dto, Model model, int nowPage,String col, String word){
		System.out.println("userid : " + dto.getUserid());
		int cnt = cdao.create(dto);
		
		if(cnt > 0){
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("bookid", dto.getBookid());
			
			return "redirect:./read";
		}else{
			return "/error";
		}
	}

	//100자평 삭제
	@RequestMapping("/bookinfo/cdelete")
	public String cdelete(int bookid, int seq, int nPage, int nowPage, String col, String word, Model model){
		
		int cnt = cdao.delete(seq);
		System.out.println("dto.getSeq() : " + seq);
		if(cnt > 0){
			model.addAttribute("seq", seq);
			model.addAttribute("nPage", nPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("bookid", bookid);
			model.addAttribute("nowPage", nowPage);

			return "redirect:./read";
		}else{
			return "/error";
		}
	}
	
	
	//100자평 수정
	@RequestMapping("/bookinfo/cupdate")
	public String cupdate(int bookid, CommentDTO dto, int nowPage,int nPage, String col, String word, Model model){

		int cnt = cdao.update(dto);
		
		if(cnt > 0){
			model.addAttribute("seq", dto.getSeq());
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("bookid", bookid);
			
			return "redirect:./read"; 
		}else{
			return "error/error";
		}	
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
		
		
		model.addAttribute("n", "\n");
		model.addAttribute("br", "<br>");
		
		model.addAttribute("clist", clist);
		model.addAttribute("paging", paging);
		model.addAttribute("nPage", nPage);
		model.addAttribute("bookid", bookid);
		///////100자평 끝
		
		
		return "/bookinfo/read";
	}
	
	
	// 책정보 목록
	@RequestMapping("/bookinfo/mainList")
	public String mainList(HttpServletRequest request) {
		
		System.out.println("/bookinfo/mainList호출");
		// 검색 부분
		String col = Utility.checkNull(request.getParameter("col_h"));
		String word = Utility.checkNull(request.getParameter("word_h"));

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
//		map.put("BOOK_CATE_CD", request.getParameter("BOOK_CATE_CD")); //카테고리 번호 받아서 검색하기 위한 부분
		
		
		// 글의 총 갯수를 구한다
		
		int total = dao.total(col, word);
		System.out.println("col: "+col+", word:"+word+", 갯수:"+total );

		List<BookinfoDTO> list = dao.mainList(map);
		System.out.println("검색갯수:"+list.size());
		for (int i = 0; i < list.size(); i++) {
			System.out.println("===");
			System.out.println(list.get(i).getBookname());
		}
		

		String paging = new Paging().paging5(total, nowPage, recordPerPage, col, word);

		if (list.size() == 0) {
			nowPage = 1;
		}

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col_h", col);
		request.setAttribute("word_h", word);
		request.setAttribute("nowPage", nowPage);

		return "/bookinfo/list";
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
		map.put("BOOK_CATE_CD", request.getParameter("BOOK_CATE_CD")); //카테고리 번호 받아서 검색하기 위한 부분
		
		
		// 글의 총 갯수를 구한다
		int total = dao.total(col, word);

		List<BookinfoDTO> list = dao.list(map);

		String paging = new Paging().paging5(total, nowPage, recordPerPage, col, word);

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


}
