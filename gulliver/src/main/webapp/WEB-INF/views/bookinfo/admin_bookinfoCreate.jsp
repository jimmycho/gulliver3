<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
	final String CONTEXT = request.getContextPath();
	String pageno = "1";
	//out.print(CONTEXT + "/script/lib/jQuery/jquery-1.7.1.min.js");
	out.println( org.springframework.core.SpringVersion.getVersion());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
					//reStr += jsonObj.channel.result +'건 반환<br />';
					for (var i = 0; i < jsonObj.channel.result; i++) {
							var tempUrl = jsonObj.channel.item[i].cover_l_url;
							if (tempUrl == '') //이미지가 없을때 보여질 (이미지준비중..)
								tempUrl = 'http://i1.daumcdn.net/img-contents/book/2010/110x160_v2.gif';
							reStr += "<img src='"+tempUrl+"' /><br>";
							//reStr += jsonObj.channel.item[i].cover_s_url + '<br>';
							reStr += '책이름 : ' + jsonObj.channel.item[i].title + '<br>';
							reStr += '할인가격 : ' + jsonObj.channel.item[i].sale_price + '<br>';
							reStr += '정가 : ' + jsonObj.channel.item[i].list_price + '<br>';
							reStr += '출판사 : ' + jsonObj.channel.item[i].pub_nm + '<br>';
							reStr += '출판일시 : ' + jsonObj.channel.item[i].pub_date + '<br>';
							reStr += '저자 : ' + jsonObj.channel.item[i].author_t + '<br>';
							reStr += '번역자 : ' + jsonObj.channel.item[i].translator + '<br>';
							reStr += 'ISBN 번호 (10자리) : ' + jsonObj.channel.item[i].isbn + '<br>';
							reStr += 'ISBN 번호 (13자리) : ' + jsonObj.channel.item[i].isbn13 + '<br>';
							reStr += "책 표지 사진명 : <a href='" + jsonObj.channel.item[i].cover_l_url + "'>" + jsonObj.channel.item[i].cover_l_url + "</a><br>";
							reStr += '책 설명 : ' + jsonObj.channel.item[i].description + '<br><br>';
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
	<div style="text-align: center;">
	
	<div id="searchDiv">
	도서검색
		<input type="text" id="searchStr" name="searchStr" onkeydown="if(event.keyCode == 13)searchBook(0);" /> <!-- enter키를 누르면  검색 -->
		<input type="button" value="도서검색" onclick="searchBook(0);" /> <!-- searchBook에 0을 넘겨준다 -->
	</div>
	<br>
<!-- 	<table id="reDiv"></table> -->
	<div id="reDiv" style="border-width:1px; border-color:gray; border-style:solid; width: 100%"></div>
	<div id="pageDiv">
		<a href="javascript:searchBook(-1);">이전</a> 
		<a href="javascript:searchBook(1);">이후</a>
	</div>
	</div>
	
	<br>
	<form action="./create" method="post">
		<table align="center" border="1" cellpadding="1" cellspacing="1" style="width: 900px;">
			<tr>
				<td>책이름</td>
				<td><input name="bookname" size="30" type="text" /></td>
			</tr>
			<tr>
				<td>책표지사진명</td>
				<td><input name="bookfront_photo" size="30" type="text" /></td>
			</tr>
			<tr>
				<td>정가</td>
				<td><input name="cur_price" size="30" type="text" /></td>
			</tr>
			<tr>
				<td>할인가</td>
				<td><input name="sale_price" size="30" type="text" /></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input name="stock_cnt" size="30" type="text" /></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input name="publisher" size="30" type="text" /></td>
			</tr>
			<tr>
				<td>출판일시</td>
				<td><input name="pub_date" size="30" type="text" /></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input name="writer" size="30" type="text" /></td>
			</tr>
			<tr>
				<td>번역자</td>
				<td><input name="traductor" size="30" type="text" /></td>
			</tr>
			<tr>
				<td>ISBN10</td>
				<td><input name="ISBN10" size="30" type="text" /></td>
			</tr>
			<tr>
				<td>ISBN13</td>
				<td><input name="ISBN13" size="30" type="text" /></td>
			</tr>
			<tr>
				<td>책 분류코드</td>
				<td><input name="BOOK_CATE_CD" size="30" type="text" /></td>
			</tr>
			<tr>
				<td>책설명</td>
				<td><input name="book_explain" size="30" type="text" /></td>
			</tr>
		</table>
	
	
		<p style="text-align: center;">
			<input name="" type="button" value="취소" />&nbsp;&nbsp;
			<input type="submit" value="상품등록" />
		</p>
	</form>
</body>
</html>