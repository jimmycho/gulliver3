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

<script type="text/javascript">
var xmlDoc = null;
var xslDoc = null;
function loadSubCate(subCode) {
	var params="subCode="+subCode;
    sendRequest("<%=root%>/bookcate/listSubCate",params,response,"GET");
}
function response(subCode) {
    if (httpRequest.readyState == 4) { // 전송을 전부 받았다면
        if (httpRequest.status == 200) { // 요청한 서버 파일이 실행 됐다면
            var xmlDoc = httpRequest.responseXML;
            var SubCategoryList = xmlDoc.getElementsByTagName("SubCategory");            
            if(SubCategoryList.item(0)==null) alert("마지막 카테고리입니다 !");
            var parCode = SubCategoryList.item(0).getElementsByTagName("parent_code").item(0)
            				.firstChild.nodeValue;
           
            var topC=document.getElementById(parCode); 
            topC.innerHTML="";
            for(var i=0;i<SubCategoryList.length;i++){
            	var SubCate =SubCategoryList.item(i);
            	var name =SubCate.getElementsByTagName("name").item(0).firstChild.nodeValue;
            
            	var code =SubCate.getElementsByTagName("code").item(0).firstChild.nodeValue;
            	//alert("name:code"+name+code) ;
            	topC.innerHTML +="<option><a onclick='loadSubCate("+code+")' style='cursor: pointer;'></a>";
            	 //topC.innerHTML += name;   
            	 topC.innerHTML +="</option>"+"\n";
            	 
            }
            //alert(topC.innerHTML);
           }}}
</script> 
</head>
<body> 
	<!-- 상단 메뉴 -->
<div id="jb-container">
	<div id="jb-header"><br>
		<div style="text-align: right;" class="BTABLE3">
			<% if(userid==null){%>
				<a href="<%=root %>/user/agree">회원가입&nbsp;&nbsp;</a>
				<!-- <a href="#">ID/PW찾기&nbsp; &nbsp; </a> -->
			<% } else { 
				if(grade.equals("M")){
			%>
				<a href="<%=root %>/user/logout">로그아웃</a> /
				<a href="<%=root %>/user/MyPage">마이페이지&nbsp;</a>
			<%} else if(grade.equals("A")){ %>
				<a href="<%=root %>/user/logout">로그아웃</a> /
				<a href="<%=root %>/adm/adminPage">관리자메뉴</a>
			<%} }%>
		</div>
	
		<br><br>
		<form action="<%=root %>/bookinfo/mainList" style="text-align: right; padding-bottom: 5px ;padding-right:10px;">
			<select name="col" style="font-size: large;">
				<c:forEach var="dto" items="${topCateList}">
				<c:set var="i" value="${i+1}"/>
					<option <c:if test="${col == dto.BOOK_CATE_CD }">selected='selected'</c:if> value="${dto.BOOK_CATE_CD}"> ${dto.BOOK_CATE_NAME}</option>
				</c:forEach>
			</select> 
		<input type="text" name="word" value="${word}" style="font-size: large;">
		<input type="submit" value="검색" style="font-size: large;">
		</form>
		<ul>
		
		
		
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
