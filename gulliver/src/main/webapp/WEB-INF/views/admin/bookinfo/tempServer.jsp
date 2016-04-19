<%@ page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%
  request.setCharacterEncoding("utf-8");
  String str = request.getParameter("str");
  String pageno = request.getParameter("pageno");  
  //str = URLEncoder.encode(str,"utf-8");
  System.out.println(str); //검색어
  //String url = "http://apis.daum.net/search/book?result=1&q="+str+"&apikey=b3db9e526249b7b3d7a74a760507ac2e&output=json&pageno="+pageno;
  String url = "http://apis.daum.net/search/book?result=1&q="+str+"&apikey=d5119334ed5ac02f53d56946ff1861b8&output=json&pageno="+pageno;
%>
<c:import url= "<%=url%>" charEncoding="utf-8">
</c:import>