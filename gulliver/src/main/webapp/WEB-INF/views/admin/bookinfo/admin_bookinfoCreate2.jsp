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
<link href="../../css/style1.css" rel="stylesheet" type="text/css">
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
	var titleStr = '';
	
	$.post(
			'tempServer',
			{
				'str' : str,
				'pageno' : pageNo
			},
			function(obj) {
				jsonObj = JSON.parse(obj);
				reStr = '<div align="center">총 '
						+ jsonObj.channel.totalCount + '건중 '    //전체 검색된 수
						+ pageNo + '페이지 중';					 //현재 페이지
				reStr += jsonObj.channel.result +'건</div>';
				for (var i = 0; i < jsonObj.channel.result; i++) {
						var tempUrl = jsonObj.channel.item[i].cover_l_url;
						if (tempUrl == '') //이미지가 없을때 보여질 (이미지준비중..)
							tempUrl = 'http://i1.daumcdn.net/img-contents/book/2010/110x160_v2.gif';
						
						var reStrQ="INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,";
						reStrQ+="stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)";
						reStrQ+="VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),";
						
						reStr += "<table class='BTABLE' style='width: 100%'><tr><td style='width: 40%' rowspan='7' align='center'><img src='"+tempUrl+"' /></td>";
						//reStr += jsonObj.channel.item[i].cover_s_url + '<br>';
						document.getElementById("cImageURL").innerHTML="<img src='"+tempUrl+"' />";
						reStr += '<td  class="BTD2" style="width: 200px">서명</td><td >' + jsonObj.channel.item[i].title + '</td></tr>';							
						titleStr=jsonObj.channel.item[i].title;
						titleStr=titleStr.replaceAll("&gt;", ">");
						titleStr=titleStr.replaceAll("&lt;", "<");
						document.getElementById("daum_bookname").value=titleStr;
						//reStrQ+="'"+ jsonObj.channel.item[i].title +"',";
						
						reStr += '<tr><td  class="BTD2">저자 </td><td>' + jsonObj.channel.item[i].author_t + '</td></tr>';
						document.getElementById("daum_writer").value=jsonObj.channel.item[i].author_t;
						//reStrQ+="'"+ jsonObj.channel.item[i].author_t +"',";
						
						reStr += '<tr><td  class="BTD2">번역자</td><td>' + jsonObj.channel.item[i].translator + '</td></tr>';
						document.getElementById("daum_traductor").value=jsonObj.channel.item[i].translator;
						//reStrQ+="'"+ jsonObj.channel.item[i].translator +"', sysdate);<br>";
						
						reStr += '<tr><td  class="BTD2">출판사</td><td>' + jsonObj.channel.item[i].pub_nm + '</td></tr>';
						document.getElementById("daum_publisher").value=jsonObj.channel.item[i].pub_nm;
						//reStrQ+="'"+ jsonObj.channel.item[i].pub_nm +"',";
						
						reStr += '<tr><td  class="BTD2">출판일</td><td>' + jsonObj.channel.item[i].pub_date + '</td></tr>';
						document.getElementById("daum_pub_date").value=jsonObj.channel.item[i].pub_date;
						//reStrQ+="'"+ jsonObj.channel.item[i].pub_date +"',1101,";
						
						reStr += '<tr><td  class="BTD2">정가</td><td>' + jsonObj.channel.item[i].list_price + '</td></tr>';
						document.getElementById("daum_cur_price").value=jsonObj.channel.item[i].list_price;
						//reStrQ+= jsonObj.channel.item[i].list_price +",";
						
						reStr += '<tr><td  class="BTD2">할인가격</td><td>' + jsonObj.channel.item[i].sale_price + '</td></tr>';
						document.getElementById("daum_sale_price").value=jsonObj.channel.item[i].sale_price;
						//reStrQ+= jsonObj.channel.item[i].sale_price +",";
						
						reStr += '<tr><td  class="BTD2">개요</td><td colspan="2" >' + jsonObj.channel.item[i].description + '</td></tr>';
						document.getElementById("daum_book_explain").value=jsonObj.channel.item[i].description;
						//reStrQ+="'"+ jsonObj.channel.item[i].description +"',";
						
						reStr += "<tr><td  class='BTD2'>책 표지 사진명 </td><td colspan='2'> <a href='" + jsonObj.channel.item[i].cover_l_url + "'>" + jsonObj.channel.item[i].cover_l_url + "</td></tr>";
						
						document.getElementById("daum_bookfront_photo").value=jsonObj.channel.item[i].cover_l_url;
						//reStrQ+="'"+ jsonObj.channel.item[i].cover_l_url +"',";
						                         
						reStr += '<tr><td  class="BTD2">ISBN 10</td><td colspan="2" >' + jsonObj.channel.item[i].isbn + '</td></tr>';
						document.getElementById("daum_ISBN10").value=jsonObj.channel.item[i].isbn;
						//reStrQ+=jsonObj.channel.item[i].isbn +",";
						
						reStr += '<tr><td  class="BTD2">ISBN 13</td><td colspan="2" >' + jsonObj.channel.item[i].isbn13 + '</td></tr></table><br>';
						document.getElementById("daum_ISBN13").value=jsonObj.channel.item[i].isbn13;
						//reStrQ+=jsonObj.channel.item[i].isbn13 +",30,";
						
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
	<h2 align="center">DAUM 책 정보 검색</h2>
	<div id="searchDiv" align="center">
		<input type="text" id="searchStr" name="searchStr" onkeydown="if(event.keyCode == 13)searchBook(0);" /> <!-- enter키를 누르면  검색 -->
		<input type="button" value="도서검색" onclick="searchBook(0);" /> <!-- searchBook에 0을 넘겨준다 -->
	 
		<a href="javascript:searchBook(-1);">이전&nbsp;</a> &nbsp;
		<a href="javascript:searchBook(1);">다음 </a>
	</div>
<!-- 	<div id="reDiv" style="border-width:0px; border-color:gray; border-style:solid; width: 100%">
	</div> -->
<!-- 	<div id="reDivQ" style="border-width:1px; border-color:gray; border-style:solid; width: 100%">
	</div> -->
	
<form action="./admin_bookinfoCreate" method="post">
		<table align="center" border="1" style="width: 600px" class="BTABLE">
			<tr>
				<td rowspan='7' width="150"><div id="cImageURL"></div></td>
				<td align="center" class="BTD2">서명</td>
				<td><input id="daum_bookname" name="bookname" size="50" type="text" /></td>
			</tr>
			<tr>
				<td align="center" class="BTD2">저자</td>
				<td><input id="daum_writer" name="writer" size="50" type="text" /></td>
			</tr>
			<tr>
				<td align="center" class="BTD2">번역자</td>
				<td><input id="daum_traductor" name="traductor" size="50" type="text" /></td>
			</tr>
			<tr>
				<td align="center" class="BTD2">출판사</td>
				<td><input id="daum_publisher" name="publisher" size="50" type="text" /></td>
			</tr>
			<tr>
				<td align="center" class="BTD2" >출판일</td>
				<td><input id="daum_pub_date" name="pub_date" size="50" type="text" /></td>
			</tr>
			<tr>
				<td align="center" class="BTD2">정가</td>
				<td><input id="daum_cur_price" name="cur_price" size="50" type="text" /></td>
			</tr>
			<tr>
				<td align="center" class="BTD2">할인가</td>
				<td><input id="daum_sale_price" name="sale_price" size="50" type="text" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="BTD2">개요</td>
				<td><input id="daum_book_explain" name="book_explain" size="50" style="height: 80px;"  type="text" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="BTD2">커버이미지 URL</td>
				<td><input id="daum_bookfront_photo" name="bookfront_photo" size="50" type="text" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="BTD2">ISBN10</td>
				<td><input id="daum_ISBN10" name="ISBN10" size="50" type="text" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="BTD2">ISBN13</td>
				<td><input id="daum_ISBN13" name="ISBN13" size="50" type="text" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="BTD2">책 분류코드</td>
				<td><input name="BOOK_CATE_CD" size="50" type="text" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="BTD2">재고수량</td>
				<td><input name="stock_cnt" size="50" type="number" /></td>
			</tr>
		</table>
		<p style="text-align: center;">
			<input name="" type="button" value="취소" onclick="history.back()" class="BBUTTON"/>&nbsp;&nbsp;
			<input type="submit" value="상품등록" class="BBUTTON"/>
		</p>
	</form>
</body>
</html>