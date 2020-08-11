<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>For Sale List</title>
</head>
<body>

<table border="1" width="800" cellpadding="0" cellspacing="0">
	<tr>
		<td>단지명</td>
		<td>건물동</td>
		<td>매매가</td>
		<td>보증금</td>
		<td>월세</td>
		<td>전용면적</td>
		<td>층</td>
		<td>향</td>
		<td>특징</td>
		<td>공인중개사</td>
		<td>출처</td>
		<td>매물확인일자</td>
	</tr>

	



<!-- YTNLISTKKKKK에서 리스트 가져와서 vo에 담아줘 -->
<c:forEach items="${FORSALEKKK}" var="vo">
	<tr>
<%-- 		<td><img src="${vo.img}" width="245" height="138"></td>
		<td><a href="${vo.url}">${vo.title}</a></td> --%>
		<td>${vo.apt}</td>
		<td>${vo.bldgnum}</td>
		<td>${vo.price}</td>
		<td>${vo.deposit}</td>
		<td>${vo.mrent}</td>
		<td>${vo.area}</td>
		<td>${vo.floor}</td>
		<td>${vo.dir}</td>
		<td>${vo.comment}</td>
		<td>${vo.agent}</td>
		<td>${vo.source}</td>
		<td>${vo.confirmdate}</td>		
	</tr>
</c:forEach>

</table>


</body>
</html>