<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	final String CONTEXT = request.getContextPath();
	String pageno = "1";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 책정보 검색</title>
<link href="../css/style1.css" rel="stylesheet" type="text/css">
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
				'tempServer',
				{
					'str' : str,
					'pageno' : pageNo
				},
				function(obj) {
					jsonObj = JSON.parse(obj);
					reStr = '총 '
							+ jsonObj.channel.totalCount + '건중 '    //전체 검색된 수
							+ pageNo + '페이지 <br>';					 //현재 페이지
					reStr += jsonObj.channel.result +'건 반환<br />';
					for (var i = 0; i < jsonObj.channel.result; i++) {
							var tempUrl = jsonObj.channel.item[i].cover_l_url;
							if (tempUrl == '') //이미지가 없을때 보여질 (이미지준비중..)
								tempUrl = 'http://i1.daumcdn.net/img-contents/book/2010/110x160_v2.gif';
							
							var reStrQ="INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,";
							reStrQ+="stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)";
							reStrQ+="VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),";
							
							reStr += "<table border='1'><tr><td rowspan='5' valign='top'><img src='"+tempUrl+"' /></td>";
							//reStr += jsonObj.channel.item[i].cover_s_url + '<br>';
							
							reStr += '<td >책이름</td><td>' + jsonObj.channel.item[i].title + '</td></tr>';							
							//reStrQ+="'"+ jsonObj.channel.item[i].title +"',";
							
							reStr += '<tr><td>할인가격</td><td>' + jsonObj.channel.item[i].sale_price + '</td></tr>';
							//reStrQ+= jsonObj.channel.item[i].sale_price +",";
							
							reStr += "<tr><td>책 표지 사진명 </td><td> <a href='" + jsonObj.channel.item[i].cover_l_url + "'>" + jsonObj.channel.item[i].cover_l_url + "</td></tr>";
							//reStrQ+="'"+ jsonObj.channel.item[i].cover_l_url +"',";
							
							reStr += '<tr><td>책 설명</td><td>' + jsonObj.channel.item[i].description + '</td></tr>';
							//reStrQ+="'"+ jsonObj.channel.item[i].description +"',";
							
							reStr += '<tr><td>ISBN 10</td><td>' + jsonObj.channel.item[i].isbn + '</td></tr>';
							//reStrQ+=jsonObj.channel.item[i].isbn +",";
							
							reStr += '<tr><td>ISBN 13</td><td>' + jsonObj.channel.item[i].isbn13 + '</td></tr>';
							//reStrQ+=jsonObj.channel.item[i].isbn13 +",30,";
							
							reStr += '<tr><td>정가</td><td>' + jsonObj.channel.item[i].list_price + '</td></tr>';
							reStrQ+= jsonObj.channel.item[i].list_price +",";
							
							reStr += '<tr><td>출판사</td><td>' + jsonObj.channel.item[i].pub_nm + '</td></tr>';
							reStrQ+="'"+ jsonObj.channel.item[i].pub_nm +"',";
							
							reStr += '<tr><td>출판일시</td><td>' + jsonObj.channel.item[i].pub_date + '</td></tr>';
							reStrQ+="'"+ jsonObj.channel.item[i].pub_date +"',1101,";
							
							reStr += '<tr><td>저자 </td><td>' + jsonObj.channel.item[i].author_t + '</td></tr>';
							reStrQ+="'"+ jsonObj.channel.item[i].author_t +"',";
							
							reStr += '<tr><td>번역자</td><td>' + jsonObj.channel.item[i].translator + '</td></tr></table><br>';
							reStrQ+="'"+ jsonObj.channel.item[i].translator +"', sysdate);<br>";
							
							reStr = reStr.replaceAll("&gt;", ">"); //&gt; 는 '>' 부등호
							reStr = reStr.replaceAll("&lt;", "<"); //&lt; 는 '<' 부등호
							$('#reDiv').html(reStr);
							//$('#reDivQ').html(reStrQ);
							
					}
					
					
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
	<h3>DAUM 책 정보 검색</h3>
	<div id="searchDiv">
		<input type="text" id="searchStr" name="searchStr" onkeydown="if(event.keyCode == 13)searchBook(0);" /> <!-- enter키를 누르면  검색 -->
		<input type="button" value="도서검색" onclick="searchBook(0);" /> <!-- searchBook에 0을 넘겨준다 -->
	<div id="pageDiv">
		<a href="javascript:searchBook(-1);">이전페이지</a> 
		<a href="javascript:searchBook(1);">다음페이지</a>
	</div>
	</div>
	<div id="reDiv" style="border-width:0px; border-color:gray; border-style:solid; width: 100%">
	</div>
<!-- 	<div id="reDivQ" style="border-width:1px; border-color:gray; border-style:solid; width: 100%">
	</div> -->
	
</body>
</html>