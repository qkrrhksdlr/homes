<%@ page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<h1>서울시 아파트 실거래 정보 찾기</h1>
찾고싶은 지역구를 선택한 후 검색어를 입력하세요.
(검색어: 도로명주소 or 동 or 아파트명)
<title>서울시 구 선택 > 도로명주소 or 동 or 아파트명 입력 > 검색</title>
</head>
<body>




<br><br>

<form name="searchform" method="get" action="/aptlist.do">
<select name="searchKey">
	<option value ="강남구">강남구</option>
	<option value ="강동구">강동구</option>
	<option value ="강북구">강북구</option>
	<option value ="강서구">강서구</option>
	<option value ="관악구">관악구</option>
	<option value ="광진구">광진구</option>
	<option value ="구로구">구로구</option>
	<option value ="금천구">금천구</option>
	<option value ="노원구">노원구</option>
	<option value ="도봉구">도봉구</option>
	<option value ="동대문구">동대문구</option>
	<option value ="동작구">동작구</option>
	<option value ="마포구">마포구</option>
	<option value ="서대문구">서대문구</option>
	<option value ="서초구">서초구</option>
	<option value ="성동구">성동구</option>
	<option value ="성북구">성북구</option>
	<option value ="송파구">송파구</option>
	<option value ="양천구">양천구</option>
	<option value ="영등포구">영등포구</option>
	<option value ="용산구">용산구</option>
	<option value ="은평구">은평구</option>
	<option value ="종로구">종로구</option>
	<option value ="중구">중구</option>
	<option value ="중랑구">중랑구</option>
</select>
<input type ="text" name="searchStr">
<input type ="submit" value="검색">
</form>

<br><br>


<br><br>


<table border="1" width="300" cellpadding="0" cellspacing="0">
	<tr>
		<td>단지명</td>
		<td>도로명 주소</td>
		<td>법정동</td>
		<td>면적(m2)</td>
	</tr>



<!-- MYLISTKKKKK에서 리스트 가져와서 vo에 담아줘 -->
<c:forEach items="${APTLISTKKK}" var="vo">
	<tr>
	  	<td><a href="/aptview.do">${vo.apt}</a></td>
		<td>${vo.gu} ${vo.street}</td>
		<td>${vo.dong}</td>
		<td>${vo.area}</td>
	</tr>
</c:forEach>

</table>
<br>


</body>
</html>