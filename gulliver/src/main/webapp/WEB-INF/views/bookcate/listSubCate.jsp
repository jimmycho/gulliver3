<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/xml ; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <% request.setCharacterEncoding("UTF-8"); %> --%>
<%-- <% 
	Cookie[] cookies=request.getCookies();
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){
			out.println("i:"+(i+1));
			if(cookies[i].getName().equals("ListHTML")) {
				out.println(cookies[i].getName());
			}
	   }
	}
%> --%>

<SubCategoryList>
<c:forEach var="dtoSub" items="${subCateList}" >
	<SubCategory>
		<parent_code>${dtoSub.HIGH_LINK_CD}</parent_code>
		<code>${dtoSub.BOOK_CATE_CD}</code>
		<name>${dtoSub.BOOK_CATE_NAME}</name>
	</SubCategory>
</c:forEach>
</SubCategoryList>

