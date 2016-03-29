<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//jquery에서 function호출할때 형식  
	//onload이벤트라고 보시면 됩니다.  
	$(document).ready(function() {

		// frm폼에 submit이벤트가 일어날때 반응  
		// jquery 해당폼 해당이벤트 이런식으로 함수 작성  
		$("form#frm").bind("submit", function() {

			//.val()로 값을 가지고 올수 있으나 .trim()하여 비교  
			//하면 빈값이나 스페이스값 빈값에 개행까지 잡아냄  
			if ($("input#title").val().trim() == "") {
				alert("제목을 입력해 주세요.");
				$("input#title").focus();
				return false;
			}
			if ($("textarea#content").val().trim() == "") {
				alert("내용을 입력해 주세요.");
				$("textarea#content").focus();
				return false;
			}
			if ($("input#writer").val().trim() == "") {
				alert("작성자를 입력해 주세요.");
				$("input#writer").focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
	<div align="center" style="font-size: xx-large;">공지사항 등록</div>
	<br>
	<form name="frm" id="frm" action="./create" method="post">

		<table align="center" border="1" cellpadding="1" cellspacing="1"
			style="width: 800px;">
			<tr>
				<td><input type="text" name="title" id="title" value="" size="100"></td>
			</tr>
			<tr>
				<td><textarea rows="30" cols="100" name="content" id="content"></textarea></td>
			</tr>
			<tr>
				<td><input type="text" name="writer" id="writer" value="관리자"></td>
		</table>
		<br>
		<div style="text-align: center;">
			<input type="submit" value="등록">
		</div>
	</form>
	<br>
	<br>
</body>
</html>