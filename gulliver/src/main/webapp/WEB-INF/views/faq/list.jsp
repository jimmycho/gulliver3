<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/style1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
function kuisin(idMyDiv){
     var objDiv = document.getElementById(idMyDiv);
     if(objDiv.style.display=="block"){ objDiv.style.display = "none"; }
     else{ objDiv.style.display = "block"; }
}
</script>

<style type="text/css">
TH {
	border-color: #AAAAAA; /* 테이블 외곽선 색깔 */
	border-width: 1px; /* 테이블 외곽선 두께 */
	border-style: solid; /* 테이블 외곽선 스타일 */
	color: black; /* 글자 색 */
	background-color: #FFD549; /* 배경 색 */
	padding: 5px; /* 셀 내부 간격 */
}
</style>

</head>
<body>
<DIV style='width: 80%; text-align: center; margin: 1px auto;'>
<%-- 		<FORM name='frm' method='post' action="./list">
			<SELECT name='col'>
				<!-- 검색할 컬럼 -->
				<OPTION value='wname'
					<c:if test="${col=='wname'}">selected='selected'</c:if>>전체분류</OPTION>
				<OPTION value='title'
					<c:if test="${col=='title'}">selected='selected'</c:if>>주문/배송</OPTION>
				<OPTION value='content'
					<c:if test="${col=='content'}">selected='selected'</c:if>>결제</OPTION>
			</SELECT> 
			<input type='text' name='word' value='${word}'>
			<!-- 검색어 -->
			<input type='submit' value='검색'> 
		</FORM> --%>
</DIV>
	<TABLE width="800px" class="BTABLE">
	<tr>
		<td height="23" colspan="5" align="center" ><img style="width: 753px; " src="../images/0007-1.jpg"></td>
	</tr>
		<TR>
			<td align="center" width="5%" class="BTD2">번호</td>
			<td align="center" width="100px" class="BTD2">분류</td>
			<td align="center" class="BTD2">제목</td>
			<td align="center" width="100px" class="BTD2">등록일시</td>
			<td align="center" width="8%" class="BTD2">조회수</td>			
		</TR>
<c:choose>
	<c:when test="${empty list }">
			<TR>
				<TD colspan='8' align='center'>등록된 FAQ가 없습니다.</TD>
			</TR>
	</c:when>
<c:otherwise>
	<c:forEach var="dto" items="${list}" >
		<TR class="BTD4">
			<TD valign="top">${dto.faqno }</TD>
			<TD valign="top">${dto.faq_cat }</TD>
			<TD valign="top"> 
          		<a href="#" onclick="kuisin('${dto.faqno}'); return false"> ${dto.title }</a>
          		<div id="${dto.faqno }" style="font-size:9pt; color:blue;  border:none 1px #404040; display: none;">
          		└ ${dto.content }
          		</div> 
          	</TD>
			<TD valign="top">${dto.in_date.subSequence(0,10)}</TD>
			<TD valign="top">${dto.faq_cnt}</TD>
		</TR>
  </c:forEach>
 </c:otherwise>

</c:choose>
</TABLE>
<div style='text-align: center; '>
${paging }
</div>
<br>

</body>
</html>