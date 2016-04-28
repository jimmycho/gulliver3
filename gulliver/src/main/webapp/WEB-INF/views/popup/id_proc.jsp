<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %> 
<%
String userid = request.getParameter("userid");
int cnt=(Integer)request.getAttribute("cnt");
System.out.println("cnt:"+cnt);
%>
<!DOCTYPE html> 
<html> 
<script type="text/javascript">
function use(){
	opener.frm.id.value='<%=userid%>';
	self.close();	
}

</script>
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href='../css/style1.css' rel='Stylesheet' type='text/css'> 
 
</head> 
<body> 
 

<DIV class='BTEXT'>
  입력하신 아이디는 <%=userid %> 이며<br>
  
  <%
  if (cnt == 1){
    out.println("중복되어 사용할 수 없습니다.<br><br>");
  }else{
    out.println("사용이 가능한 아이디입니다.<br><br>");
  }
  %>
 
</DIV>
 
<DIV align="center"> 
<%if(cnt!=1){ %>
  <input type='button' value='사용' onclick='use()' class="BBUTTON">
<%} %>
  <input type='button' value='다시시도' onclick="location.href='idForm'" class="BBUTTON">
  <input type='button' value='닫기' onclick="window.close();" class="BBUTTON">
 
</DIV> 
 
 
</body> 
</html> 