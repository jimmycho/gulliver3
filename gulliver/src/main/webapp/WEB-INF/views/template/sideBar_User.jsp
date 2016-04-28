<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String root = request.getContextPath();
	String userid = (String)session.getAttribute("userid");
	String grade = (String)session.getAttribute("grade") ; 
%>

<html>
<head>
<link href="../../css/style1.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 상단 메뉴 -->
<div id="jb-container">
<div id="jb-sidebar">
			<br>
			<table>
				<tr>
					<td align="center" style="font-size: small; "><div style="text-align: center;">${userid }님환영합니다</div></td>
				<td><input type="button" name="logout" value="로그아웃" onclick="location.href='${pageContext.request.contextPath }/user/logout'"></td>
				</tr>
			</table>
			<br>
			<% if(userid!=null && grade.equals("M")){%>
			<table width="230" class="LTABLE">
				<tr>
					<td colspan="3" class="LTD3" align="center">마이페이지</td>
				</tr>
			</table>
			<div class="BTABLE3">
				<ul ><%-- <a  href="<%=root %>/user/MyPage"><strong>&nbsp;마이페이지</a><br></strong> --%>
					<li><a  href="<%=root %>/user/read" class="bk3">나의정보</a></li>
					<li><a  href="<%=root %>/cart/list" class="bk3">장바구니보기</a></li>
					<li><a  href="<%=root%>/order/list" class="bk3">주문이력</a></li>
				</ul><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
			</ul>
			</div>
			<%} %>
			<%if(userid!=null && grade.equals("A")){ %>
			<table width="230" class="LTABLE">
				<tr>
					<td colspan="3" class="LTD3" align="center">관리자메뉴</td>
				</tr>
			</table>
			<div class="BTABLE3">
				<ul>
					<%-- <a  href="<%=root %>/adm/adminPage"><strong>&nbsp;관리자 메뉴<br></strong> --%>
					<li><a href="<%=root%>/adm/faq/list" class="bk3">FAQ관리</a></li>
					<li><a href="<%=root%>/adm/user/list" class="bk3">회원관리</a></li>
					<li><a href="<%=root%>/adm/cart/list" class="bk3">장바구니관리</a></li>
					<li><a href="<%=root%>/order/list" class="bk3">전체주문조회</a></li>
					<li><a href="<%=root%>/adm/bookinfo/admin_bookinfoCreate" class="bk3">서적 직접등록</a></li>
					<li><a href="<%=root%>/adm/bookinfo/admin_bookinfoCreate2" class="bk3">DAUM책검색등록</a></li>
					<li><a href="<%=root%>/adm/bookinfo/admin_bookinfoList" class="bk3">서적관리</a></li>
				</ul>
				</li>
			</div>
			<%} %>
</div>
</div>
<!-- 사이드바 메뉴끝 -->