<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<h1>아파트 정보 상세보기 (apt_view.jsp)<hr></h1>
</head>
<body>




<table border="1" width="1000" cellpadding="0" cellspacing="0">

	<tr>
		<td><b>단지명</td>
		<td><b>전용면적(㎡)</td>
		<td>도로명 주소</td>
		<td>법정동</td>
		<td>계약년월</td>
		<td>계약금액</td>
		<td>준공년도</td>
		
	</tr>



<!-- MYLISTKKKKK에서 리스트 가져와서 vo에 담아줘 -->
<c:forEach items="${APTVIEWKKK}" var="vo">
	<tr>
	  	<td>${vo.apt}</td>
	  	<td>${vo.area}㎡</td>
		<td>${vo.gu} ${vo.street}</td>
		<td>${vo.dong}</td>
		<td>${vo.conym}</td>
		<td>${vo.price}</td>
		<td>${vo.archyear}</td>
		
	</tr>
</c:forEach>

</table>
<br>




</body>
</html>