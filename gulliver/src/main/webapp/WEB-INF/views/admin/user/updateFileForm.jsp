<%@ page contentType="text/html; charset=UTF-8" %> 
<%  request.setCharacterEncoding("utf-8"); %> 
 
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
<script type="text/javascript">
function inputCheck(f){
	
	if(f.fname.value==""){
		alert("변경사진파일 선택요망");
		f.fname.focus();
		return false;
	}
}

</script>


</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">사진 수정</DIV>
 
<FORM name='frm' 
 method='POST' 
 action='./updateFile'
 enctype="multipart/form-data"
 onsubmit="return inputCheck(this)"
 >
 
  <input type="hidden" name="userid" value="${param.userid }"/> 
  <input type="hidden" name="userphoto" value="${param.userphoto}"/>
   
  <TABLE class='table'>
    <TR>
      <TH>원본파일</TH>
      <TD>
       <img src=${pageContext.request.contextPath }/storage/${param.userphoto}">
       원본파일명:${param.userphoto}
      </TD>
    </TR>
    <TR>
      <TH>변경파일</TH>
      <TD>
       <input type="file" name="fname">
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경' >
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>

</body>

</html> 