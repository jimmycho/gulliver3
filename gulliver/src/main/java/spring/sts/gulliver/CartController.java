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

import spring.model.bookinfo.BookinfoDAO;
import spring.model.bookinfo.BookinfoDTO;
import spring.model.cart.CartDAO;
import spring.model.cart.CartDTO;
import spring.utility.gulliver.Paging;
import spring.utility.gulliver.Utility;

@Controller
public class CartController {
	
	@Autowired
	private BookinfoDAO bdao;
	
	@Autowired
	private CartDAO dao;
	
	/**
	 * 개별 서적 상세 정보 화면 출력->화면 하단에 장바구니 클릭시 장바구니 담김)
	 * @param request(상품목록화면에서 상세정보 클릭시, bookid 리턴)
	 * @param model
	 * @return
	 */
	@RequestMapping("/cart/bookread")
	public String bookread(HttpServletRequest request, Model model){
		
		int bookid_int=Integer.parseInt(request.getParameter("bookid"));
		System.out.println("bookid:"+bookid_int);
		BookinfoDTO dto=bdao.read(bookid_int);
		System.out.println("bookname:"+dto.getBookname());
		model.addAttribute("dto",dto);
		return "/cart/bookread";
	}//bookread 메소드
	
	@RequestMapping("/adm/cart/list")
	public String AdminList(String userid,HttpServletRequest request,HttpSession session,Model model){
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
				int recordPerPage=10;
				//DB에서 가져올 순번
				int sno=((nowPage-1)*recordPerPage)+1;
				int eno=nowPage*recordPerPage;
				//DB에서 가져올 마지막 순번
				Map map=new HashMap();
				map.put("col", col);
				map.put("word", word);
				map.put("sno", sno);
				map.put("eno", eno);
				
		List list=dao.cartOfAllUser(map);
		
		int total=dao.total(map);
		String paging=new Paging().paging3(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);

		
		return "/admin/cart/list";
		
	}//AdminList method
	
	@RequestMapping("/cart/list")
	public String list(String userid,HttpServletRequest request,HttpSession session,Model model){
		if(userid==null){
			userid= (String) session.getAttribute("userid");
			System.out.println("userid:"+userid);
		}
		List list=dao.cartOfUser(userid);
		
		//ArrayList price = new ArrayList();
		request.setAttribute("list", list);
		int totalCart_cnt=0;
		int totalPrice=0; //총 구매금액 계산
		for(int i=0;i<list.size();i++){
			
			CartDTO dto =(CartDTO) list.get(i);
			//price.add(String.format("%,d", dto.getCur_price()));
			totalCart_cnt+=dto.getCart_cnt();
			totalPrice +=dto.getSale_price()*dto.getCart_cnt();
			//Object priceStr=price.get(i);
			//String priceS=(String)priceStr;
			//System.out.println("가격:"+priceS);
		}
		//System.out.println("총수량:"+totalCart_cnt +"권");
		//System.out.println("총금액:"+String.format("%,d",totalPrice)+"원");
		
		//String totalPriceStr=String.format("%,d", totalPrice);
		model.addAttribute("totalCart_cnt", totalCart_cnt);
		model.addAttribute("totalPrice", String.format("%,d", totalPrice));
		
		return "/cart/list";
		
	}//list method
	
	@RequestMapping(value="/cart/create", method=RequestMethod.POST)
	public String create(String bookid, String cart_cnt, 
			String userid, HttpSession session ,CartDTO dto){
		if(userid==null){
			userid= (String) session.getAttribute("userid");
			System.out.println("userid:"+userid);
		}
		dto.setCart_cnt(Integer.parseInt(cart_cnt));
		dto.setBookid(Integer.parseInt(bookid));
		dto.setUserid(userid);
		dto.setOrder_whether("N");
		
		int cnt=dao.create(dto);
		if(cnt>0){
		return "redirect:list";
		} else{
			return "/error";
		}
	}//create method
	
	@RequestMapping(value="/cart/selectOrder")
	public String selectOrder(CartDTO dto,HttpServletRequest request){
		String[] orderItem=request.getParameterValues("isOrder");
		List<CartDTO> list=new ArrayList();
		for(int i=0;i<orderItem.length;i++){
			dto=dao.read(Integer.parseInt(orderItem[i]));
			System.out.println("orderItem:"+orderItem[i]);
			list.add(dto);
		}
		request.setAttribute("list", list);
		return "/cart/selectOrder";
	}//method selectOrder
	
	@RequestMapping(value="/cart/delete", method=RequestMethod.GET)
	public String delete(HttpServletRequest request){
		
		int cartno=Integer.parseInt(request.getParameter("cartno"));
		//System.out.println("delete cartno: "+cartno);
		dao.delete(cartno);
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/cart/deleteUserCart", method=RequestMethod.GET)
	public int deleteUserCart(HttpServletRequest request){
		
		String userid=request.getParameter("userid");
		 
		return (dao.deleteUserCart(userid));
		
		
	}
	
	@RequestMapping(value="/cart/updateCart_cnt",method=RequestMethod.GET)
	public String updateCart_cnt(HttpServletRequest request,CartDTO dto){
		
		int cartno=Integer.parseInt(request.getParameter("cartno"));
		int cart_cnt=Integer.parseInt(request.getParameter("cart_cnt"));
		dto=dao.read(cartno);
		dto.setCart_cnt(cart_cnt);
		int cnt=dao.update(dto);
		if(cnt>0){
		return "redirect:list";
		}else{
			return "/error";
		}
	}

}//CartController class
