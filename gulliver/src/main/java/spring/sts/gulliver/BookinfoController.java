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
import spring.utility.gulliver.Paging;
import spring.utility.gulliver.Utility;

@Controller
public class BookinfoController {

	@Autowired
	private BookinfoDAO dao;

	//책정보 읽기
	@RequestMapping("/bookinfo/read")
	public String read(int bookid, Model model){
		
		BookinfoDTO dto = dao.read(bookid);
		
		String book_explain = dto.getBook_explain();
		
		dto.setBook_explain(book_explain.replaceAll("\r\n", "<br")); 
		
		model.addAttribute("dto", dto);
		
		return "/bookinfo/read";
	}
	
	
	//책정보 관리자 목록
	@RequestMapping("/bookinfo/admin_bookinfoList")
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

		return "/bookinfo/admin_bookinfoList";
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
	@RequestMapping(value = "/bookinfo/tempServer", method = RequestMethod.POST)
	public String tempServer() {
		System.out.println("tempServer");
		return "/bookinfo/tempServer";
	}

	// 책정보 등록
	@RequestMapping("/bookinfo/create")
	public String create() {
		return "/bookinfo/create";
	}
}
