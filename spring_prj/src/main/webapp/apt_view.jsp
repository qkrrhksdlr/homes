<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Island - Project Homes</title>
<h1>아파트 정보 상세보기 (apt_view.jsp)<hr></h1>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 

<!-- Load c3.css -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.css" rel="stylesheet">

<!-- Load d3.js and c3.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.js"></script>

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
<c:forEach items="${APTVIEWKKK}" var="voo">
	<tr>
	  	<td>${voo.apt}</td>
	  	<td>${voo.area}㎡</td>
		<td>${voo.gu} ${vo.street}</td>
		<td>${voo.dong}</td>
		<td>${voo.conym}</td>
		<td>${voo.price}</td>
		<td>${voo.archyear}</td>
	</tr>	
</c:forEach>

</table>
<br>

<table width="100%" border=1>
	<tr>
		<td id="chart1"></td>
		<td id="chart2"></td>
	</tr>
</table>

</body>

<script>

/* 매매차트 */
$.ajax({
	  url : "/aptmchart.do",
	  method : "GET",  
	  contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
	  data : "aptStr=${param.aptStr}&areaStr=${param.areaStr}",
	  dataType : "json",  
	  success : function(jsonObjList){ 
			console.log(jsonObjList);
		  	
		  	var listArr = []; 
		  	$.map(jsonObjList, function(vv, i){
		  		var voArr = []; 
		  		voArr.push(vv.apt);
		  		voArr.push(vv.price);
		  		listArr.push(voArr);
		  	})
		  	console.log(listArr);
		  	printLinearChart(listArr);
	  }
});		

function printLinearChart(listArr) {
	var chart = c3.generate({
		bindto: "#chart1",
	    data: {
	        columns: listArr,
		    type: 'bar',
	    },
	    bar: {
	        width: {
	            ratio: 0.5  
	        }
	    },
	    grid: { x: {show: false}, y: { show: true}},
	    size: {height: 240, width: 300}
	}); 
}

/* 전월세 차트 */
$.ajax({
	  url : "/aptzwchart.do",
	  method : "GET",  
	  contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
	  data : "aptStr=${param.aptStr}&areaStr=${param.areaStr}",
	  dataType : "json",  
	  success : function(jsonObjList){ 
			console.log(jsonObjList);
		  	
		  	var listArr = []; 
		  	$.map(jsonObjList, function(vv, i){
		  		var voArr = []; 
		  		voArr.push(vv.apt);
		  		voArr.push(vv.deposit);
		  		listArr.push(voArr);
		  	})
		  	console.log(listArr);
		  	printLinearChart(listArr);
	  }
});		

function printLinearChart(listArr) {
	var chart = c3.generate({
		bindto: "#chart2",
	    data: {
	        columns: listArr,
		    type: 'bar',
	    },
	    bar: {
	        width: {
	            ratio: 0.5  
	        }
	    },
	    grid: { x: {show: false}, y: { show: true}},
	    size: {height: 240, width: 300}
	}); 
}
</script>

</html>