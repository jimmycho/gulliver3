package spring.sts.gulliver;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.model.user.UserDAO;
import spring.model.user.UserDTO;
import spring.utility.gulliver.Paging;
import spring.utility.gulliver.Utility;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao; 
	
	@RequestMapping("/user/checkId")
	public String checkId(String userid, Model model){
		System.out.println("userid:"+userid);
		int cnt=dao.duplicateId (userid);
		model.addAttribute("cnt",cnt);
		return "/popup/id_proc";
	}
	@RequestMapping("/user/checkEmail")
	public String checkEmail(String email, Model model){
		int cnt=dao.duplicateEmail(email);
		System.out.println("email:"+email);
		System.out.println("cnt:"+cnt);
		model.addAttribute("cnt", cnt);
		return "/popup/email_proc";
	}
	
	@RequestMapping("/user/agree")
	public String agreement(){
		return "/user/agree";
	}
	@RequestMapping("/user/createForm")
	public String createForm(){
		return "/user/create";
	}
	
	@RequestMapping("/user/create")
	public String create(UserDTO dto, HttpServletRequest request){
		String basePath=request.getRealPath("/storage");
		String fname = null;
		int size=(int)dto.getUserphotoMF().getSize() ;
		
		if(size>0){
			fname=Utility.saveFileSpring30(dto.getUserphotoMF(), basePath);
		}else{
			fname="member.jpg";
		}
		dto.setUserphoto(fname);
		int cnt=dao.create(dto);
		if(cnt==1){
			return "redirect:/";
		}else{
			return "/error";
		}
	}
	
	@RequestMapping(value="/user/login", method=RequestMethod.GET)
	public String login(HttpServletRequest request,
			@RequestParam(value="faqno",defaultValue="0")int faqno,
			@RequestParam(value="nowPage",defaultValue="0")int nowPage
			) {
			
				/*----쿠키설정 내용시작----------------------------*/
				String c_id = ""; // ID 저장 여부를 저장하는 변수, Y
				String c_id_val = ""; // ID 값

				Cookie[] cookies = request.getCookies();
				Cookie cookie = null;

				if (cookies != null) {
					for (int i = 0; i < cookies.length; i++) {
						cookie = cookies[i];

						if (cookie.getName().equals("c_id")) {
							c_id = cookie.getValue(); // Y
						} else if (cookie.getName().equals("c_id_val")) {
							c_id_val = cookie.getValue(); // user1...
						}
					}
				}
				/*----쿠키설정 내용 끝----------------------------*/
				request.setAttribute("c_id", c_id);
				request.setAttribute("c_id_val", c_id_val);
				
				request.setAttribute("nowPage", nowPage);
				System.out.println("nowPage:"+nowPage);
				request.setAttribute("faqno", faqno);
				System.out.println("faqno:"+faqno);
				return "/user/login";
			}
	
	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	public String login(String userid, String passwd,
						HttpServletRequest request, HttpServletResponse response,
						int faqno, int nowPage, String col,String word,String flag,
						HttpSession session, Model model){
		
		Map  map=new HashMap();
		map.put("userid", userid);
		map.put("passwd", passwd);
		int cnt=dao.loginCheck(map);
		
		String grade=null;
		String url="/user/passwdError";
		if(cnt==1){
			url="redirect:/";
			if(flag!=""){
				model.addAttribute("faqno", faqno);
				model.addAttribute("nowPage", nowPage);
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				url="redirect:"+flag;
			}
			grade=dao.getGrade(userid);
			session.setAttribute("userid", userid);
			session.setAttribute("grade", grade);
			
			// ----------------------------------------------
						// Cookie 저장, Checkbox는 선택하지 않으면 null 임
						// ----------------------------------------------
						Cookie cookie = null;

						String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부

							if (c_id != null) { // 처음에는 값이 없음으로 null 체크로 처리
								cookie = new Cookie("c_id", "Y"); // 아이디 저장 여부 쿠키
								cookie.setMaxAge(120); // 2 분 유지
								response.addCookie(cookie); // 쿠키 기록
				
								cookie = new Cookie("c_id_val", userid); // 아이디 값 저장 쿠키
								cookie.setMaxAge(120); // 2 분 유지
								response.addCookie(cookie); // 쿠키 기록
				
							} else {
								cookie = new Cookie("c_id", ""); // 쿠키 삭제
								cookie.setMaxAge(0);
								response.addCookie(cookie);
				
								cookie = new Cookie("c_id_val", ""); // 쿠키 삭제
								cookie.setMaxAge(0);
								response.addCookie(cookie);
							}
						// ---------------------------------------------

						return url;
						
					}else{
						
						return url;
						
					}//else
		}//login method
	@RequestMapping("/user/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}//logout method
	
	@RequestMapping("/user/read")
	public String read(String userid, Model model, HttpSession session){
		if(userid==null){
	        userid = (String)session.getAttribute("userid");
	    }

		UserDTO dto = dao.read(userid);
		System.out.println("dto.name"+dto.getName());
	    model.addAttribute("dto",dto);
		
		return "/user/read";
	}//read method
	
	@RequestMapping("/adm/user/list")
	public String UserList(HttpServletRequest request){
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
		
		return "/admin/user/list"; //관리자용 faq 목록
	}//admin/user/list메소드
	
	@RequestMapping("/user/MyPage")
	public String MyPage(String userid, Model model, HttpSession session){
		
		if(userid==null){
	        userid = (String)session.getAttribute("userid");
	    }

		UserDTO dto = dao.read(userid);
	    model.addAttribute("dto",dto);
		
		return "/user/MyPage";
		
	}
	@RequestMapping("/adm/adminPage")
	public String AdminPage(String userid, Model model, HttpSession session){
		
		if(userid==null){
			userid = (String)session.getAttribute("userid");
		}
		
		UserDTO dto = dao.read(userid);
		model.addAttribute("dto",dto);
		
		return "/admin/user/adminPage";
		
	}//method AdminPage
	
	@RequestMapping(value="/user/update", method=RequestMethod.GET)
	public String update(String id, HttpSession session, Model model){//model에 저장해서 view 페이지로 넘긴다
		
		/*if(id==null){
			id=(String) session.getAttribute("id");
		}*/
		
		UserDTO dto=dao.read(id);
		model.addAttribute("dto",dto);
		return "/user/update";
	}
	
	@RequestMapping(value="/user/update", method=RequestMethod.POST)
	public String update(UserDTO dto,HttpServletRequest request, HttpServletResponse response){//model에 저장해서 view 페이지로 넘긴다
		
		int cnt=dao.update(dto);
		System.out.println(dto.getPhone());
		if(cnt==1){
					return "redirect:/user/read";
				}else{
					return "/user/error";
				}
		}
	
	
}//class UserController
