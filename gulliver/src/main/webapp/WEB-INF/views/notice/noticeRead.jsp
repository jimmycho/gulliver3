<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/style1.css" rel="stylesheet" type="text/css">
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
	<table style="width:800px;" class="BTABLE">
	<tr>
				<td height="23" colspan="5" align="center">
				<img style="width: 753px;" src="../images/0006.jpg"></td>
			</tr>
	<tr>
		<td class="BTD5" width="23" align="center" colspan="4">공 지 사 항</td>
	</tr>
	<tr>
		<td width="70" class="BTD2 " align="center">번호</td>
		<td bgcolor="#ffffff">${dto.noticeno}</td>
	</tr>
	<tr>
		<td class="BTD2 " align="center">제목</td>
		<td bgcolor="#ffffff">${dto.title}</td>
	</tr>
	<tr>
		<td width="70" class="BTD2 " align="center">조회수</td>
		<td bgcolor="#ffffff">${dto.notice_cnt}</td>
	</tr>
	<tr>
		<td width="70" class="BTD2 " align="center">등록날짜</td>
		<td bgcolor="#ffffff">${dto.in_date}</td>
	</tr>

	<tr>
		<td class="BTD2 " align="center">내용</td>
		<td bgcolor="#ffffff">${dto.content}</td>
	</tr>
	
	</table>
	<br>
	<div style="text-align: center;">
		<input type="button" name="delete" value="목록" onclick="listB()" class="BBUTTON" >&nbsp;
		<c:if test="${sessionScope.grade == 'A' }">
			<input type="button" name="delete" value="삭제" onclick="deleteB('${dto.noticeno}')" class="BBUTTON" >&nbsp;
			<input type="button" name="update" value="수정" onclick="updateB('${dto.noticeno}')" class="BBUTTON" >&nbsp;
			<input type="button" name="create" value="등록" onclick="location.href='./create'" class="BBUTTON" >
		</c:if>
	</div>
	<br><br>
</body>
</html>