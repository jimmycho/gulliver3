<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
.rcreate{
  font-size: 20px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 780px;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}

.rlist{
  line-height:1.2em;
  font-size: 15px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 780px;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}

hr{
  text-align: center;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  width: 45%;            /* 화면의 30% */ 
}
 
 
</style>  

<script type="text/javascript">
function checkLogin(userid){
	if(userid==null) alert("로그인 상태에서 이용가능합니다.")	;
	return false;	
}

$(function() {
    $('.remaining').each(function() {
        // count 정보 및 count 정보와 관련된 textarea/input 요소를 찾아내서 변수에 저장한다.
        var $count = $('.count', this);
        var $input = $(this).prev();
        // .text()가 문자열을 반환하기에 이 문자를 숫자로 만들기 위해 1을 곱한다.
        var maximumCount = $count.text() * 1;
        // update 함수는 keyup, paste, input 이벤트에서 호출한다.
        var update = function() {
            var before = $count.text() * 1;
            var now = maximumCount - $input.val().length;
            // 사용자가 입력한 값이 제한 값을 초과하는지를 검사한다.
            if (now < 0) {
                var str = $input.val();
                alert('글자 입력수가 초과하였습니다.');
                $input.val(str.substr(0, maximumCount));
                now = 0;
            }
            // 필요한 경우 DOM을 수정한다.
            if (before != now) {
                $count.text(now);
            }
        };
        // input, keyup, paste 이벤트와 update 함수를 바인드한다
        $input.bind('input keyup paste', function() {
            setTimeout(update, 0)
        });
        update();
    });
});



function rcheck(tarea){
	if('${sessionScope.userid}'==""){
		if(confirm("로그인후 댓글를 쓰세요")){
		var url = "../user/login";
		location.href=url;
		}else{
			tarea.blur();
		}
	}
}

function input(f){
	if('${sessionScope.userid}'==""){
	if(confirm("로그인후 댓글를 쓰세요")){
	var url = "../user/login";

	location.href=url;
	return false;
	}else{
	 
	return false;
	}
	}else if(f.say100ja.value==""){
	alert("댓글 내용을 입력하세요.");
	f.say100ja.focus();
	return false;
	}
	}

//댓글 수정
//value 값들을 textarea에 넣어서 submit 시킨다
function cupdate(seq, say100ja, star_cnt){
	var f = document.frm2;
	f.say100ja.value = say100ja;
	f.star_cnt.value = star_cnt;
	f.seq.value = seq;
	f.csubmit.value="수 정";
	f.action="./cupdate"
	}
	
	
function cdelete(seq){
	if(confirm("정말삭제 하겠습니까?")){ 
		var url = "./cdelete?seq=" + seq;
		url = url + "&bookid=${bookid}";
		url = url + "&nPage=${nPage}";
		url = url + "&nowPage=${param.nowPage}";
		
		location.href = url;
	}
}
</script>
</head>
<body>
	<br><br>
	<form name="frm1" action="../cart/create" method="post" onsubmit="return checkLogin(${sessionScope.userid})">
		<table align="center" border="1" cellpadding="1" cellspacing="1" style="width:800px;">
			<tr>
				<td rowspan="11" width="30%">
					<p style="text-align: center;">
						<img src="${dto.bookfront_photo }" width="200" height="300"/>
					</p>
				</td>
			</tr>
			<tr>
				<td>책이름</td>
				<td>${dto.bookname}</td>
			</tr>
			<tr>
				<td>저자</td>
				<td>${dto.writer}</td>
			</tr>
			<tr>
				<td>번역자</td>
				<td>${dto.traductor}</td>
			</tr>
			<tr>
				<td>출판일시</td>
				<td>${dto.pub_date}</td>
			</tr>
			<tr>
				<td width="20%">ISBN 10자리</td>
				<td>${dto.ISBN10}</td>
			</tr>
			<tr>
				<td width="20%">ISBN 13자리</td>
				<td>${dto.ISBN13}</td>
			</tr>
			<tr>
				<td>정가</td>
				<td><s><fmt:formatNumber value="${dto.cur_price}" pattern="#,###" />원</s></td>
			</tr>
			<tr>
				<td>할인가</td>
				<td><fmt:formatNumber value="${dto.sale_price}" pattern="#,###" />원</td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="number" name="cart_cnt" min="1" max="100" value="1" ></td>
			</tr>
			<tr>
				<td colspan="2">
				<p style="text-align: center;">
					<input type="submit" value="장바구니담기">
					<input type="button" onclick="location.href='./list'" value="목록">
