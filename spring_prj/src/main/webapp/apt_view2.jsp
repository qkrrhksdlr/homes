<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	
	<link href="admin/dist/css/styles.css" rel="stylesheet" />
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	
	<!-- Load c3.css -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.css" rel="stylesheet">
	
	<!-- Load d3.js and c3.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.js" charset="utf-8"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min.js" charset="utf-8"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.js"></script>  
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>   
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<!-- <script src="admin/dist/assets/demo/chart-area-demo.js"></script>
	     <script src="admin/dist/assets/demo/chart-bar-demo.js"></script> -->
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/datatables-demo.js"></script>
	
	<!--End Container-->
	<!--<script src="http://code.jquery.com/jquery.js"></script>-->
	<script src="plugins/jquery/jquery-2.1.0.min.js"></script>
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="plugins/bootstrap/bootstrap.min.js"></script>
	<script src="plugins/justified-gallery/jquery.justifiedgallery.min.js"></script>
	<script src="plugins/tinymce/tinymce.min.js"></script>
	<script src="plugins/tinymce/jquery.tinymce.min.js"></script>
	<!-- All functions for this theme + document.ready processing -->
	<script src="js/devoops.js"></script>  
</head>

<!-- 가격변동차트 그리기 -->
<script>
/* 매매차트 그리기*/
$.ajax({
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

/* 매매차트 함수 */
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

/* 전월세 차트 그리기 */
$.ajax({
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

           })

        printZWLinearChart(aptConym, aptDeposit);
     }
});      

/* 전월세 차트 함수 */
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

<!-- 상세정보 받아오기 -->
<script>
$(document).ready(function(){
   //text형태로 보내고 json으로 받는 케이스 -> 가장 일반적
   $("#btn_id_text").click(function(){ 
      $.ajax({
           url : "/aptview.do",
           method : "GET",  //"POST", "GET",  v1.9.0.이전에는 type
           contentType : 'application/x-www-form-urlencoded; charset=UTF-8',   //요청한글처리, 기본은 그냥 String 
           data : "aptStr="+aptStr+"&areaStr="+areaStr,   //k1=v1 & k2=v2
           dataType : "json",          //서버로부터 오는 응답 xml, json, script, html (아무것도 지정하지 않으면 text나 list가 온다)
           success : function(resultObject) {   //화면리로딩없이 결과띄워라 (resultkkk=콜백결과)
              	console.log(resultObject);
                var str = "";
                
                $.map(resultObject, function(kkk,i) { 
                    console.log(kkk.apt);
                    str += kkk.apt + "<br>";
                });
                	//$("#resdiv").html(resultObject[0]["pharmName"]);
                	$("#resdiv").html(str);
           }
      });
   }); 
});   
</script>

<!-- body 시작 -->
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand">BU DONG SAN</a>
	</nav>

	<div id="layoutSidenav">
	    <div id="layoutSidenav_content">
	       <main>
	           <div class="container-fluid">
	               <h1 class="mt-4">아파트 상세정보</h1>    
	                  <div class="row">
	                       <div class="col-xl-6">
	                          <div class="card mb-4">
	                             <div class="card-header">
	                                 <i class="fas fa-chart-area mr-1"></i>
	                                		 아파트 매매 가격 변화 추이
	                             </div>
	                          <table width="100%" border=1>
	                            <tr>
	                           		<td id="mchart"></td>
	                         	</tr> 			                                                
	                   		  </table>
	                          </div>
	                       </div>
	                       <div class="col-xl-6">
	                         <div class="card mb-4">
	                          <div class="card-header">
	                          	<i class="fas fa-chart-bar mr-1"></i>
	                          		전세 가격 변화 추이		                                
		                      </div>	                            
		                      <table>
		                         <tr>
		                            <td id="zwchart"></td>
		                         </tr>
		                      </table>
	                          </div>
	                       </div>
	                   </div>
	
	           <div class="card mb-4">
	           	<div class="card-header">
	           		<i class="fas fa-table mr-1"></i>
	           				건물 상세정보
	            </div>
	            <div class="card-body">
	            	<div class="table-responsive">
	            		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	            			<!-- 상세정보 표 -->
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
										
							<!-- 상세정보 받아온 값 뿌리기 -->
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
	                   </table>
	                 </div>
	              </div>
	           </div>
	         </div>
	      </main>
		</div>
	</div>
</body>
<!-- body 끝 -->
</html>