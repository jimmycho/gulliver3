<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/style1.css" rel="stylesheet" type="text/css">
<title></title>
<script type="text/javascript">
  function ToggleReadWrite (cart_cnt,cartno) {
	  
	  var element=document.getElementById(cart_cnt);
	  //alert("cart_cnt:"+cart_cnt);
	  element.readOnly=!element.readOnly;
	 
	   if(element.readOnly==false){
		  element.style.border = "thin solid #FE2E9A";
		  }else{
			  element.style.border = "none";
			  var url ="updateCart_cnt";
				  url = url + "?cartno="+cartno;
				  url = url + "&cart_cnt="+element.value;	 
				  location.href= url ;
		  }
	  
  }
</script>

<!-- 
<style type="text/css">
TH {
	border-color: #AAAAAA; /* 테이블 외곽선 색깔 */
	border-width: 1px; /* 테이블 외곽선 두께 */
	border-style: solid; /* 테이블 외곽선 스타일 */
	color: black; /* 글자 색 */
	background-color: #FFD549; /* 배경 색 */
	padding: 5px; /* 셀 내부 간격 */
}
</style> -->

</head>
<body>
<center>
<%-- <div align="center" style="font-size: xx-large;"><c:out value="${list[0].name}"/>  님 장바구니 목록 </div> --%>
<form action="../order/create" method="get" name="frm">
<div  height="23" colspan="10" align="center" >
<img style="width: 753px; " src="../images/cartMenu2.jpg">
</div>
<table class="BTABLE" width="800px" border="0" >
			<tr> 
				<td align="center" class="BTD2" height="23">No</td>
				<td align="center" class="BTD2" height="23">입력일시</td>
				<td align="center" class="BTD2" height="23">책이름</td>
				<td align="center" class="BTD2" height="23">가격(원)</td>
				<td align="center" class="BTD2" height="23">수량(권)</td>
				<td align="center" class="BTD2" height="23">삭제</td>
				<td align="center" class="BTD2" height="23">주문선택</td>
			</tr>
<c:choose>	
	<c:when test="${empty list }">
		<tr bgcolor="#ffffff" >
		<td colspan="7" align="center">장바구니에 담긴 상품이 없습니다.</td>
		</tr>
	</c:when>	
	<c:otherwise>
	<c:forEach var="dto" items="${list }" varStatus="status" >
			<tr bgcolor="#ffffff">
				<td>${dto.cartno }</td>
				<td>${dto.input_date }</td>
				<td>${dto.bookname }</td>
				<td><fmt:formatNumber value="${dto.cur_price }" pattern="#,###"/></td>
				<td align="right">
				<input id="${status.index }" style="border:none;  ;" size="1"type="text" 
				value="${dto.cart_cnt }" readonly="readonly">권
				<input id="cart_cnt_btn" type="button" onclick="ToggleReadWrite(${status.index},${dto.cartno })" value="수량변경">
				</td>
				<td style="text-align: center;">
				<input type="button" onclick="location.href='delete?cartno=${dto.cartno}'" value="삭제">
				</td>
				<td align="center">
				<input style="" name="isOrder" type="checkbox" value="${dto.cartno }" />
				</td>
			</tr>
		
			</c:forEach>
</c:otherwise>				
</c:choose>
			<tr>
				<td colspan="7" style="text-align: right;">
					총 상품 가격: ${totalPrice }원<br>
					총 상품 수량: 총 ${totalCart_cnt}권<br>
					<div align="right"><input type="submit" style="" value="   주   문   하   기   " class="BBUTTON"></div>
				</td>  
					
			</tr>
	</table>
	
</form>


	
<br>
</center>
</body>
<script type="text/javascript">

function deleteB() {
	location.href='delete?cartno=${dto.cartno}';
}
function updateB() {
	location.href = "update?cartno=${dto.cartno}";
}

</script>
</html>