<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
.rcreate{
  font-size: 20px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 780px;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}

.rlist{
  line-height:1.2em;
  font-size: 15px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 780px;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}

hr{
  text-align: center;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  width: 45%;            /* 화면의 30% */ 
}
 
 
</style>  

<script type="text/javascript">
function checkLogin(userid){
	if(userid==null) alert("로그인 상태에서 이용가능합니다.")	;
	return false;	
}

</script>
</head>
<body>
	<br><br>
	<form name="frm1" action="../cart/create" method="post" onsubmit="return checkLogin(${sessionScope.userid})">
		<table align="center" border="1" cellpadding="1" cellspacing="1" style="width:800px;">
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
	
	<!-- 100자평 시작 -->
	<form action="./ccreate" method="post" name="frm2">
<%-- 		<input type="hidden" name="bookid" value="${bookid}"> --%>
					
				<div class="rcreate">
					<select name = "star_cnt">
						<option value = "0">☆☆☆☆☆</option>
						<option value = "1">★☆☆☆☆</option>
						<option value = "2">★★☆☆☆</option>
						<option value = "3">★★★☆☆</option>
						<option value = "4">★★★★☆</option>
						<option value = "5">★★★★★</option>
					</select>
					<textarea cols="105" name="say100ja" rows="5"></textarea><br>
					<input type="submit" name="등록" value="등록" />
				</div>
			<c:choose>
				<c:when test="${empty clist }">
					100자평이 없습니다.
				</c:when>
				<c:otherwise>
						<c:forEach var="cdto" items="${clist }">
						<div class="rlist">
								<c:choose>
									<c:when test="${cdto.star_cnt == 0}">
										☆☆☆☆☆
									</c:when>	
									<c:when test="${cdto.star_cnt == 1}">
										★☆☆☆☆
									</c:when>
									<c:when test="${cdto.star_cnt == 2}">
										★★☆☆☆
									</c:when>
									<c:when test="${cdto.star_cnt == 3}">
										★★★☆☆
									</c:when>
									<c:when test="${cdto.star_cnt == 4}">
										★★★★☆
									</c:when>
									<c:when test="${cdto.star_cnt == 5}">
										★★★★★
									</c:when>
								</c:choose>
								${cdto.say100ja }
							</div>
						</c:forEach>
				</c:otherwise>
			</c:choose>
		${paging }
	</form>
	<br>
	<!-- 100자평 끝 -->
</body>
</html>