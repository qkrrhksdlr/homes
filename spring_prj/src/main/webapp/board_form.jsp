<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
글쓰기 입력폼(board_form.jsp)<hr>
<form method="post" action="/binsert.do"> <!-- ----------------------------------- -->
	제목:<input type="text" name="title"><br>
	작성자:<input type="text" name="regid"><br>
	내용<textarea name="contents"></textarea><br>
	<input type="submit" value="게시물입력POST">
</form>

</body>
</html>