<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<!-- <style type="text/css">
td {
	border-color: #AAAAAA; /* 테이블 외곽선 색깔 */
	border-width: 1px; /* 테이블 외곽선 두께 */
	border-style: solid; /* 테이블 외곽선 스타일 */
	color: black; /* 글자 색 */
	background-color: #FFD549; /* 배경 색 */
	padding: 5px; /* 셀 내부 간격 */
}
</style> -->


<script type="text/javascript"> 
  // 입력 값 검사후 서버로 전송 
  function inputCheck(){ 
    var f = document.frm; // <FORM>태그 객체 
     
    if(f.id.value == ""){ 
      alert("아이디를 입력해 주세요."); 
      f.id.focus(); // 폼이름.input 태그명.커서 셋팅    
 
      return;       // 프로그램 종료, 값을 돌려줌 
    } 
    if(f.passwd.value == ""){ 
      alert("비밀번호를 입력해 주세요."); 
      f.passwd.focus(); 
      return; 
    } 
    if(f.repasswd.value == ""){ 
      alert("비밀번호를 확인해 주세요"); 
      f.repasswd.focus(); 
      return; 
    } 
     
    //비밀번호가 일치하는지 검사 
    if(f.passwd.value != f.repasswd.value){ 
      alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요."); 
      f.passwd.focus(); 
      return; 
    } 
     
    if(f.name.value == ""){ 
      alert("이름을 입력해 주세요."); 
      f.mname.focus(); 
      return; 
    } 
 
    if(f.email.value == ""){ 
      alert("이메일을 입력해 주세요."); 
      f.email.focus(); 
      return; 
    } 
 
    if(f.job.value == "0"){ 
      alert("직업을 선택해 주세요."); 
      f.job.focus(); 
      return; 
    } 
    // Form onsubmit 이벤트일경우 
    // return false; 
     
    f.submit(); 
  } 
 
  // 중복 아이디를 검사합니다. 
  function idCheck(userid){ 
    if(userid == ""){ 
      window.alert("아이디를 입력해 주세요."); 
      f.id.focus(); // 커서 이동 
    }else{ 
      url="./checkId?userid=" + userid;  // GET 
      wr = window.open(url,"아이디검색","width=500,height=400"); 
      wr.moveTo((window.screen.width-500)/2, (window.screen.height-400)/2);// x, y 
    } 
  } 
 
  //중복 이메일을 검사합니다. 
  function emailCheck(email){ 
    if(email == ""){ 
      window.alert("이메일을 입력해 주세요."); 
      f.email.focus(); 
    }else{ 
      url="./checkEmail?email=" + email;  // GET 
      wr = window.open(url,"이메일검색","width=500,height=400"); 
      wr.moveTo((window.screen.width-500)/2, (window.screen.height - 400)/2);// x, y 
    } 
  } 
 
  // 우편번호 검색 
  function zipCheck(){ 
    url="zipCheck"; 
    wr = window.open(url,"우편번호 검색","width=550 ,height=450"); 
    wr.moveTo((window.screen.width-550)/2, (window.screen.height - 450)/2);// x, y 
  } 
 
</script> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
 <link href="../css/style1.css" rel="stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<img style="width: 753px; " src="../images/0012-1.jpg">
 
<FORM name='frm' 
      metdod='POST' 
      action='./create'
      enctype='multipart/form-data'   
      onsubmit="return inputCheck()">
     
<!-- <!-- 이 경우에 request.getParameter 사용불가함 --> 
      
<TABLE class="BTABLE" width="700px" border="0">
<tr>
	<td align="center" class="BTD2" height="23" width="150px">아이디</td>
	<td style="background-color: #FAFAFA"><input type="text"
name="userid" size="15" value=''> <input type="button"
value="ID중복확인" onclick="idCheck(document.frm.userid.value)" class="BBUTTON">
</td>
</tr>
<tr>
	<td align="center" class="BTD2" height="23" width="100px">패스워드</td>
	<td style="background-color: #FAFAFA"><input type="password"
		name="passwd" size="15" value='' ></td>
</tr>
<tr>
	<td align="center" class="BTD2" height="23" width="100px">패스워드
		확인</td>
	<td style="background-color: #FAFAFA"><input type="password"
		name="repasswd" size="15" value=''></td>
</tr>
<tr>
	<td align="center" class="BTD2" height="23" width="100px">이름</td>
	<td style="background-color: #FAFAFA"><input type="text"
		name="name" size="15" value=''></td>
</tr>
<tr>
	<td align="center" class="BTD2" height="23" width="100px">생년월일</td>
	<td style="background-color: #FAFAFA"><input type="text"
		name="birtddate" size="15" value='' ></td>
</tr>
<tr>
	<td align="center" class="BTD2" height="23" width="100px">이메일</td>
	<td style="background-color: #FAFAFA"><input type="text"
name="email" size="27" value=''> <input type="button"
value="Email 중복확인"
onclick="javascript:emailCheck(document.frm.email.value)" class="BBUTTON">

	</td>
</tr>
<tr>
	<td align="center" class="BTD2" height="23" width="100px">핸드폰번호</td>
	<td style="background-color: #FAFAFA"><input type="text"
		name="callphone" value=""></td>
</tr>
<tr>
	<td align="center" class="BTD2" height="23" width="100px">전화번호</td>
	<td style="background-color: #FAFAFA"><input type="text"
		name="phone" value=""></td>
</tr>

<tr>
	<td align="center" class="BTD2" height="23" width="100px">우편번호</td>
	<td style="background-color: #FAFAFA"><input type="text"
id="sample5_postcode" name="zipcode" placeholder="우편번호"> <input
type="button" onclick="sample5_execDaumPostcode()" value="우편번호 찾기" class="BBUTTON"><br>
	</td>
</tr>
<tr>
	<td rowspan="2" align="center" class="BTD2" height="40" width="100px">주소</td>
	<td style="background-color: #FAFAFA">
<input type="text" id="sample5_address" name="address1" size="40" placeholder="주소"  >
</td>
<tr><td style="background-color: #FAFAFA">
<input type="text" id="sample5_address2" name="address2" size="40" placeholder="상세주소">
<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
</td>
<tr>
	<td align="center" class="BTD2" height="23" width="100px">회원사진(jpg,png파일)</td>
	<td style="background-color: #FAFAFA"><input type='file'
		name='userphotoMF' value='' ></td>
</tr>
</TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='회원가입' class="BBUTTON">
    <input type='button' value='취소' class="BBUTTON" onclick="location.href='../bookinfo/list'">
  </DIV>
</FORM>
<!-- *********************************************** -->
</html> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=	a672872a4be165f31fc21dc3b98bd97d&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
 
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
 
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
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
 
      
                // 주소로 좌표를 검색
                geocoder.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
               
                // 우편번호 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_postcode").value = data.zonecode;
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = fullAddr;
                // 상세주소 필드에 focus 넣는다.
                document.getElementById("sample5_address2").focus();
 
            }
        }).open();
    }
</script>  