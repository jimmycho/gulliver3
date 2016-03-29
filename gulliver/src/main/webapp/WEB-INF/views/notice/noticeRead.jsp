<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function updateB(noticeno){
	var url = "update?noticeno=" + noticeno;
	var url = url + "&col=${param.col}";
	var url = url + "&word=${param.word}";
	var url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
}

function deleteB(noticeno){
	if(confirm("삭제된 내용은 복구되지 않습니다.") == true){
		var url = "delete?noticeno=" + noticeno;
		var url = url + "&col=${param.col}";
		var url = url + "&word=${param.word}";
		var url = url + "&nowPage=${param.nowPage}";
		
		location.href = url;
	}else{
		return;
	}

}

function updateB(noticeno){
	var url = "update?noticeno=" + noticeno;
	var url = url + "&col=${param.col}";
	var url = url + "&word=${param.word}";
	var url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
}

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
<div align="center" style="font-size: xx-large;">공지사항 내용</div>
	<br><br>
	<table align="center" border="1" cellpadding="1" cellspacing="1" style="width:900px;">
		<tr>
			<td>${dto.title}</td>
		</tr>
		<tr>
			<td>${dto.content}</td>
		</tr>
	</table>
	<br>
	<div style="text-align: center;">
		<input type="button" name="delete" value="목록" onclick="listB()">&nbsp;
		<input type="button" name="delete" value="삭제" onclick="deleteB('${dto.noticeno}')">&nbsp;
		<input type="button" name="create" value="수정" onclick="updateB('${dto.noticeno}')">&nbsp;
		<input type="button" name="create" value="등록" onclick="location.href='./create'">
	</div>
	<br><br>
</body>
</html>