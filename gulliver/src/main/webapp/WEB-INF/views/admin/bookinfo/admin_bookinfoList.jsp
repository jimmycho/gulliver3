<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../../css/style1.css" rel="stylesheet" type="text/css">
<title></title>
<script type="text/javascript">
function bCreate(){
	var url = "./admin_bookinfoCreate";
	location.href = url;
}

function bRead(bookid){
	var url = "./admin_bookinfoRead?";
	url = url + "bookid=" + bookid;
	location.href = url;
}

function bDelete(bookid){
	if(confirm("정말 삭제 하시겠습니까?") == true){
		var url = "./admin_bookinfoDelete?";
		url = url + "bookid=" + bookid;
		location.href = url;
	}else{
		return;
	}

}
</script>
</head>
<body>
<div  height="23" colspan="10" align="center" >
 <img style="width: 753px; " src="../../images/adminBookInfo.jpg">
</div>
	<form action="" method="post" name="frm">
		<table align="center" border="1" style="width: 800px" class="BTABLE">
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td>등록된 책이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						
						<td  align="center" class="BTD2">코드</td>
						<td align="center" class="BTD2">책표지</td>
						<td  align="center" class="BTD2">책이름</td>
						<td  align="center" class="BTD2">원가격</td>
						<td  align="center" class="BTD2">할인가격</td>
						<td  align="center" class="BTD2">현재수량</td>
						<td align="center" class="BTD2">저자</td>
						
						<td align="center" class="BTD2">선택</td>
					</tr>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.bookid }</td>
							<td><img src="${dto.bookfront_photo }" style="width: 80px;" border=0/></td>
							<td><a href="javascript:bRead('${dto.bookid}')">${dto.bookname}</a></td>
							<td><fmt:formatNumber value="${dto.cur_price }" pattern="#,###" />원</td>
							<td><fmt:formatNumber value="${dto.sale_price }" pattern="#,###" />원</td>
							<td>${dto.stock_cnt }</td>
							<td>${dto.writer }</td>
							
							<td><input type="button" onclick="bDelete('${dto.bookid}')" value="삭제" class="BBUTTON"></td>
						</tr>
					</c:forEach>

				</c:otherwise>
			</c:choose>
		</table>
		
		<br>
		<div style="text-align: center;">
			<input type="button" onclick="bCreate()" name="create" value="등록" class="BBUTTON"><br><br>
			${paging }
		</div>
		<br>
	</form>
</body>
</html>