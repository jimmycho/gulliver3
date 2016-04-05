<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String root = request.getContextPath();
	String userid = (String)session.getAttribute("userid");
	String grade = (String)session.getAttribute("grade") ; 
%>

<html>
<head>

</head>
<body>
	<!-- 상단 메뉴 -->
<div id="jb-container">
<div id="jb-sidebar">
			
			<% if(userid!=null && grade.equals("M")){%>
				<ul ><a  href="<%=root %>/user/MyPage"><strong>&nbsp;마이페이지</a><br></strong>
					<li><a  href="<%=root %>/user/read">나의정보</a></li>
					<li><a  href="<%=root %>/cart/list">장바구니보기</a></li>
					<li><a  href="<%=root%>/order/list">주문이력</a></li>
				</ul>
			</ul>
			<%} %>
			<%if(userid!=null && grade.equals("A")){ %>
				<ul><a  href="<%=root %>/adm/adminPage"><strong>&nbsp;관리자 메뉴<br></strong>
					<li><a href="<%=root%>/adm/faq/list">FAQ관리</a></li>
					<li><a href="<%=root%>/adm/user/list">회원관리</a></li>
					<li><a href="<%=root%>/adm/cart/list">장바구니관리</a></li>
					<li><a href="<%=root%>/order/list">전체주문조회</a></li>
					<li><a href="<%=root%>/adm/bookinfo/admin_bookinfoCreate">서적등록</a></li>
					<li><a href="<%=root%>/adm/bookinfo/admin_bookinfoList">서적관리</a></li>
				</ul>
				</li>
			<%} %>
</div>
</div>
<!-- 사이드바 메뉴끝 -->