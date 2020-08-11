<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<script>
/* 서울시 아파트 가격지수 차트 */
$.ajax({
    url : "/aptindexchart.do",
    method : "GET",  
    contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
    dataType : "json",  
    success : function(jsonObjList){
       var year = [];   
       var deal = []; 
       var rent = []; 
       
       $.map(jsonObjList, function(vv, i){
    	   year.push(vv.year);
    	   deal.push(vv.deal_index);
    	   rent.push(vv.rent_index);    	     
          })  
          printIndexLinearChart(year, deal, rent);
    }
});

function printIndexLinearChart(year, deal, rent) {   
	   var chart = c3.generate({
	      bindto: "#indexchart",
	       data: {   
	          json:{
	             	x: year,
	             	매매: deal,
	            	전세 : rent
	          		},
	         	x:'x',
	          	type : 'line'
	         },
	       grid: { x: {show: false}, y: { show: true}},
	       size: {height: 600, width: 800}
	   });
}

/* 서울시 자치구별 아파트 비율 차트 */
$.ajax({
    url : "aptratiochart.do",
    method : "GET",  
    contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
    dataType : "json",  
    success : function(jsonObjList){
       var dataJson = {};   
       var keyArray = []; 
       
       $.map(jsonObjList, function(vv, i){
    	   dataJson[vv.gu] = (vv.apt_cnt);
    	   keyArray.push(vv.gu);  	     
          })  
          printRatioLinearChart(dataJson, keyArray);
    }
});

function printRatioLinearChart(dataJson, keyArray) { 
	var chart = c3.generate({
	      bindto: "#ratiochart",
	       data: {   
	    	   	json: [dataJson],
	         	keys: {value: keyArray},
	          	type : 'donut'
	         },
	         donut: {
	        	 title: "서울시 자치구별 아파트 비율"
	         },
	         legend : {position : 'right'},
	       grid: { x: {show: false}, y: { show: true}},
	       size: {height: 600, width: 800}
	   });
}

/* 서울시 자치구별 아파트 건축연도 비율 차트 */

</script>

<body> 
  
서울시 아파트 가격지수 (2017년 11월 기준 : 100)
<div id="indexchart"></div><hr>

서울시 자치구별 아파트 비율 (총 1,679,639채)
<div id="ratiochart"></div>

서울시 자치구별 아파트 건축연도 비율 (1980년 ~ 2020년)
<div id="archchart"></div>

</body>

</html>