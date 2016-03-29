<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
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

<table align="center" border="1" cellpadding="1" cellspacing="1"
		style="width: 700px;">
		<tbody>
			<tr bgcolor="#FFD549">
			<th>일련번호</th>
				<th>장바구니번호</th>
				<th>책 ID</th>
				<th>책이름</th>
				<th>수량</th>
				
				
			</tr>

	<c:forEach var="dto" items="${list}" varStatus="status">
		<tr>
			<td>${status.index+1 }</td>
			<td>${dto.cartno }</td>
			<td>${dto.bookid }</td>
			<td>${dto.bookname }</td>
			<td>${dto.cart_cnt }</td>
			
		</tr>
	</c:forEach>
</tbody>

</table>

	
<br>

</body>
</html>