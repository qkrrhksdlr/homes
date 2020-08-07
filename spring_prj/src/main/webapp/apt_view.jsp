<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <script>
function buttonEvent(prm) {
		document.myform.action="/aptview.do";		
		document.myform.method="get";
		document.myform.submit();
}
</script> -->

</head>
<body>



상세보기 (apt_view.jsp)<hr>


<table border="1" width="300" cellpadding="0" cellspacing="0">
	<tr>
		<td>단지명</td>
		<td>도로명 주소</td>
		<td>법정동</td>
		<td>면적(m2)</td>
	</tr>


<c:forEach items="${APTVIEWKKK}" var="vo">
	<tr>
		<td>${vo.apt}</td>
		<td>${vo.gu} ${vo.street}</td>
		<td>${vo.dong}</td>
		<td>${vo.area}</td>
	</tr>
</c:forEach>

</table>
<br>

</body>
</html>