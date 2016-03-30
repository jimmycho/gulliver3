<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page import="model.member.*,java.util.*,utility.*"%>
<% 
   String col=(String)request.getAttribute("col");
   String word=(String)request.getAttribute("word");
   String paging=(String)request.getAttribute("paging");
   List<MemberDTO> list=(List)request.getAttribute("list");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

</style>
<!-- <link href='../css/style.css' rel='Stylesheet' type='text/css'> -->
</head>

<body>
	<DIV align="center" style="font-size: xx-large;">회원 목록</DIV>
	<DIV align="center">
		<FORM method="POST" action="./list">
			<select name="col">
				<option value="name"<c:if test="${col=='name'}">selected='selected'</c:if>>성명</option>
				<option value="email"<c:if test="${col=='email'}">selected='selected'</c:if>>이메일</option>
				<option value="userid"<c:if test="${col=='userid'}">selected='selected'</c:if>>아이디</option>
				<option value="total" <c:if test="${col=='total'}">selected='selected'</c:if>>전체출력</option>
			</select> 
			<input type="text" name="word" value="${word }"> 
			<input type="submit" value="검색" />
		</FORM>
		
	</DIV>
<%-- 	<%
for(int i=0; i < list.size(); i++){ 
  MemberDTO dto = list.get(i);   
%> --%>

<c:forEach var="dto" items="${list }" >
	<TABLE border='1' align='center' width='70%'>
		<TR>
			<TD rowspan='4' width='20%' align="center">
			<IMG src='${pageContext.request.contextPath}/storage/${dto.userphoto}' width='100%'></TD>
			<TH width='20%'>아이디</TH>
			<TD ><A href='../user/read?id=${dto.userid}'>${dto.userid}</A></TD>

			<TH width='20%'>성명</TH>
			<TD>${dto.name}</TD>
		</TR>
		<TR>
			<TH>전화번호</TH>
			<TD>${dto.phone}</TD>
		
			<TH width='20%'>이메일</TH>
			<TD>${dto.email}</TD>
		</TR>
		<TR>
			<TH>주소</TH>
			<TD colspan="3">${dto.address1} 
		<%-- 	<% if (dto.getAddress2() != null){
             out.print(dto.getAddress2());
           }%> --%>
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
	</DIV>
	<div align="center">
	<input type='button' value='회원 등록' onclick="location.href='../user/agree'">
	</div>
</body>
</html>