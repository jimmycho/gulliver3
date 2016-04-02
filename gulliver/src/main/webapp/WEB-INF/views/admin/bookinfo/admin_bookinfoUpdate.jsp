<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//숫자만 입력 받기
function showKeyCode(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) )
	{
		return;
	}
	else
	{
		return false;
	}
}
</script>
</head>
<body>
	<form action="./admin_bookinfoUpdate" method="post">
		<table align="center" border="1" cellpadding="1" cellspacing="1" style="width: 900px;">
			<tr>
				<td>책이름</td>
				<td><input name="bookname" size="30" type="text" value="${dto.bookname }"/></td>
			</tr>
			<tr>
				<td>책표지사진명</td>
				<td><input name="bookfront_photo" size="30" type="text" value="${dto.bookfront_photo }"/></td>
			</tr>
			<tr>
				<td>정가</td>
				<td><input name="cur_price" size="30" type="text" value="${dto.cur_price }" onkeydown="return showKeyCode(event)"/></td>
			</tr>
			<tr>
				<td>할인가</td>
				<td><input name="sale_price" size="30" type="text" value="${dto.sale_price }" onkeydown="return showKeyCode(event)"/></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input name="stock_cnt" size="30" type="text" value="${dto.stock_cnt }" onkeydown="return showKeyCode(event)"/></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input name="publisher" size="30" type="text" value="${dto.publisher }"/></td>
			</tr>
			<tr>
				<td>출판일시</td>
				<td><input name="pub_date" size="30" type="text" value="${dto.pub_date }"/></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input name="writer" size="30" type="text" value="${dto.writer }"/></td>
			</tr>
			<tr>
				<td>번역자</td>
				<td><input name="traductor" size="30" type="text" value="${dto.traductor }"/></td>
			</tr>
			<tr>
				<td>ISBN10</td>
				<td><input name="ISBN10" size="30" type="text" value="${dto.ISBN10 }" onkeydown="return showKeyCode(event)"/></td>
			</tr>
			<tr>
				<td>ISBN13</td>
				<td><input name="ISBN13" size="30" type="text" value="${dto.ISBN13 }" onkeydown="return showKeyCode(event)"/></td>
			</tr>
			<tr>
				<td>책 분류코드</td>
				<td><input name="BOOK_CATE_CD" size="30" type="text" value="${dto.BOOK_CATE_CD }" onkeydown="return showKeyCode(event)"/></td>
			</tr>
			<tr>
				<td>책설명</td>
				<td><input name="book_explain" size="30" type="text" value="${dto.book_explain }"/></td>
			</tr>
		</table>
	
		<input type="hidden" name="bookid" value="${param.bookid }">
		<p style="text-align: center;">
			<input name="" type="button" value="취소" onclick="history.back()"/>&nbsp;&nbsp;
			<input type="submit" value="수정" />
		</p>
	</form>
</body>
</html>