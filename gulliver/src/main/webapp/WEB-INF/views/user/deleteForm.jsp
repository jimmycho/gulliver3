<%@ page contentType="text/html; charset=UTF-8" %> 
<%  
/* String id=(String)request.getAttribute("id");
String oldfile=(String)request.getAttribute("oldfile"); */
%>  
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">회원탈퇴</DIV>
 
<FORM name='frm' method='POST' action='./delete'>
  <input type="hidden" name="userid" value="${userid}"> <!-- model에서 받아옴 -->
  <input type="hidden" name="userphoto" value="${userphoto}">
  
  <div class="content">
   탈퇴를 하시면 더이상 컨텐트를 제공받을 수 없습니다.<br>
   그래도 탈퇴를 원하시면 아래 탈퇴버튼을 클릭하세요.
  </div>
  
  <DIV class='bottom'>
    <input type='submit' value='탈퇴'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 