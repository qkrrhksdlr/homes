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
<title>Insert title here</title>
</head>
<body>
게시물 목록(board_list.jsp)<hr>
<form method="post" action="/blist.do">
<select name="searchKey">
  <option value="title">제목</option>
  <option value="regid">글쓴이</option>
  <option value="bseq">번호</option>
</select>
<input type="text" name="searchStr">
<input type="submit" value="검색">
</form>
<br>
<form method="post" action="/blist.do">
<input type="radio" name="searchKey" value="title" checked>제목
<input type="radio" name="searchKey" value="regid">글쓴이
<input type="radio" name="searchKey" value="bseq">번호
<input type="text" name="searchStr">
<input type="submit" value="검색">
</form>
<br>

<table border="1" width="300" cellpadding="0" cellspacing="0">
<tr>
	<td>번호</td>
	<td>제목</td>
	<td>글쓴이</td>
	<td>날짜</td>
</tr>

<c:forEach items="${MYLISTKKKKK}" var="vo">
	<tr>
		<td>${vo.bseq}</td>
		<td><a href="/bview.do?bseq=${vo.bseq}">${vo.title}</a></td>
		<td>${vo.regid}</td>
		<td>${vo.regdate}</td>
	</tr>
</c:forEach>

</table> 
<BR>  
<a href="/board_form.jsp">[글쓰기]</a>
</body>
</html>