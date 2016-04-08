<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
function read(faqno){
	var url = "read?faqno="+faqno;
	url = url +"&col=${col}";
	url = url +"&word=${word}";
	url = url +"&nowPage=${nowPage}";	
	location.href=url;	
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
</style>
<link href='../../css/style1.css' rel='Stylesheet' type='text/css'>
</head>
<body>
<div height="23" colspan="10" align="center">
		<img style="width: 753px;" src="../../images/adminFaq.jpg">
<br>
<DIV style='width: 80%; text-align: center; margin: 1px auto;'>
		<FORM name='frm' method='post' action="./list">
			<SELECT name='col'>
				<!-- 검색할 컬럼 -->
				<OPTION value='wname'
					<c:if test="${col=='wname'}">selected='selected'</c:if>>전체분류</OPTION>
				<OPTION value='title'
					<c:if test="${col=='title'}">selected='selected'</c:if>>주문/배송</OPTION>
				<OPTION value='content'
					<c:if test="${col=='content'}">selected='selected'</c:if>>결제</OPTION>
			</SELECT> 
			<input type='text' name='word' value='${word}'>
			<!-- 검색어 -->
			<input type='submit' value='검색'> 
		</FORM>
</DIV>
<br>
	<TABLE class="BTABLE" width="800px" border="0" >
		<TR>
			<TD align="center" class="BTD2" height="23" width="5%">번호</TD>
			<TD align="center" class="BTD2" height="23" width="100px">분류</TD>
			<TD align="center" class="BTD2" height="23">제목</TD>
			<TD  align="center" class="BTD2" height="23">등록일시</TD>
			<TD  align="center" class="BTD2" height="23">조회수</TD>			
		</TR>

<c:choose>
	<c:when test="${empty list }">
			<TR>
				<TD colspan='8' align='center'>등록된 FAQ가 없습니다.</TD>
			</TR>
	</c:when>

<c:otherwise>
	<c:forEach var="dto" items="${list}" >
		<TR>
			<TD valign="top">${dto.faqno }</TD>
			<TD valign="top">${dto.faq_cat }</TD>
			<TD valign="top"> 
          		<a href="javascript:read('${dto.faqno }')"> ${dto.title }</a>          		
          	</TD>
			<TD valign="top">${dto.in_date.subSequence(0,16)}</TD>
			<TD valign="top">${dto.faq_cnt}</TD>
		</TR>
  </c:forEach>
 </c:otherwise>

</c:choose>
</TABLE>
<div style='text-align: center; margin-top: 20px'>
${paging }
</div><br>
<div style='text-align: center; '>	<input class="BBUTTON" type='button' value='신규작성' onclick="location.href='./create'">
</div> 
</body>
</html>