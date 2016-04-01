<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<form action="" method="post" name="frm">
	<br><br>
		<table align="center" border="1" cellpadding="1" cellspacing="1" style="width:800px;">
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td>등록된 책이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>책 코드</td>
						<td>책이름</td>
						<td>원가격</td>
						<td>할인가격</td>
						<td>현재수량</td>
						<td>저자</td>
						<td>책표지</td>
						<td>선택</td>
					</tr>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.bookid }</td>
							<td>${dto.bookname }</td>
							<td><fmt:formatNumber value="${dto.cur_price }" pattern="#,###" />원</td>
							<td><fmt:formatNumber value="${dto.sale_price }" pattern="#,###" />원</td>
							<td>${dto.stock_cnt }</td>
							<td>${dto.writer }</td>
							<td><img src="${dto.bookfront_photo }"/></td>
							<td><input type="button" value="삭제"></td>
						</tr>
					</c:forEach>

				</c:otherwise>
			</c:choose>
		</table>
		
		<br>
		<div style="text-align: center;">
			<input type="button" name="create" value="등록"><br><br>
			${paging }
		</div>
		<br>
	</form>
</body>
</html>