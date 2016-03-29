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

</head>
<body>
<div align="center" style="font-size: xx-large;"> [관리자]장바구니 목록 </div>
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
	<TABLE width="800px" align="center" >
		<TR>
			<TH width="5%">번호</TH>
			<TH width="5%">주문자ID</TH>
			<TH width="5%">책이름</TH>
			<TH width="15%">등록일시</TH>
			<TH width="8%">수량</TH>			
		</TR>

<c:choose>
	<c:when test="${empty list }">
			<TR>
				<TD colspan='8' align='center'>등록된 장바구니가 없습니다.</TD>
			</TR>
	</c:when>

<c:otherwise>
	<c:forEach var="dto" items="${list}" >
		<TR>
			<TD valign="top"><a href="javascript:read('${dto.cartno }')">${dto.cartno }</TD>
			<TD valign="top">${dto.userid }</TD>
			<TD valign="top"> 
          		 ${dto.bookname }</a>          		
          	</TD>
			<TD valign="top">${dto.input_date.subSequence(0,16)}</TD>
			<TD valign="top">${dto.cart_cnt}</TD>
		</TR>
  	</c:forEach>
 </c:otherwise>

</c:choose>
</TABLE>
<div style='text-align: center; margin-top: 20px'>
${paging }
</div>
<br>

</body>
</html>