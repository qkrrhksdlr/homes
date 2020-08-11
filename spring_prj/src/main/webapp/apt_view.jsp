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
<<<<<<< HEAD
<body>

<<<<<<< HEAD

<table width="100%" border=1>
	<tr>
		<td id="mchart"></td>
		<td id="zwchart"></td>
	</tr>
</table>


=======
=======
<body>

>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
<table border="1" width="1000" cellpadding="0" cellspacing="0">
<<<<<<< HEAD
   <tr>
      <td><b>단지명</b></td>
      <td><b>전용면적(㎡)</b></td>
      <td><b>도로명 주소</b></td>
      <td><b>법정동</b></td>
      <td><b>준공년도</b></td>
   </tr>
=======
	<tr>
		<td><b>단지명</b></td>
		<td><b>전용면적(㎡)</b></td>
		<td><b>도로명 주소</b></td>
		<td><b>법정동</b></td>
		<td><b>준공년도</b></td>
	</tr>
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git

<c:forEach items="${APTVIEWKKK}" var="voo">
<<<<<<< HEAD
   <tr>
        <td>${voo.apt}</td>
        <td>${voo.area}㎡</td>
      <td>${voo.gu} ${voo.street}</td>
      <td>${voo.dong}</td>
      <td>${voo.archyear}</td>
   </tr>   
=======
	<tr>
	  	<td>${voo.apt}</td>
	  	<td>${voo.area}㎡</td>
		<td>${voo.gu} ${voo.street}</td>
		<td>${voo.dong}</td>
		<td>${voo.archyear}</td>
	</tr>	
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git

</c:forEach>
<<<<<<< HEAD
</table><br>

=======

<table width="100%" border=1>
<<<<<<< HEAD
   <tr>
      <td id="mchart"></td>
   </tr>
      <tr>
      <td id="zwchart"></td>
   </tr>
=======
	<tr>
		<td id="mchart"></td>
	</tr>
		<tr>
		<td id="zwchart"></td>
	</tr>
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
</table>

</body>
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git

<script>

/* 매매차트 */
$.ajax({
<<<<<<< HEAD
     url : "/aptmchart.do",
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

=======
	  url : "/aptmchart.do",
	  method : "GET",  
	  contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
	  data : "aptStr=${param.aptStr}&areaStr=${param.areaStr}",
<<<<<<< HEAD
	  dataType : "json",  
=======
	  dataType : "json",  
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
	  success : function(jsonObjList){
		  var aptConym = [];	
		  var aptPrice = []; 
		  
		  $.map(jsonObjList, function(vv, i){
		  		aptConym.push(vv.conym);
<<<<<<< HEAD
		  		aptPrice.push(vv.price);
=======
		  		aptPrice.push(vv.price);
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
		  	})
		 
		  printMLinearChart(aptConym, aptPrice);
	  }
});		
<<<<<<< HEAD


function printMLinearChart(aptConym, aptPrice) {	
=======

function printMLinearChart(aptConym, aptPrice) {	
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
	var chart = c3.generate({
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
		bindto: "#mchart",
	    data: {	
	    	json:{
		    	x: aptConym,
		    	매매: aptPrice
	    	},
			x:'x',
    		type : 'line'
	    	},
<<<<<<< HEAD
    	grid: { x: {show: false}, y: {show: true}},
	    size: {height: 200, width: 280}
=======
    	grid: { x: {show: false}, y: { show: true}},
	    size: {height: 200, width: 800}
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
	});
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
}

/* 전월세 차트 */
$.ajax({
<<<<<<< HEAD
     url : "/aptzwchart.do",
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
=======
	  url : "/aptzwchart.do",
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
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
		  	})
<<<<<<< HEAD

		  printZWLinearChart(aptConym, aptDeposit);
	  }
});		


function printZWLinearChart(aptConym, aptDeposit) {
	var chart = c3.generate({
=======
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git

           })

<<<<<<< HEAD
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
=======

function printZWLinearChart(aptConym, aptDeposit) {
	var chart = c3.generate({
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
		bindto: "#zwchart",
	    data: {	
	    	json:{
		    	x: aptConym,
		    	전세: aptDeposit
	    	},
			x:'x',
    		type : 'line'
	    	},
<<<<<<< HEAD
    	grid: { x: {show: false}, y: {show: true}},
	    size: {height: 200, width: 280}
=======
    	grid: { x: {show: false}, y: { show: true}},
	    size: {height: 200, width: 800}
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
	});
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
}
<<<<<<< HEAD


=======
<<<<<<< HEAD

=======

>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
>>>>>>> branch 'master' of https://github.com/qkrrhksdlr/homes.git
</script>
</body>
</html>