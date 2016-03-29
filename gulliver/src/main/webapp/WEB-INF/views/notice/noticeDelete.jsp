<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("삭제 되었습니다.");
	document.frm.submit();
</script>
</head>
<body onload="">
<form action="./delete" name="frm" method="post">
	<input type="hidden" name="noticeno" value="${param.noticeno}">
	<input type="hidden" name="col" value="${param.col}">
	<input type="hidden" name="word" value="${param.word}">
	<input type="hidden" name="nowPage" value="${param.nowPage}">
	<script>document.frm.submit();</script>
</form>
</body>
</html>