<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// $(document).ready(function() {  
//     $("#btnReset").click(function() {  
//     	$(".text1").val("");
//     });  
//  });
</script>
  
</head>
<body>
	<h2 align="center">상 품 주 문 하 기</h2>
	<h2>주문상품 정보</h2>
	<form action="./create" method="post" name="frm">

		<table border="1" cellpadding="1" cellspacing="1" style="width: 700px;">
				<tr>
					<td bgcolor="grey" align="center">상품명</td>
					<td bgcolor="grey" align="center">가격</td>
					<td bgcolor="grey" align="center">수량</td>
				</tr>
				<c:choose>
					<c:when test="${empty cartlist}">
						<tr><td colspan="3">장바구니 상품이 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="cartdto" items="${cartlist}">
							<tr>
								<td>${cartdto.bookname}</td>
								<td><fmt:formatNumber value="${cartdto.cur_price * cartdto.cart_cnt}" pattern="#,###"/>원</td>
								<td>${cartdto.cart_cnt}</td>
<%-- 								<td>${cartdto.bookid}</td> --%>
							</tr>
							<c:set var="sum" value="${cartdto.cur_price * cartdto.cart_cnt}" />
							<c:set var="total" value="${total + sum}" />
							<input type="hidden" name="total" value="${total}"> 
							<input type="hidden" name="userid" value="${userdto.userid}"> 
							<input type="hidden" name="bookid" value="${cartdto.bookid}">
							<input type="hidden" name="order_cnt" value="${cartdto.cart_cnt}">
						</c:forEach>
					</c:otherwise>
				</c:choose>
		</table>
		<p><fmt:formatNumber value="${total}" pattern="#,###" />원
			<input type="button" name="cart" value="장바구니로 돌아가기" onclick="location.href='../cart/list'" />
		</p>

		<h2>배송방법 선택</h2>

		<table border="1" cellpadding="1" cellspacing="1" style="width: 700px;">
				<tr>
					<td bgcolor="grey" align="center" colspan="2" rowspan="5">배송방법</td>
					<td>
						<input checked="checked" name="del_method" id="courier" type="radio" value="택배"/>
						<label for="courier">택배 (택배 당일배송은 택배만 가능,가급적 회사 외 주소 지정)</label>
					</td>
				</tr>
				<tr>
					<td>
						<input name="del_method" id="Convenience" type="radio" value="편의점"/>
						<label for="Convenience">편의점 (출고 1~2일 내 점포 도착)</label>
					</td>
				</tr>
		</table>

		<h2>배송지 정보</h2>

		<table id="t2" border="1" cellpadding="1" cellspacing="1" style="width: 700px;">
				<tr>
					<td>*주문인</td>
					<td>${userdto.name }</td>
				</tr>
				<tr>
					<td>*받으시는 분</td>
					<td><input name="recipient" size="20" type="text" value="${userdto.name}" /></td>
				</tr>
				<tr>
					<td>*주소</td>
					<td>
						<p>
							<input name="del_zipcode" size="7" type="text" value="${userdto.zipcode }" />&nbsp;
							&nbsp;&nbsp;<input name="zipcode" type="button" value="우편번호검색" />
						</p>

						<p>
							<input name="del_address1" size="30" type="text" value="${userdto.address1 }" />
						</p>

						<p>
							<input name="del_address2" size="30" type="text" value="${userdto.address2 }" />
						</p>
					</td>
				</tr>
				<tr>
					<td>*휴대전화번호</td>
					<td>
						<input name="cellphone" size="20" type="text" value="${userdto.phone }" />
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input name="phone" size="20" type="text" value="${userdto.callphone}" /></td>
				</tr>
				<tr>
					<td>배달원에게 남기는 말</td>
					<td>
						<input name="order_comment" size="50" type="text" />
					</td>
				</tr>
		</table>

		<p style="text-align: center;">
			<input type="button" onclick="btnReset()" value="초기화" id="btnReset"><input name="orderform" type="submit" value="주문하기" />
		</p>
	</form>
	<br>
	<br>
</body>
</html>