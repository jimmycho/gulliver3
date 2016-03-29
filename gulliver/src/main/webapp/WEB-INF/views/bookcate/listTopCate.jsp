<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="spring.model.bookcate.BookcateDAO,java.util.List" %>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북카테고리(AJAX방식)</title>

<%-- <script type="text/javascript" src="<%=root%>/bookcate/httpRequest.js"></script> --%>
				
<script type="text/javascript">
//XMLHttpRequest 객체
var httpRequest = null;
 
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
//    document.write("httpRequest:"+httpRequest);
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

function loadSubCate(subCode) {
	var params="subCode="+subCode;
	//alert("params :"+params);
    sendRequest("<%=root%>/bookcate/listSubCate",params,response,"GET");
}

function response() {
	
    if (httpRequest.readyState == 4) { // 전송을 전부 받았다면
        if (httpRequest.status == 200) { // 요청한 서버 파일이 실행 됐다면
        	//alert("문제발생:"+httpRequest.status);
        	//alert("문제발생:state"+httpRequest.readyState);
            // 태그중에 "newsList"을 찾아 옵니다.
            var xmlDoc = httpRequest.responseXML;
            var SubCategoryList = xmlDoc.getElementsByTagName("SubCategory");
            //alert("SubCategoryList"+SubCategoryList);
            var subC ="";
            subC=document.getElementById("subCode");
            
            for(var i=0;i<SubCategoryList.length;i++){
            	var SubCate =SubCategoryList.item(i);
            	var code =SubCate.getElementsByTagName("code").item(0)
            			  .firstChild.nodeValue;
            	var name =SubCate.getElementsByTagName("name").item(0)
            			  .firstChild.nodeValue;
            	subC.innerHTML +="<li>"+name+"</li>";
            	//alert("subC"+subC.innerHTML);
            }
            // 서버로부터 전송된 문자열
            // div 태그의 값으로 responseText값을 할당합니다.
            //alert(message);
        }
    }
}
</script>
<script type="text/javascript">
		function btnClick() {
			alert("Button Click");
		}
</script>
<style>
.menu a {
	cursor: pointer;
	font-weight: bold;
}

.menu .hide li{
	display: none;
}
ul{
list-style-type: none;
padding-left: 0;

}
li{

padding-left: 20px }
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<ul>
	<c:forEach var="dto" items="${list}" varStatus="status">
		<li>
			<a id="" onclick="loadSubCate(${dto.BOOK_CATE_CD})" style="cursor:pointer;">${dto.BOOK_CATE_NAME }
			</a>
			<ul >
			 <div id="subCode"></div>
			 </ul>
		</li>
	</c:forEach>
</ul>
</body>
</html>