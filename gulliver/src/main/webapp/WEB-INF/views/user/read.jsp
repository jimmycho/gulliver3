<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link href="../css/style1.css" rel="stylesheet" type="text/css">
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
<body leftmargin="0" topmargin="0">
		<div  height="23" colspan="10" align="center" ><img style="width: 753px; " src="../images/userInfo.jpg">  
		<table class="BTABLE" style="width:800px;">
			<tr>
				<td class="BTD" height="20" colspan="3" align="center"><strong>${dto.name}회원님의
						정보입니다</strong></td>
			</tr>
			<TR>
				<TD rowspan="8" align="center" width="40%"><img
					src="${pageContext.request.contextPath}/storage/${dto.userphoto}"
					style="max-width: 70%; height: auto;"></TD>

				<td height="20" class="BTD2">아이디</td>
				<TD>${dto.userid}</TD>
			</TR>
			<tr>
				<td height="20" class="BTD2">이름</td>
				<td>${dto.name}</td>
			</tr>
			<tr>
				<td height="20" class="BTD2">회원등급</td>
				<td>${dto.grade}등급</td>
			</tr>
			<tr>
				<td height="20" class="BTD2">전화번호</td>
				<td>${dto.phone}</td>
			</tr>
			<tr>
				<td height="20" class="BTD2">이메일</td>
				<td>${dto.email}</td>
			</tr>
			<tr>
				<td height="20" class="BTD2">우편번호</td>
				<td colspan="2">${dto.zipcode}</td>
			</tr>
			<tr>
				<td height="20" class="BTD2">주소</td>
				<td colspan="2">${dto.address1}&nbsp; ${dto.address2}
				</td>
			</tr>

			<tr>
				<td height="20" class="BTD2">가입날짜</td>
				<td colspan="2">${dto.joindate}</td>
			</tr>
		</table>

		<DIV class='bottom'>
		<input type='button' value='정보수정'
			onclick="location.href='update?id=${dto.userid}'" class="BBUTTON">
		<input type='button' value='사진수정'
			onclick="updateFile('${dto.userid}','${dto.userphoto}')" class="BBUTTON">
		<input type='button' value='비번수정'
			onclick='#'<%-- "updatePW('${dto.userid}')" --%> class="BBUTTON"> 
		<input type='button' value='탈퇴' 
			onclick="deleteM('${dto.userid}','${dto.userphoto}')" class="BBUTTON">
		<input type='button' value='사진다운로드'  class="BBUTTON"
			onclick="location.href='${pageContext.request.contextPath}/download?dir=/storage&filename=${dto.userphoto}'">
	</DIV>



	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
