<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style1.css" rel="Stylesheet" type="text/css">
<script type="text/javascript"> 
// 입력 값 검사후 서버로 전송 
function inputCheck(){ 
      var f = document.frm; 
       
    if(f.mname.value == ""){  
        alert("이름을 입력해 주세요."); 
        f.mname.focus(); 
        return false; 
    } 
 
    if(f.job.value == "0"){ 
        alert("직업을 선택해 주세요."); 
        f.job.focus(); 
        return false; 
    } 
    // Form onsubmit 이벤트일경우 
    // return false; 
     
    return true; 
} 
 
// 중복 이메일을 검사합니다. 
function emailCheck(email){ 
  if(email == ""){ 
    window.alert("이메일을 입력해 주세요."); 
    f.email.focus(); 
  }else{ 
    url="emailCheck?email=" + email;  // GET 
    // http://localhost:8000/jsp_member/member/id_proc.jsp?id=user1 
    wr = window.open(url,"이메일검색","width=450,height=400"); 
    wr.moveTo((window.screen.width-450)/2, (window.screen.height - 400)/2);// x, y 
  } 
} 
 
// 우편번호 검색 
function zipCheck(){ 
  url="./zipCheck"; 
  // http://localhost:8000/jsp_member/member/zip_proc.jsp?area3=간석4동 
  wr = window.open(url,"우편번호 검색","width=550 ,height=450"); 
  wr.moveTo((window.screen.width-550)/2, (window.screen.height - 450)/2);// x, y 
} 
</script>
</head>
<body leftmargin="0" topmargin="0">

<div  height="23" colspan="10" align="center" ><img style="width: 753px; " src="../../images/userInfo2.jpg"> </div> 
<FORM name='frm' method='POST' action='./update' onsubmit="return inputCheck()">
	<input type="hidden" name="userid" value="${dto.userid}" />
	<TABLE class="BTABLE" style="width:800px;">
		<tr>
			<td height="20" class="BTD" width="20%">*아이디</td>
			<td colspan='2'>${dto.userid}</td>
		</tr>
		<tr>
			<td height="20" class="BTD">*이름</td>
			<td><input type="text" name="name" size="15" value='${dto.name}'></td>
		</tr>
		<tr>
			<td height="20" class="BTD">전화번호</td>
			<td><input type="text" name="callphone" value="${dto.callphone}"></td>
			<td></td>
		</tr>
		<tr>
			<td height="20" class="BTD">이메일</td>
			<td>
			<input type="text" name="email" size="27" value='${dto.email}'> 
			<input type="button" value="Email 중복확인" onclick="javascript:emailCheck(document.frm.email.value)">
			</td>
		</tr>
		<tr>
			<td height="20" class="BTD">우편번호</td>
			<td><input type="text" name="zipcode" size="10"
				value='${dto.zipcode}'> <input type="button"
				name="btnPost" value="우편번호찾기" onclick="zipCheck()"></td>
		</tr>
		<tr>
			<td height="20" class="BTD">주소</td>
			<td><input type="text" name="address1" size="70"
				value='${dto.address1}'><br /> <input type="text"
				name="address2" size="45"
				value='${dto.address2}'></td>
		</tr>
		
	</TABLE>

	<DIV class='bottom'>
		<input type='submit' value='정보수정' class="BBUTTON"> 
		<input type='button' value='취소' onclick="history.back()" class="BBUTTON">
	</DIV>
</FORM>
</body>
</html>