<!-- 					<input type="button" onclick="history.back()" value="돌아가기" /> -->
					<input type="hidden" name="bookid" value="${dto.bookid }">
					<input type="hidden" name="userid" value="${sessionScope.userid}">
				</td>
			</tr>		
			<tr>
				<td colspan="3">
					${dto.book_explain}
				</td>
			</tr>					
		</table>
	</form>
	<br>
	<div style="text-align: center;">
		<c:if test="${'A' eq sessionScope.grade}">
<!-- 			<input type="button" value="수정"> -->
<%-- 			<input type="button" value="삭제" onclick="deleteB('${dto.bookid}')"> --%>
<!-- 			<input type="button" onclick="location.href='./list'" value="목록"> -->
		</c:if>
	</div>
	
	<!-- 100자평 시작 -->
	<form action="./ccreate" method="post" name="frm2" onsubmit="return input(this)">
		<input type="hidden" name="bookid" value="${bookid}">
		<input type="hidden" name="nowPage" value="${param.nowPage}">
		<input type="hidden" name="col" value="${param.col}">
		<input type="hidden" name="word" value="${param.word}">
		<input type="hidden" name="nPage" value="${nPage}">		
		<input type="hidden" name="userid" value="${sessionScope.userid}">
		<input type="hidden" name="seq" value="0">	 <!-- 0은 의미없음 seq값을 javascript 로 변경해서 보낼것임 -->
				<div class="rcreate">
					<select name = "star_cnt">
						<option value = "0">☆☆☆☆☆</option>
						<option value = "1">★☆☆☆☆</option>
						<option value = "2">★★☆☆☆</option>
						<option value = "3">★★★☆☆</option>
						<option value = "4">★★★★☆</option>
						<option value = "5">★★★★★</option>
					</select>
						<TEXTAREA id="contentHelp" cols="120" name="say100ja" rows="5" onclick="rcheck(this)"></TEXTAREA>
						<DIV class=remaining>남은 글자수: <SPAN class="count">100</SPAN></DIV>
					<input type="submit" name="csubmit" value="등 록" />
				</div>
				<c:forEach var="cdto" items="${clist }">
					<div class="rlist">
						<c:choose>
							<c:when test="${cdto.star_cnt == 0}">
								☆☆☆☆☆
							</c:when>	
							<c:when test="${cdto.star_cnt == 1}">
								★☆☆☆☆
							</c:when>
							<c:when test="${cdto.star_cnt == 2}">
								★★☆☆☆
							</c:when>
							<c:when test="${cdto.star_cnt == 3}">
								★★★☆☆
							</c:when>
							<c:when test="${cdto.star_cnt == 4}">
								★★★★☆
							</c:when>
							<c:when test="${cdto.star_cnt == 5}">
								★★★★★
							</c:when>
						</c:choose>
							| ${cdto.name } | ${cdto.input_date} 
							<c:if test="${sessionScope.userid == cdto.userid }"> <!-- 현재 로그인한 아이디의 것만 보여준다 -->
								<span style="float: right;">
									<a href="javascript:cupdate('${cdto.seq}','${cdto.say100ja }','${cdto.star_cnt }')">수정</a>|
									<a href="javascript:cdelete('${cdto.seq}')">삭제</a>
								</span>
							</c:if>
							<br><br>
							${(fn:replace(cdto.say100ja, n, br))}

					</div>
				</c:forEach>

		${paging }
	</form>
	<br>
	<!-- 100자평 끝 -->
</body>
</html>