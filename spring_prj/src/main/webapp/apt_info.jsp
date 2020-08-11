<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- YTNLISTKKKKK에서 리스트 가져와서 vo에 담아줘 -->
<c:forEach items="${AptInfoKKK}" var="vo">
	<tr>
		<td>${vo.apt}</td>
	</tr>
	<tr>
		<td>${vo.type}</td>
		<td>${vo.numhouse}</td>	
		<td>${vo.numbldg}</td>	
		<td>${vo.archyear}</td>			
		<td>${vo.office}</td>	
		<td>${vo.arealist}</td>	
		<td>${vo.school}</td>			
		<td>${vo.street}</td>	
	</tr>
</c:forEach>

</body>
</html>