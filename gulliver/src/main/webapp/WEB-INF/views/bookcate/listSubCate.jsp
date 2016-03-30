<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/xml ; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <% request.setCharacterEncoding("UTF-8"); %> --%>
<SubCategoryList>
<c:forEach var="dtoSub" items="${subCateList}" >
	<SubCategory>
		<parent_code>${dtoSub.HIGH_LINK_CD}</parent_code>
		<code>${dtoSub.BOOK_CATE_CD}</code>
		<name>${dtoSub.BOOK_CATE_NAME}</name>
	</SubCategory>
</c:forEach>
</SubCategoryList>

