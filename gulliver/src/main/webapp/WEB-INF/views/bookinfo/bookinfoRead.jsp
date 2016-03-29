<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br><br>
	<form name="frm" action="../cart/create" method="post">
		<table align="center" border="1" cellpadding="1" cellspacing="1" style="width:900px;">
			<tr>
				<td rowspan="11" width="30%">
					<p style="text-align: center;">
						<img src="${dto.bookfront_photo }" width="200" height="300"/>
					</p>
				</td>
			</tr>
			<tr>
				<td>책이름</td>
				<td>${dto.bookname}</td>
			</tr>
			<tr>
				<td>저자</td>
				<td>${dto.writer}</td>
			</tr>
			<tr>
				<td>번역자</td>
				<td>${dto.traductor}</td>
			</tr>
			<tr>
				<td>출판일시</td>
				<td>${dto.pub_date}</td>
			</tr>
			<tr>
				<td width="20%">ISBN 10자리</td>
				<td>${dto.ISBN10}</td>
			</tr>
			<tr>
				<td width="20%">ISBN 13자리</td>
				<td>${dto.ISBN13}</td>
			</tr>
			<tr>
				<td>정가</td>
				<td><s><fmt:formatNumber value="${dto.cur_price}" pattern="#,###" />원</s></td>
			</tr>
			<tr>
				<td>할인가</td>
				<td><fmt:formatNumber value="${dto.sale_price}" pattern="#,###" />원</td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="number" name="cart_cnt" min="1" max="100" value="1" ></td>
			</tr>
			<tr>
				<td colspan="2">
				<p style="text-align: center;">
					<input type="submit" value="장바구니담기">
					<input type="button" onclick="history.back()" value="돌아가기" />
					<input type="hidden" name="bookid" value="${dto.bookid }">
					<input type="hidden" name="userid" value="${sessionScope.userid}">
				</td>
			</tr>		
			<tr>
				<td colspan="3">
					${dto.book_explain}
				</td>
			</tr>					
		</table>
	</form>
	<br>
	<div style="text-align: center;">
		<c:if test="${'A' eq sessionScope.grade}">
			<input type="button" value="수정">
			<input type="button" value="삭제" onclick="deleteB('${dto.bookid}')">
			<input type="button" value="목록">
		</c:if>
	</div>
	<br>
</body>
</html>