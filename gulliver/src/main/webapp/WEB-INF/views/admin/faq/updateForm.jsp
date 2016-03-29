<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

</head>

<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->
	<div align="center" style="font-size: xx-large;">[관리자]FAQ수정</DIV>

	<Form name='frm' method='POST' action='./update'>
		<input type='hidden' name='faqno' size='30' value='${param.faqno }'>
		<input type='hidden' name='col' size='30' value='${param.col }'>
		<input type='hidden' name='word' size='30' value='${param.word }'>
		<input type='hidden' name='nowPage' size='30' value='${param.nowPage }'>

		<TABLE width="800px" align="center">
			<TR>
				<TH>번호</TH>
				<TD>${dto.faqno}</TD>
			</TR>
			<TR>
				<TH>분류</TH>
				<TD><input type='text' name='faq_cat' size='100'
					value='${dto.faq_cat}'></TD>
			</TR>
			<TR>
				<TH>제목</TH>
				<TD><input type='text' name='title' size='100'
					value='${dto.title }'></TD>
			</TR>
			<TR>
				<TH>내용</TH>
				<TD><TEXTAREA name='content' rows='10' cols='100'>${dto.content}</TEXTAREA></TD>
			</TR>
		</TABLE>

 
  <DIV style='text-align: center; margin-top: 20px; margin-bottom: 20px;'>
    <input type='submit' value='전송'>
    <input type='button' value='취소' onclick="history.back();"> 
  </DIV>  
</Form>
</body>
</html> 
</body>
</html>