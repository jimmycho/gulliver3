<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/style1.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title> </title>
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
	<form action="./list" method="post" name="frm">
	<%-- <div style="text-align: center;">
		<select name="col">
			<option value="total" <c:if test="${col=='total'}">selected='selected'</c:if>>전체</option>
			<option value="content" <c:if test="${col=='content'}">selected='selected'</c:if>>내용</option>
			<option value="title" <c:if test="${col=='title'}">selected='selected'</c:if>>제목</option>
		</select>
		
	<input type="text" name="word" value="${word}">&nbsp;<input type="submit" value="검색">
	</div> --%>
		<table width="800px" class="BTABLE">
			<tr>
				<td height="23" colspan="5" align="center">
				<img style="width: 753px;" src="../images/0006.jpg"></td>
			</tr>
			<tr>
				<td align="center" class="BTD2">번호</td>
				<td align="center" class="BTD2">제목</td>
				<td align="center" class="BTD2">작성자</td>
				<td align="center" class="BTD2">조회수</td>
				<td align="center" class="BTD2">등록일</td>
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
		<div style="text-align: center;">
			<c:if test="${sessionScope.grade == 'A' }">
				<input type="button" name="create" value="등록" onclick="location.href='./create'" class="BBUTTON">
			</c:if>
			
			<br><br>${paging}
		</div>
	</form>
	<br>
</body>
</html>