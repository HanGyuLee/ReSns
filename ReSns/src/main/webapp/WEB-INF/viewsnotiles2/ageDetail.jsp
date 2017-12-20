<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="det" items="${ageDetail.ageDetailList}" varStatus="status">
[	'${det.age}',
	Number(${det.pct})
]
<c:if test="${status.count < ageDetail.ageDetailList.size()}">
    			,
</c:if>
</c:forEach>