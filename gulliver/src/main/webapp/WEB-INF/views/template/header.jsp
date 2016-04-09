<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String root = request.getContextPath();
	String userid = (String)session.getAttribute("userid");
	String grade = (String)session.getAttribute("grade") ; 
%>

<html>
<head>
<!-- <link href="../css/style1.css" rel="stylesheet" type="text/css"> --> 
<style type="text/css">
.BTABLE3{
	font-weight:bold; font-size: 10pt; COLOR: #6d6e71; LINE-HEIGHT: 160%; FONT-FAMILY: 굴림,verdana,tahoma;
}

</style>


</head>
<body> 
	<!-- 상단 메뉴 -->
<div id="jb-container">
	<div id="jb-header">
<table>
<tr align="center">
<td width="20%">
	<img style="width: 324px;"src="<%=root %>/images/gullivers_logo.jpg">
</td>
<td>
	<form action="<%=root%>/bookinfo/mainList"
		style="text-align: center; padding-bottom: 5px; padding-right: 10px;">
<!-- 		<select name="col" style="font-size: large;"> -->
<%-- 			<c:forEach var="dto" items="${topCateList}"> --%>
<!-- 				<option -->
<%-- 					<c:if test="${col == dto.BOOK_CATE_CD }">selected='selected'</c:if> --%>
<%-- 					value="${dto.BOOK_CATE_CD}">${dto.BOOK_CATE_NAME}</option> --%>
<%-- 			</c:forEach> --%>
<!-- 		</select>  -->
		<select name="col_h" style="font-size: large;">
			<option value="1000">국내도서</option>
			<option value="2000">영미도서</option>
			<option value="3000">일본도서</option>
		</select>
		<input type="text" name="word_h" value="${word_h}" style="font-size: large;"> 
		<input type="submit" value="검색" style="font-size: large;">
	</form>
</td>
<td valign=top>
		<div style="" class="BTABLE3">
			<%
				if (userid == null) {
			%>
			<a href="<%=root%>/user/agree">회원가입&nbsp;&nbsp;</a>
			<!-- <a href="#">ID/PW찾기&nbsp; &nbsp; </a> -->
			<%
				} else {
					if (grade.equals("M")) {
			%>
			<a href="<%=root%>/user/logout">로그아웃</a> / <a
				href="<%=root%>/user/MyPage">마이페이지&nbsp;</a>
			<%
				} else if (grade.equals("A")) {
			%>
			<a href="<%=root%>/user/logout">로그아웃</a> / <a
				href="<%=root%>/adm/adminPage">관리자메뉴</a>
			<%
				}
				}
			%>
		</div> </td>

		</tr>
	</table>
<nav id="topMenu">
		<ul>
			<li class="topMenuLi"><a class="menuLink" href="<%=root %>/">H O M E</a>
			</li>
			<li>|</li>
			<li class="topMenuLi" ><a class="menuLink" href="<%=root%>/notice/list">공지사항</a>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="<%=root %>/faq/list">FAQ</a>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="#">오시는길</a>
			</li>		
		</ul>
	</nav>
</ul>
</div>
