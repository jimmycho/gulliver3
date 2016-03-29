<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	final String CONTEXT = request.getContextPath();
	String pageno = "1";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=CONTEXT%>/script/lib/jQuery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=CONTEXT%>/script/lib/json/json2.js"></script>
<script type="text/javascript">
	var jsonObj = ''; 
	var pageNo = 1;  //현재 페이지
	function searchBook(paramPageNo) {
		pageNo += paramPageNo;
		if (pageNo == 0 || paramPageNo == 0)
			pageNo = 1;
		var str = $('#searchStr').val();
		var reStr = '';
		$.post(
				'./tempServer',
				{
					'str' : str,
					'pageno' : pageNo
				},
				function(obj) {
					jsonObj = JSON.parse(obj);
					reStr = 'totalCount : '
							+ jsonObj.channel.totalCount + '건중 '    //전체 검색된 수
							+ pageNo + '페이지 <br>';					 //현재 페이지
					reStr += jsonObj.channel.result +'건 반환<br />';
					for (var i = 0; i < jsonObj.channel.result; i++) {
							var tempUrl = jsonObj.channel.item[i].cover_l_url;
							if (tempUrl == '') //이미지가 없을때 보여질 (이미지준비중..)
								tempUrl = 'http://i1.daumcdn.net/img-contents/book/2010/110x160_v2.gif';
							reStr += "<tr><td>책이미지 : </td><td><img src='"+tempUrl+"' /></td></tr>";
							//reStr += jsonObj.channel.item[i].cover_s_url + '<br>';
							reStr += '<tr><td>책이름 : </td><td>' + jsonObj.channel.item[i].title + '</td></tr>';
							reStr += '<tr><td>할인가격 : </td><td>' + jsonObj.channel.item[i].sale_price + '</td></tr>';
							reStr += '<tr><td>정가 : </td><td>' + jsonObj.channel.item[i].list_price + '</td></tr>';
							reStr += '<tr><td>출판사 : </td><td>' + jsonObj.channel.item[i].pub_nm + '</td></tr>';
							reStr += '<tr><td>출판일시 : </td><td>' + jsonObj.channel.item[i].pub_date + '</td></tr>';
							reStr += '<tr><td>저자 : </td><td>' + jsonObj.channel.item[i].author_t + '</td></tr>';
							reStr += '<tr><td>번역자 : </td><td>' + jsonObj.channel.item[i].translator + '</td></tr>';
							reStr += '<tr><td>ISBN 번호 (10자리) : </td><td>' + jsonObj.channel.item[i].isbn + '</td></tr>';
							reStr += '<tr><td>ISBN 번호 (13자리) : </td><td>' + jsonObj.channel.item[i].isbn13 + '</td></tr>';
							reStr += '<tr><td>책 표지 사진명 : </td><td>' + jsonObj.channel.item[i].cover_l_url + '</td></tr>';
							reStr += '<tr><td>책 설명 : </td><td>' + jsonObj.channel.item[i].description + '</td></tr>';
					}
					reStr = reStr.replaceAll("&gt;", ">"); //&gt; 는 '>' 부등호
					reStr = reStr.replaceAll("&lt;", "<"); //&lt; 는 '<' 부등호
					$('#reDiv').html(reStr);
				});
	}

	String.prototype.trim = function() {
		return this.replace(/(^\s*)|(\s*$)/gi, "");
	};

	String.prototype.replaceAll = function(str1, str2) {
		var temp_str = this.trim();
		temp_str = temp_str.replace(eval("/" + str1 + "/gi"), str2);
		return temp_str;
	};
</script>
</head>
<body>
	<div id="searchDiv">
	도서검색
		<input type="text" id="searchStr" name="searchStr" onkeydown="if(event.keyCode == 13)searchBook(0);" /> <!-- enter키를 누르면  검색 -->
		<input type="button" value="도서검색" onclick="searchBook(0);" /> <!-- searchBook에 0을 넘겨준다 -->
	</div>
	<br>
	<table id="reDiv"></table>
<!-- 	<div id="reDiv" style="border-width:1px; border-color:gray; border-style:solid; width: 100%"></div> -->
	<div id="pageDiv">
		<a href="javascript:searchBook(-1);">이전</a> 
		<a href="javascript:searchBook(1);">이후</a>
	</div>
</body>
</html>