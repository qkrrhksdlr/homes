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
<!-- 
JSOUP : 웹 크롤링을 위한 Open API 
getElementById(String id) : Element 객체를 반환합니다. 하나를 반환합니다. 없으면 null 을 반환합니다.
getElementsByTag(String tag) : Elements 객체를 반환합니다. 없으면 size() 가 0 입니다.
getElementsByClass(String className) : Elements 객체를 반환합니다. 없으면 size() 가 0 입니다.
getElementByID("ytn_list_v2014") : # = id접근 (id는 페이지당 단 하나)
getElementByClass(String Classname) : . = class접근

doc.select("a") : <a> 요소를 모두 선택합니다.
doc.select("#logo") : id="logo" 인 요소를 선택합니다.
doc.select(".head") : class="head"인 요소들을 선택합니다.
doc.select("[href]") : href 속성을 가진 요소들을 선택합니다.
doc.select("[width=500]") : width 속성의 값이 500인 모든 요소들을 선택합니다.
-->
</html>