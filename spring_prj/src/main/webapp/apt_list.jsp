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

<form name="searchform" method="post" action="/aptlist.do">
<select name="searchKey">
	<option value ="gu">강남구</option>
	<option value ="gu">강동구</option>
	<option value ="gu">강북구</option>
	<option value ="gu">강서구</option>
	<option value ="gu">관악구</option>
	<option value ="gu">광진구</option>
	<option value ="gu">구로구</option>
	<option value ="gu">금천구</option>
	<option value ="gu">노원구</option>
	<option value ="gu">도봉구</option>
	<option value ="gu">동대문구</option>
	<option value ="gu">동작구</option>
	<option value ="gu">마포구</option>
	<option value ="gu">서대문구</option>
	<option value ="gu">서초구</option>
	<option value ="gu">성동구</option>
	<option value ="gu">성북구</option>
	<option value ="gu">송파구</option>
	<option value ="gu">양천구</option>
	<option value ="gu">영등포구</option>
	<option value ="gu">용산구</option>
	<option value ="gu">은평구</option>
	<option value ="gu">종로구</option>
	<option value ="gu">중구</option>
	<option value ="gu">중랑구</option>
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
	  	<td><a href="/bview.do?searchKey=${vo.searchKey}">${vo.apt}</a></td>
		<td>${vo.gu} ${vo.street}</td>
		<td>${vo.dong}</td>
		<td>${vo.area}</td>
	</tr>
</c:forEach>

</table>
<br>


</body>
</html>