<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
</script>
</head>
<body leftmargin="0" topmargin="0">

	<DIV align="center" style="style="font-size: xx-large;">서명:${dto.bookname}
	</DIV>
<table align="center" border="1" cellpadding="1" cellspacing="1" style="width:900px;">
	<tr>
		<td rowspan="12" width="30%"><p style="text-align: center; border-color: gray;">
		<img style=" border-style: solid;border-color: green;" alt="" width="70%" src="${dto.bookfront_photo}" /></p></td>
	</tr>
	<tr><td width="20%">책 코드</td>
		<td>${dto.BOOK_CATE_CD }</td>
	</tr>
	<tr><td>책이름</td>
		<td>${dto.bookname }</td>
	</tr>
	<tr><td>정가</td>
		<td>${dto.cur_price }</td>
	</tr>
	<tr><td>판매가</td>
		<td>${dto.sale_price }</td>
	</tr>
	<tr><td>재고수량</td>
		<td>${dto.stock_cnt }</td>
	</tr>
	<tr><td>출판일시</td>
		<td>${dto.input_date }</td>
	</tr>
	<tr><td>저자</td>
		<td>${dto.writer }</td>
	</tr>
	<tr><td>번역자</td>
		<td>${dto.traductor }</td>
	</tr>
	<tr>
	<td colspan="3">${dto.book_explain }</td>
	</tr>					
</table>
<form name="frm" action="./create" method="post">
	<p style="text-align: center;">주문수량
	<input type="number" name="cart_cnt" min="1" value="수량" ><br>
	<input type="submit" value="장바구니담기">
	<input type="hidden" name="bookid" value="${dto.bookid }">
	<input type="hidden" name="userid" value="${sessionScope.userid}">
	<input type="button" value="돌아가기" onclick="location.href='${pageContext.request.contextPath}/'" >
</form>

</body>
</html>
