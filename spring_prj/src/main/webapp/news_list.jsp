<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부동산 시장동향 뉴스</title>
<h1>부동산 시장동향 뉴스</h1><hr>
</head>
<body>

<table border="1" width="800" cellpadding="0" cellspacing="0">
	<tr>
		<td>이미지</td>
		<td>기사제목</td>
		<td>내용</td>
		<td>출처</td>
		<td>날짜</td>
	</tr>

<!-- LISTKKKKK에서 리스트 가져와서 vo에 담아줘 -->
<c:forEach items="${NEWSLISTKKK}" var="vo">
	<tr>
 		<td><img src="${vo.img}" width="245" height="138"></td>
		<td><a href="${vo.url}">${vo.title}</a></td> 
		<td>${vo.contents}</td>
		<td>${vo.writing}</td>
		<td>${vo.date}</td>	
	</tr>
</c:forEach>

</table>



</body>
</html>