<%@ page contentType="text/html; charset=UTF-8" %> 
<%  request.setCharacterEncoding("utf-8"); %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 
<link href="../css/style1.css" rel="stylesheet" type="text/css">
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
 
<div  height="23" colspan="10" align="center" ><img style="width: 753px; " src="../images/userInfo.jpg">
 
<FORM name='frm' 
 method='POST' 
 action='./updateFile'
 enctype="multipart/form-data"
 onsubmit="return inputCheck(this)"
 >
 
  <input type="hidden" name="userid" value="${param.userid }"/> 
  <input type="hidden" name="userphoto" value="${param.userphoto}"/>
   
  <table class="BTABLE" style="width:800px;">
    <tr>
      <td class="BTD" height="20">원본파일</td>
      <td>
       <img src="${pageContext.request.contextPath }/storage/${param.userphoto}" style="width: 100px">
       파일명:${param.userphoto}
      </td>
    </tr>
    <tr>
      <td class="BTD" height="20">변경파일</td>
      <td>
       <input type="file" name="fname">
      </td>
    </tr>
  </table>
  
  <DIV class='bottom'>
    <input type='submit' value='변경' class="BBUTTON">
    <input type='button' value='취소' onclick="history.back()" class="BBUTTON">
  </DIV>
</FORM>

</body>

</html> 