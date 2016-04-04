<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="spring.model.bookcate.BookcateDAO,java.util.List" %>
<%@ page import="java.net.URLDecoder" %>
<% String root =request.getContextPath(); %>
<% 
/* 	Cookie[] cookies=request.getCookies();
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){
			out.println("i:"+(i+1));
			if(cookies[i].getName().equals("ListHTML")) {
				out.println(cookies[i].getName());
			}
	   }
	} */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북카테고리(AJAX방식)</title>
<%-- <script type="text/javascript">
window.onload=function(){
	
	<%=ListHTML %>;
}
</script> --%>
<style>
.menu a {
	cursor: pointer;
	font-weight: bold;}
.menu .hide li{
	display: none;}
ul{
list-style-type: none;
padding-left: 0;}
li{
padding-left: 20px }
</style>		
<style>
#jb-container {
	width: 1200px;
	margin: 0px auto;
	padding: 2px;
	border: 1px solid #ffffff;
	margin: 0px auto;
}

#jb-header {
	padding: 20px;
	margin-bottom: 10px;
	border: 1px solid #bcbcbc;
}

#jb-sidebar {
	width: 235px;
	padding: 0px;
	margin-bottom: 10px;
	float: left;
	border: 1px solid #bcbcbc;
}

#jb-content {
	width: 950px;
	padding: 0px;
	margin-bottom: 10px;
	float: right;
	border: 1px solid #bcbcbc;
}

#jb-footer {
	clear: both;
	padding: 2px;
	border: 1px solid #bcbcbc;
	background-color: #009AFF
}
.LTABLE{
	FONT-SIZE: 10.5pt; COLOR: #6d6e71; LINE-HEIGHT: 160%; FONT-FAMILY: Yoon ����� 530_TT,verdana,tahoma;
	BORDER:0; BACKGROUND-COLOR:#f1f1f1;
}
</style>	
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script>	 -->

<script type="text/javascript">
//XMLHttpRequest 객체
function ReadCookie(cName)
{
   cName=cName+'=';
   var cookieData = document.cookie;
   // Get all the cookies pairs in an array
   var start=cookieData.indexOf(cName);
   var cValue='';
   if(start !=-1){
	   start +=cName.length;
	   var end=cookieData.indexOf(';',start);
	   if(end==-1) end=cookieData.length;
	   cValue=cookieData.substring(start,end);
   }
   return cValue;
}
var httpRequest = null;
var cText="";
//if(cText=="" &&  )
//alert("readCookie: "+rCookie);
var rC=ReadCookie('subCategory');

window.onload= function()
{
	//alert("rC : "+rC);
	///alert("cText : "+cText);
	if(rC!=null && cText =="") 
	{
		var cdiv=document.getElementById("cookie_div"); 
		cdiv.innerHTML=rC;
	} 
}
// url: 요청 주소 
// params: 서버로 보내는 값의 목록
// response_function_name: 응답 결과를 처리할 함수 
// method: GET, POST인지 결정
function sendRequest(url, params, response_function_name, method) {
//alert("params in js file:"+params);
 //1.객체생성
	if (window.XMLHttpRequest) {
	// code for modern browsers
	httpRequest = new XMLHttpRequest();
	} else {
	// code for IE6, IE5
	httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}
 //2. 함수연결
//document.write("httpRequest:"+httpRequest);
    // 소문자로 변경
    httpMethod = method.toLowerCase();
    
    // 전송 값이 있는지 검사
    var httpParams = (params == null || params == '') ? null : params;
    var httpUrl = url;
    
    // GET방식이면 GET 방식으로 조합
    if (httpMethod == 'get' && httpParams != null) {
        httpUrl = httpUrl + "?" + httpParams;
    }
    //alert("httpUrl:"+httpUrl);
    //alert("response function:"+response_function_name);
 //3. 오픈   
    // 서버로 연결
    httpRequest.open(httpMethod, httpUrl, true);
    
    // 내용 타입 지정
    httpRequest.setRequestHeader(
        'Content-Type', 'application/x-www-form-urlencoded');
    // 응답을 처리할 함수 지정    
    httpRequest.onreadystatechange = response_function_name;
//4.send    
    // 전송 방식이 POST이면 파라미터 전송
    // GET 방식이면 null 지정
    httpRequest.send(httpMethod == 'post' ? httpParams : null);
}
 
