<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
function read(bookid){
	var url = "./read?bookid=" + bookid;
		url = url + "&col=${col}";
		url = url + "&word=${word}";
		url = url + "&nowPage=${nowPage}";
		
		location.href = url;
}
</script>
</head>
<body>
	<form action="" method="post" name="frm">
		<br> <br>
		<table align="center" border="1" cellpadding="1" cellspacing="1"
			style="width: 800px;">
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="5" style="text-align: center;">등록된 책이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<c:forEach var="dto" items="${list}" varStatus="Status">
							<c:if test="${Status.index % 5 eq 0 }">
								<tr></tr>
							</c:if>
							<td>
								<a href="javascript:read('${dto.bookid}')">
									<img src="${dto.bookfront_photo}" /><br>
									${dto.bookname}<br> 
<%-- 									저자 : ${dto.writer}<br>  --%>
<%-- 									출판사 :	${dto.publisher}<br>  --%>
									정가 : <s><fmt:formatNumber value="${dto.cur_price}" pattern="#,###" />원</s> | 
									할인가 : <fmt:formatNumber value="${dto.sale_price}" pattern="#,###" />원
								</a>
							</td>
						</c:forEach>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<br>
		${paging}
	</form>
	<br>
</body>
</html>