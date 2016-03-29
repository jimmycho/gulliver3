<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function listB(){
	var url = "list?";
	var url = url + "col=${param.col}";
	var url = url + "&word=${param.word}";
	var url = url + "&nowPage=${param.nowPage}";

	location.href = url;
}
</script>
</head>
<body>
	<div align="center" style="font-size: xx-large;">공지사항 등록</div>
	<br>
	<form name="frm" action="./update" method="post">
		<input type="hidden" name="writer" value="관리자">
		<table align="center" border="1" cellpadding="1" cellspacing="1" style="width:800px;">
			<tr>
				<td><input type="text" name="title" value="${dto.title}" size="100"></td>
			</tr>
			<tr>
				<td><textarea rows="30" cols="100" name="content">${dto.content}</textarea></td>
			</tr>
		</table>
	<br>
	<div style="text-align: center;">
		<input type="button" name="delete" value="목록" onclick="listB()">&nbsp;
		<input type="submit" value="수정">&nbsp;
		<input type="button" onclick="history.back()" value="취소">
	</div>
	</form>
	<br><br>
</body>
</html>