<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page import="model.member.*,utility.*"%> --%>

<% 
/*    MemberDTO dto = (MemberDTO)request.getAttribute("dto");
   String job = dto.getJob(); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 14px;
}
</style>
<link href="../css/style1.css" rel="Stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
</script>
</head>
<body leftmargin="0" topmargin="0">
	<DIV class="title">정보수정</DIV>
<FORM name='frm' method='POST' action='./update'
	onsubmit="return inputCheck()">
	<input type="hidden" name="userid" value="${dto.userid}" />
	<TABLE class='table'>
		<tr>
			<td width="20%">*아이디</td>
			<td colspan='2'>${dto.userid}</td>
		</tr>
		<tr>
			<td>*이름</td>
			<td><input type="text" name="name" size="15"
				value='${dto.name}'></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="callphone" value="${dto.callphone}"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
			<input type="text" name="email" size="27" value='${dto.email}'> 
			<input type="button" value="Email 중복확인" onclick="javascript:emailCheck(document.frm.email.value)">
			</td>
		</tr>
		<tr>
			<td align="center" class="BTD2" height="23" width="100px">우편번호</td>
			<td style="background-color: #FAFAFA">
				<input type="text" id="sample6_postcode" name="zipcode" size="10"	value='${dto.zipcode}'> 
				<input type="button" value="우편번호찾기" onclick="sample6_execDaumPostcode()">
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
			 <input type="text" id="sample6_address" name="address1" size="45" value='${dto.address1}'><br> 
			 <input type="text" id="sample6_address2" name="address2" size="45" value='${dto.address2}'>
			</td>
		</tr>
		
	</TABLE>

	<DIV class='bottom'>
		<input type='submit' value='정보수정'> <input type='button'
			value='취소' onclick="history.back()">
	</DIV>
</FORM>

	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
