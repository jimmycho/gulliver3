<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/style1.css" rel="stylesheet" type="text/css">
<title></title>
<script type="text/javascript">
function read(cartno){
	var url = "read?cartno="+cartno;
	url = url +"&col=${col}";
	url = url +"&word=${word}";
	url = url +"&nowPage=${nowPage}";	
	location.href=url;	
}
</script>

</head>
<body>
<div  height="23" colspan="10" align="center" ><img style="width: 753px; " src="../../images/adminCart.jpg">
	</div>
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
</DIV><br>
	<TABLE align="center" border="0" cellpadding="1" cellspacing="1" style="width: 800px" class="BTABLE">
		<TR>
			<td align="center" class="BTD2">번호</td>
			<td align="center" class="BTD2">주문자ID</td>
			<td align="center" class="BTD2">책이름</td>
			<td align="center" class="BTD2">등록일시</td>
			<td align="center" class="BTD2">수량</td>			
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
			<TD valign="top">${dto.cartno }</TD>
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