<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function updateB(bookid){
	var url = "./admin_bookinfoUpdate?";
	url = url + "bookid=" + bookid;
	location.href = url;
}

function deleteB(bookid){
	var url = "./admin_bookinfoDelete?";
	url = url + "bookid=" + bookid;
	location.href = url;
}

</script>
</head>
<body>
	<br><br>
		<table align="center" border="1" cellpadding="1" cellspacing="1" style="width: 800px;">
			<tr>
				<td width="30%">책이름</td>
				<td>${dto.bookname }</td>
			</tr>
			<tr>
				<td>책표지사진명</td>
				<td><img src="${dto.bookfront_photo }"></td>
			</tr>
			<tr>
				<td>정가</td>
				<td>${dto.cur_price }</td>
			</tr>
			<tr>
				<td>할인가</td>
				<td>${dto.sale_price }</td>
			</tr>
			<tr>
				<td>수량</td>
				<td>${dto.stock_cnt }</td>
			</tr>
			<tr>
				<td>출판사</td>
				<td>${dto.publisher }</td>
			</tr>
			<tr>
				<td>출판일시</td>
				<td>${dto.pub_date }</td>
			</tr>
			<tr>
				<td>저자</td>
				<td>${dto.writer }</td>
			</tr>
			<tr>
				<td>번역자</td>
				<td>${dto.traductor }</td>
			</tr>
			<tr>
				<td>ISBN10</td>
				<td>${dto.ISBN10 }</td>
			</tr>
			<tr>
				<td>ISBN13</td>
				<td>${dto.ISBN13 }</td>
			</tr>
			<tr>
				<td>책 분류코드</td>
				<td>${dto.BOOK_CATE_CD }</td>
			</tr>
			<tr>
				<td>책설명</td>
				<td>${dto.book_explain }</td>
			</tr>
		</table>


<p style="text-align: center;">
	<input type="button" onclick="history.back()" value="취소" />
	<input name="updateB" type="button" onclick="updateB('${param.bookid}')" value="수정" />
	<input name="deleteB" type="button" onclick="deleteB()" value="삭제" />
</p>
</body>
</html>