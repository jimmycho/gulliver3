<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="spring.model.bookcate.BookcateDAO,java.util.List" %>
<%@ page import="java.net.URLDecoder" %>
<% String root =request.getContextPath(); 
String userid = (String)session.getAttribute("userid");
String grade = (String)session.getAttribute("grade") ; 
%>
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
<!DOCTYPE html>
<html>
<head>
<link href="../css/style1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

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
	//alert("cText : "+cText);
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
} 
</script>

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
<script type="text/javascript">  
function inputCheck(){
	var f=document.frm1;
	if(f.userid.value==""){
		alert("아이디를 입력하여 주세요");
		f.userid.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력하여 주세요");
		f.passwd.focus();
		return false;
	}
}
</script>

</head> 

<div id="jb-container">
<div id="jb-sidebar">
<body>
<br>
<div>

	<FORM name='frm1' method='POST' action='${pageContext.request.contextPath}/user/login'
	onsubmit="return inputCheck()">
		<TABLE class="LTABLE">
		<% if(userid==null){%>
		<TR>
			<TD style="font-size: x-small; background-color: #F2F2F2;">아이디</TD>
			<TD><input type="text" name="userid" size="6"> </TD>
			<td rowspan="2">
			<c:choose>
					<c:when test="${c_id eq 'Y'}">
						<div style="font-size: x-small;">ID 저장</div>
						<input type='checkbox' name='c_id' value='Y' checked='checked'>
					</c:when>
					<c:otherwise>
						<div style="font-size: x-small;">
							ID 저장 <input type='checkbox' name='c_id' value='Y'>
						</div>
					</c:otherwise>
				</c:choose>
			<input type='submit' value='로그인' style=" height:60px; width: 60px;">
			</td>
		</TR>
		<TR>
			<TD style="font-size: x-small; background-color: #F2F2F2;;">비밀번호</TD>
			<TD><input type="password" name="passwd" size="6"></TD>
		</TR>


		<%} else {%>
		<td align="center" style="font-size: small; background-color: #F2F2F2;"><div style="text-align: center;">${userid }님환영합니다</div></td>
		<td><input type="button" name="logout" value="로그아웃" onclick="location.href='${pageContext.request.contextPath }/user/logout'"></td>
		<%} %>
		</TABLE>
		  <input type="hidden" name="faqno" value="${faqno}"> <!-- setter로 저장된 값 -->
		  <input type="hidden" name="nowPage" value="${nowPage}"> <!-- setter로 저장된 값 -->
	</FORM>
<%-- <FORM name='frm' method='POST' action='${pageContext.request.contextPath}/user/login'
onsubmit="return inputCheck()">
<table class="LTABLE"  >
<tr style="font-size: small; background-color: aqua;" >
<th>아이디</th>
<td><input type="text" name="userid" size="6" value="${c_id_val}" >
<c:choose>
						<c:when test="${c_id eq 'Y'}"> 
							<input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장
						</c:when>
						<c:otherwise>
							<input type='checkbox' name='c_id' value='Y'>ID 저장 
						</c:otherwise>
					</c:choose>
			</td>
</tr>
<tr>
<th style="font-size: small;">패스워드</th>
<td><input type="password" name="passwd" size="6" ></td>
<td rowspan="2"><input type='submit' value=로그인  ></td>
</tr>
</table>
--%>
</div>
<br>

<table width="230" class="LTABLE">
	<tr>
		<td colspan="3" class="LTD3" align="center">책 카테고리</td>
	</tr>
	</table>
	<div class="BTABLE3">
	<ul>
		<c:forEach var="dto" items="${topCateList}">
			<li>
				<a onclick="loadSubCate(${dto.BOOK_CATE_CD})" class="bk3" style='cursor: pointer'> ${dto.BOOK_CATE_NAME}</a>
				 <ul id="${dto.BOOK_CATE_CD}"><div id="cookie_div"></div></ul>
			</li>
		</c:forEach>
	</ul>
	</div>
<div align="center"><img src="../images/sideimage01.jpg">
	</div><br><br>
</div>
</div>
</body>
</html>
<!-- 상단 메뉴 끝 -->