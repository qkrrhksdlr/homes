<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
      <td>단지명</td>
      <td>종류</td>
      <td>세대수</td>
      <td>동수</td>
      <td>준공년도</td>
      <td>관리실</td>
      <td>면적</td>
      <td>학군정보</td>
      <td>도로명주소</td>
      
   </tr>

<c:forEach items="${AptInfoKKK}" var="voo">
   <tr>
        <td>${voo.apt}</td>
      	<td>${voo.type}</td>
		<td>${voo.numhouse}</td>	
		<td>${voo.numbldg}</td>	
		<td>${voo.archyear}</td>			
		<td>${voo.office}</td>	
		<td>${voo.arealist}</td>	
		<td>${voo.school}</td>			
		<td>${voo.street}</td>	
   </tr>   

</c:forEach>

<table width="100%" border=1>
   <tr>
      <td id="mchart"></td>
   </tr>
   <tr>
      <td id="zwchart"></td>
   </tr>
</table>

</body>

<script>

/* 매매차트 */
$.ajax({
     url : "/aptdealchart.do",
     method : "GET",  
     contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
     data : "aptStr=${param.aptStr}&areaStr=${param.areaStr}",
     dataType : "json",  
     success : function(jsonObjList){
        var aptConym = [];   
        var aptPrice = []; 
        
        $.map(jsonObjList, function(vv, i){
              aptConym.push(vv.conym);
              aptPrice.push(vv.price);
           })
       
        printMLinearChart(aptConym, aptPrice);
     }
});      

function printMLinearChart(aptConym, aptPrice) {   
   var chart = c3.generate({

      bindto: "#mchart",
       data: {   
          json:{
             x: aptConym,
             매매: aptPrice
          },
         x:'x',
          type : 'line'
          },
       grid: { x: {show: false}, y: { show: true}},
       size: {height: 200, width: 800}
   });

}

/* 전월세 차트 */
$.ajax({
     url : "/aptrentchart.do",
     method : "GET",  
     contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
     data : "aptStr=${param.aptStr}&areaStr=${param.areaStr}",
     dataType : "json",  
     success : function(jsonObjList){ 
        var aptConym = [];   
        var aptDeposit = []; 
        $.map(jsonObjList, function(vv, i){
              aptConym.push(vv.conym);
              aptDeposit.push(vv.deposit);

           })

        printZWLinearChart(aptConym, aptDeposit);
     }
});      


function printZWLinearChart(aptConym, aptDeposit) {
   var chart = c3.generate({
      bindto: "#zwchart",
       data: {   
          json:{
             x: aptConym,
             전세: aptDeposit
          },
         x:'x',
          type : 'line'
          },
       grid: { x: {show: false}, y: { show: true}},
       size: {height: 200, width: 800}
   });
}

</script>
</html>