// 실행 결과를 출력, Debugging
function log(msg) {
    var console = document.getElementById("debugConsole");//div tag
    
    if (console != null) {
        console.innerHTML += msg +"<br/>";
    }
}
 
// 태그를 보여줌
function show(elementId) {
    var element = document.getElementById(elementId);
    if (element) {
        element.style.display = '';
    }
}
// 태그를 숨김
function hide(elementId) {
    var element = document.getElementById(elementId);
    if (element) {
        element.style.display = 'none';
    }
} </script>
<script type="text/javascript">
var xmlDoc = null;
var xslDoc = null;
var subCateCode;
function loadSubCate(subCode) {
	var params="subCode="+subCode;
	subCateCode=subCode;
    sendRequest("<%=root%>/bookcate/listSubCate",params,response,"GET");
}
function response() {

if (httpRequest.readyState == 4) { // 전송을 전부 받았다면
    if (httpRequest.status == 200) { // 요청한 서버 파일이 실행 됐다면
        var xmlDoc = httpRequest.responseXML;
        var SubCategoryList = xmlDoc.getElementsByTagName("SubCategory");  
        ////////////////////////////////////////////
        if(SubCategoryList.item(0)==null) {
           	var url="<%=root%>/bookinfo/list?BOOK_CATE_CD="; 
           	url+=subCateCode;
            location.href = url;  
           } 
        ////////////////////////////////////////////
        var parCode = SubCategoryList.item(0).getElementsByTagName("parent_code").item(0)
        				.firstChild.nodeValue;
        var topC=document.getElementById(parCode); 
        topC.innerHTML="";
        for(var i=0;i<SubCategoryList.length;i++){
        	
        	var SubCate =SubCategoryList.item(i);
        	var name =SubCate.getElementsByTagName("name").item(0).firstChild.nodeValue;
        	var code =SubCate.getElementsByTagName("code").item(0).firstChild.nodeValue;
        	
        	topC.innerHTML +="<li><a onclick='loadSubCate("+code+")' style='cursor: pointer'>└"+name+"</a><ul id='"+code+"'>";
        	topC.innerHTML +="</ul></li>";
        	
        } 
        cText+=topC.innerHTML;
        
        WriteCookie('subCategory',cText);
        //ReadCookie('subCategory');
       }}}
</script> 
<script type="text/javascript">
function WriteCookie(cName,cValue)
{
	var cookies = cName + '=' + cValue+';';
	document.cookie=cookies;
    //alert("subCate in WriteCookie(): " + cookievalue );
}

</script>
</head> 

<div id="jb-container">
<div id="jb-sidebar">
<br>
<div >
<table class="LTABLE"  >
<form action="">
<tr style="font-size: small; background-color: aqua;" >
<td >
아이디</td><td><input type="text" size="6" value="id"/></td>

<td rowspan="2"><input type=submit style=width:50pt;height:50pt; value=로그인 /></td>
</tr>
<tr>
<td style="font-size: small;">
패스워드</td><td><input type="text" size="6" value="passwd"/>
</td>
</tr>
</table>
</form>
</div>
	<ul>
		<c:forEach var="dto" items="${topCateList}">
			<li>
				<a onclick="loadSubCate(${dto.BOOK_CATE_CD})"style="cursor: pointer;"><strong>
				 ${dto.BOOK_CATE_NAME} </strong></a>
				 <ul id="${dto.BOOK_CATE_CD}"><div id="cookie_div"></div></ul>
			</li>
		</c:forEach>
	</ul>
<div align="center"><img   src="../images/sideimage01.jpg">
	</div>
</div>
<input type="button" value="쿠키읽기" onclick="ReadCookie('subCategory')"/>
<input type="button" value="쿠키지우기" onclick="WriteCookie('subCategory','')"/>
</div>

<!-- 상단 메뉴 끝 -->