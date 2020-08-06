<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function buttonEvent(prm) {
	if(prm == "u") {
		document.myform.action = "/bupdate.do";
		document.myform.method = "post";
		document.myform.submit();
	} else if(prm == "d") {
		document.myform.action = "/bdelete.do";
		document.myform.method = "get";
		document.myform.submit();
	} else {
		document.myform.action = "/blist.do";
		document.myform.method = "get";
		document.myform.submit();
	}
	
}
</script>

</head>
<body>

상세보기(board_view.jsp)<hr>
<form name="myform"> <!-- method="???" action="???" ----------------------------------- -->
	<input type="hidden" name="bseq" value="${VOKKKK.bseq}">  
	번호:${VOKKKK.bseq}<br>
	제목:<input type="text" name="title" value="${VOKKKK.title}"><br>
	작성자:<input type="text" name="regid" value="${VOKKKK.regid}"><br>
	내용<textarea name="contents">${VOKKKK.contents}</textarea><br>
	<input type="button" onClick="buttonEvent('u')" value="수정">
	<input type="button" onClick="buttonEvent('d')" value="삭제">
	<input type="button" onClick="buttonEvent('l')" value="목록">
</form>


</body>
</html>