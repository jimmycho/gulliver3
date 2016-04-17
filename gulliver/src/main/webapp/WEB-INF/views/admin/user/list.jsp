<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

</style>
<link href='../../css/style1.css' rel='Stylesheet' type='text/css'>
</head>
<body>
	<div height="23" colspan="10" align="center">
		<img style="width: 753px;" src="../../images/adminUser.jpg">
		
	</div><br>
	<DIV align="center">
		<FORM method="POST" action="./list">
			<select name="col">
				<option value="total" <c:if test="${col=='total'}">selected='selected'</c:if>>전체회원보기</option>
				<option value="userid"<c:if test="${col=='userid'}">selected='selected'</c:if>>아이디검색</option>
				<option value="name"<c:if test="${col=='name'}">selected='selected'</c:if>>성명검색</option>
				<option value="email"<c:if test="${col=='email'}">selected='selected'</c:if>>이메일검색</option>
				
				
			</select> 
			<input type="text" name="word" value="${word }"> 
			<input type="submit" value="검색" />
		</FORM>
	</DIV><br>
<c:forEach var="dto" items="${list }" >
	<TABLE class="BTABLE" width="800px" border="0">
		<TR>
			<TD rowspan='3' width='120px' align="center">
			<IMG src='${pageContext.request.contextPath}/storage/${dto.userphoto}' width='100px'></TD>
			<TD align="center" class="BTD2" width='150px' height="23">아이디</TD>
			<TD width='200px'><A href='./read?userid=${dto.userid} '>${dto.userid}</A></TD>
			<TD align="center" class="BTD2" height="23">성명</TD>
			<TD>${dto.name}</TD>
		</TR>
		<TR>
			<TD align="center" class="BTD2" height="23">전화번호</TH>
			<TD>${dto.phone}</TD>
			<TD align="center" class="BTD2" height="23">이메일</TD>
			<TD>${dto.email}</TD>
		</TR>
		<TR>
			<TD align="center" class="BTD2" height="23">주소</TD>
			<TD colspan="3">${dto.address1} 
           <c:if test="${not empty dto.address2 }">${dto.address2}</c:if>
           </TD>
		</TR>

	</TABLE>
	<BR>
	</c:forEach>
<%-- 	<% 
} 
%> --%>
	<DIV class="bottom">
		${paging}
	</DIV><br>
</body>
</html>