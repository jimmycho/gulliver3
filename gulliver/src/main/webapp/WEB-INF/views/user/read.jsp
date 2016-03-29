<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ taglib prefix="util" uri="/ELFunctions" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%@ page import="model.member.*,utility.*"%>
<% 
MemberDTO dto=(MemberDTO)request.getAttribute("dto");
String root= request.getContextPath();
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">
function deleteM(userid,userphoto){
	if(confirm("정말탈퇴 하겠습니까?")){
	var url = "delete";
	url = url +"?userid="+userid;
	url = url +"&userphoto="+userphoto;	 
	location.href=url; 
	} 
}
function updateFile(userid,userphoto){
	var url ="updateFile"
	url = url + "?userid="+userid;
	url = url + "&userphoto="+userphoto;	 
	location.href=url;
}

function updatePW(userid){
	var url="updatePasswd?userid="+userid;
	location.href=url;
}
</script>
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<div align="center" style="font-size: xx-large;">${dto.name}의 회원님의 정보입니다
	</DIV>

	<TABLE style="width: 800px">
		<TR >
			<TD rowspan="8" align="center" width="40%"><img src="${pageContext.request.contextPath}/storage/${dto.userphoto}" style="max-width: 70%; height: auto;">
			</TD>
		
			<TH>아이디</TH>
			<TD>${dto.userid}</TD>
		</TR>
		<tr>
			<th>이름</th>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<th>회원등급</th>
			<td>${dto.grade}등급</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${dto.phone}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.email}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td colspan="2">${dto.zipcode}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="2">${dto.address1} <br> ${dto.address2}
			</td>
		</tr>
		
		<tr>
			<th>가입날짜</th>
			<td colspan="2">${dto.joindate}</td>
		</tr>
	</TABLE>

	<DIV class='bottom'>
		<input type='button' value='정보수정'
			onclick="location.href='update?id=${dto.userid}'">
		<input type='button' value='사진수정'
			onclick="updateFile('${dto.userid}','${dto.userphoto}')">
		<input type='button' value='비번수정'
			onclick="updatePW('${dto.userid}')"> <input type='button'
			value='탈퇴' onclick="deleteM('${dto.userid}','${dto.userphoto}')">
		<input type='button' value='다운로드'
			onclick="location.href='${pageContext.request.contextPath}/download?dir=/storage&filename=${dto.userphoto}'">
	</DIV>



	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
