<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/style1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function read(orderno){
	var url = "./read?orderno=" + orderno;
	url = url + "&col=${col}";
	url = url + "&word=${word}";
	url = url + "&nowPage=${nowPage}";
	
	location.href = url;	
}
</script>
</head>
<body>
	<div  height="23" colspan="10" align="center" ><img style="width: 753px; " src="../images/orderList.jpg">
	</div>
	<form action="./list" method="post" name="frm">
		<div style="text-align: center;">
			<select name="col">
				<option value="total" <c:if test="${col == 'total'}">selected='selected'</c:if>>전체</option>
				<option value="orderno" <c:if test="${col == 'orderno'}">selected='selected'</c:if>>주문번호</option>
				<option value="recipient" <c:if test="${col == 'recipient'}">selected='selected'</c:if>>수령인</option>
				<option value="order_date" <c:if test="${col == 'order_date'}">selected='selected'</c:if>>주문일</option>
			</select> 
			<input type="text" name="word" value="${word}">&nbsp;
			<input type="submit" value="검색">
		</div>
	</form>
	<table align="center" border="0" cellpadding="1" cellspacing="1" style="width: 800px" class="BTABLE">
		<tr>
			<td align="center" class="BTD2">주문번호</td>
			<td align="center" class="BTD2">주문인</td>
			<td align="center" class="BTD2">주문일</td>
			<td align="center" class="BTD2">책제목</td>
			<td align="center" class="BTD2">배송방법</td>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr class="BTD4"><td colspan="5" align="center">주문이력이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list}">
					<tr class="BTD4">
						<td><a href="javascript:read('${dto.orderno}')">${dto.orderno}</a></td> 
						<td>${dto.recipient}</td> 
						<td>${dto.order_date}</td> 
						<td style="text-align: center;" >${dto.bookname}</td> 
						<td>${dto.del_method}</td> 
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<br>
	<div style="text-align: center;">${paging}</div>
	<br>
</body>
</html>