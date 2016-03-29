<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css">
TH {
	border-color: #AAAAAA; /* 테이블 외곽선 색깔 */
	border-width: 1px; /* 테이블 외곽선 두께 */
	border-style: solid; /* 테이블 외곽선 스타일 */
	color: black; /* 글자 색 */
	background-color: #FFD549; /* 배경 색 */
	padding: 5px; /* 셀 내부 간격 */
}
TD {
	border-color: #AAAAAA; /* 테이블 외곽선 색깔 */
	border-width: 1px; /* 테이블 외곽선 두께 */
	border-style: solid; /* 테이블 외곽선 스타일 */
	color: black; /* 글자 색 */
	padding: 5px; /* 셀 내부 간격 */
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css"> 

</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
<div align="center" style="font-size: xx-large;">[관리자]FAQ 등록</DIV>
 
<Form name='frm' method='POST' action='./create'>
  <TABLE width='800px' align="center">
    <TR>
      <TH>분류</TH>
      <TD><input type='text' name='faq_cat' size='40' value='분류'></TD>
    </TR>  
    <TR>
      <TH>제목</TH>
      <TD><input type='text' name='title' size='40' value='제목'></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><TEXTAREA name='content' rows='10' cols='40'>내용</TEXTAREA></TD>
    </TR>
  </TABLE>
 
  <DIV class='bottom'>
    <input type='submit' value='전송'>
    <input type='button' value='취소' onclick="history.back();"> 
  </DIV>  
</Form>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 