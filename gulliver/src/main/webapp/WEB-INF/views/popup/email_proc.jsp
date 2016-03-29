<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
String email = request.getParameter("email");
int cnt=(Integer)request.getAttribute("cnt");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

</style>

<link href='../css/style.css' rel='Stylesheet' type='text/css'>
<script type="text/javascript">
function use(){
	opener.frm.email.value='<%=email %>';
	self.close();	
}

</script>
</head>
<body>

	<DIV class='title'>Email 중복 확인</DIV>

	<DIV class='content'>
		입력된 Email:
		<%=email %><br>
		<br>

		<%
  if (cnt == 1){
    out.println("중복되어 사용할 수 없습니다.<br>");
  }else{
    out.println("중복 아님, 사용 가능합니니다.<br>");
  }
  %>

	</DIV>

	<DIV class="bottom">
	<%if (cnt!=1){ %>
		<input type='button' value='사용' onclick='use()'>
	<%} %> 
		<input type='button' value='다시시도' onclick="location.href='emailForm'">
		<input type='button' value='닫기' onclick="window.close();">
	</DIV>

</body>
</html>
