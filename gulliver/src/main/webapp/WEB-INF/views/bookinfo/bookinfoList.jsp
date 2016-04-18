<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/style1.css" rel="stylesheet" type="text/css">
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
		<div  height="23" colspan="10" align="center" >
		<img style="width: 753px; " src="../images/0008.jpg">
	</div>
		<table width="800" border="0" class="BTABLE2">
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="5" style="text-align: center;">등록된 책이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<c:forEach var="dto" items="${list}" varStatus="Status">
							
							<td width="230" align="center">
									<img src="${dto.bookfront_photo}" style="width: 100px;" border=0/><br>
									<a href="javascript:read('${dto.bookid}')" class="bk3">${dto.bookname}</a><br> 
									<span class="author">${dto.writer}|${dto.publisher}<br> </span>
									<span class="br2010_p"><s><fmt:formatNumber value="${dto.cur_price}" pattern="#,###" />원</s> | 
									<fmt:formatNumber value="${dto.sale_price}" pattern="#,###" />원<br>
								
							</td>
							<c:if test="${(Status.index+1) % 5 eq 0 }">
								</tr><tr>
							</c:if>
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