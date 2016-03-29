<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
function listB() {
	var url= "list?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";

	location.href = url;
}
function deleteB() {
	var url = "delete?faqno=${param.faqno}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";

	location.href = url;
}
function updateB() {
	var url = "update?faqno=${param.faqno}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";

	location.href = url;
}

</script>
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
<body>

<div align="center" style="font-size: xx-large;">[관리자]FAQ조회</DIV>
	<TABLE width="800px" align="center">
		<TR>
			<TH width="8%">번호</TH>
			<TD>${dto.faqno}</TD>
		</TR>
		<TR>
			<TH>분류</TH>
			<TD>${dto.faq_cat}</TD>
		</TR>
		<TR>
			<TH>제목</TH>
			<TD>${dto.title}</TD>
		</TR>
		<TR>
			<TH>내용</TH>
			<TD>${dto.content}</TD>
		</TR>
		<TR>
			<TH>등록일</TH>
			<TD>${dto.in_date}</TD>
		</TR>
		<TR>
			<TH>조회수</TH>
			<TD>${dto.faq_cnt}</TD>
		</TR>
	</TABLE>
	<DIV style='text-align: center; margin-top: 20px'>
		<input type='button' value='등록' onclick="location.href='./create'"> 
		<input type='button' value='목록' onclick="listB()"> 
		<input type='button' value='수정' onclick="updateB()"> 
		<input type='button' value='삭제' onclick="deleteB()"> 
		
	</DIV>
	
  
  <div class="bottom"> ${paging} </div>
</body>
</html>