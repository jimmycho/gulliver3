<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"/></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css"> 
<style>
#jb-container {
	width: 1200px; margin : 0px auto;
	padding: 2px;
	border: 1px solid #ffffff;
	margin: 0px auto;
}

#jb-header {
	padding: 20px;
	margin-bottom: 10px;
	border: 1px solid #bcbcbc;
}

#jb-sidebar {
	width: 235px;
	padding: 0px;
	margin-bottom: 10px;
	float: left;
	border: 1px solid #bcbcbc;
}

#jb-content {
	width: 950px;
	padding: 0px;
	margin-bottom: 10px;
	float: right;
	border: 1px solid #bcbcbc;
}

#jb-footer {
	clear: both;
	padding: 2px;
	border: 1px solid #bcbcbc;
	background-color: #009AFF
}
</style>

</head>
<body leftmargin="0" topmargin="0">
 
<!-- 상단 메뉴 -->
<tiles:insertAttribute name="header"/>
<!-- 상단 메뉴 끝 -->
 
<!-- 사이드바 -->
 <tiles:insertAttribute name="sideBar"/>
<!-- 사이드바 끝-->
 
<!-- 내용 시작 -->
	<div id="jb-content">
		<tiles:insertAttribute name="body"/>
	</div>
<!-- 내용 끝 -->
 
<!-- 하단 메뉴 시작 -->
	<tiles:insertAttribute name="footer"/>
<!-- 하단 메뉴 끝 -->
</div> 
</body>
</html>