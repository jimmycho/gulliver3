<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>걸리버서점 프로젝트</title>
<script type="text/javascript">
function read(noticeno){
	var url = "read?noticeno=" + noticeno;
	url = url + "&col=${col}";
	url = url + "&word=${word}";
	url = url + "&nowPage=${nowPage}";
	location.href = url;
}
</script>

</head>
<body>
<div align="center" style="font-size: xx-large;">공지사항</div>
	<form action="./list" method="post" name="frm">
	<br>
	<div style="text-align: center;">
		<select name="col">
			<option value="total" <c:if test="${col=='total'}">selected='selected'</c:if>>전체</option>
			<option value="content" <c:if test="${col=='content'}">selected='selected'</c:if>>내용</option>
			<option value="title" <c:if test="${col=='title'}">selected='selected'</c:if>>제목</option>
		</select>
		
	<input type="text" name="word" value="${word}">&nbsp;<input type="submit" value="검색">
	</div>
	<br>
		<table align="center" border="1" cellpadding="1" cellspacing="1" style="width:800px;">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
<!-- 				<th>선택</th> -->
			</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="5" align="center">등록된 글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.noticeno}</td>
						<td><a href="javascript:read('${dto.noticeno}')">${dto.title}</a></td>
						<td>${dto.writer}</td>
						<td>${dto.notice_cnt}</td>
						<td>${dto.in_date}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		<br>
		<div style="text-align: center;">
<!-- 			<input type="button" name="delete" value="삭제" onclick="delete('')">&nbsp; -->
<!-- 			<input type="button" name="create" value="수정" onclick="update('')">&nbsp; -->
			<input type="button" name="create" value="등록" onclick="location.href='./create'">
			<br><br>
			${paging}
			<br><br>
		</div>
	</form>
</body>
</html>