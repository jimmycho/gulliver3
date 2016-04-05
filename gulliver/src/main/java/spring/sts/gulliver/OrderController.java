package spring.sts.gulliver;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.cart.CartDAO;
import spring.model.cart.CartDTO;
import spring.model.order.OrderDAO;
import spring.model.order.OrderDTO;
import spring.model.user.UserDAO;
import spring.model.user.UserDTO;
import spring.utility.gulliver.Paging;
import spring.utility.gulliver.Utility;

@Controller
public class OrderController {
	@Autowired
	private OrderDAO dao;
	
	@Autowired
	private CartDAO cartdao;
	
	@Autowired
	private UserDAO userdao;
	
	
	//주문 목록 list
	@SuppressWarnings("unchecked")
	@RequestMapping("/order/list")
	public String list(HttpServletRequest request, HttpSession session){
		//검색 부분
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")){
			word="";
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
		
		String grade = (String) session.getAttribute("grade");
		String userid = (String) session.getAttribute("userid");
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("grade", grade);
		map.put("userid", userid);
		
		//글의 총 갯수를 구한다
		int total = dao.total(col, word, grade, userid);
		System.out.println("total : " + total);
		
		List<OrderDTO> list = dao.list(map);
		
		if(list.size() == 0){
			nowPage = 1;
		}
		
		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		
		return "/order/list";
	}
	
	@RequestMapping("/order/sucsess")
	public String sucsess(){
		return "/order/sucsess";
	}
	
	//주문 하기 create
	@RequestMapping(value="/order/create", method=RequestMethod.POST)
	public String create(HttpServletRequest requset, OrderDTO dto, Model model){
		
		String[] bookid = requset.getParameterValues("bookid");
		String[] order_cnt = requset.getParameterValues("order_cnt");
		String[] cartno = requset.getParameterValues("cartno");
		int cnt = 0;
		int Cartcnt=0;
		for(int i=0; i<bookid.length; i++){
			System.out.println(bookid[i]+ " : " + order_cnt[i]);
			dto.setBookid(Integer.parseInt(bookid[i]));
			dto.setOrder_cnt(Integer.parseInt(order_cnt[i]));
			cnt = dao.create(dto);
			Cartcnt=cartdao.delete(Integer.parseInt(cartno[i]));
			System.out.println("cartno["+i+"] :"+cartno[i]);

		}
		

		
		if(cnt > 0){
			return "redirect:sucsess";
//			return "redirect:./list";
		}else{
			return "/error";
		}
	}
	
	@RequestMapping(value="/order/create", method=RequestMethod.GET)
	public String create(String userid, Model model, HttpSession session, CartDTO dto, HttpServletRequest request){
		//주문 전 장바구니 읽어오기
		//flag로 구분하여 바로 구매인지 장바구니에서 구매인지 구별할지 생각해보겠음.
		if(userid == null || userid.equals("")){
			userid = (String) session.getAttribute("userid");
		}
		
		
		String[] orderItem = request.getParameterValues("isOrder");
		List<CartDTO> list = new ArrayList();
		for(int i=0; i<orderItem.length; i++){
			dto = cartdao.read(Integer.parseInt(orderItem[i]));
			System.out.println("orderItem:"+orderItem[i]);
			list.add(dto);
		}
//		request.setAttribute("list", list);
		
		
		UserDTO userdto = userdao.read(userid);

		model.addAttribute("cartlist", list);
		model.addAttribute("userdto", userdto);
		
		return "/order/create";
	}
	
	//주문 읽기 read
	@RequestMapping("/order/read")
	public String read(int orderno, Model model, HttpSession session){
		
		String userid = (String)session.getAttribute("userid");
		
		OrderDTO dto = dao.read(orderno);
		
	    UserDTO userdto = userdao.read(userid);
		
		model.addAttribute("dto", dto);
		model.addAttribute("userdto", userdto);
		
		return "/order/read";
	}
	
	//장바구니 읽어오기 read
}
