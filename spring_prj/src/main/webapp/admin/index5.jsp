<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 

   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="Responsive Web UI Kit &amp; Dashboard Template based on Bootstrap">
   <meta name="author" content="AdminKit">
   <meta name="keywords" content="adminkit, bootstrap, web ui kit, dashboard template, admin template">


<!-- Load c3.css -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.css" rel="stylesheet">

<!-- Load d3.js and c3.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.js"></script>


   
<!-- JGH추가20200811----------------------------------------------S -->
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAw5bpQF-Nyr305E5mnyou25qSQz6KjLo4&callback=initLocation&libraries=&v=weekly" defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #mapdiv {
        height: 100%;
        width: 100%;
      }

      /* Optional: Makes the sample page fill the window. */
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
<!-- JGH추가20200811----------------------------------------------E -->

   <link rel="shortcut icon" href="img/icons/icon-48x48.png" />

   <title>AdminKit Demo - Web UI Kit &amp; Dashboard Template</title>

   <link href="css/app.css" rel="stylesheet">

   
</head>

<body>
   <div class="wrapper">
      <div class="main">
         <main class="content">
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

  
         <footer class="footer">
            <div class="container-fluid">
               <div class="row text-muted">
                  <div class="col-6 text-left">
                     <p class="mb-0">
                     </p>
                  </div>
                  <div class="col-6 text-right">
                     <ul class="list-inline">
                        <li class="list-inline-item">
                           <!--<a class="text-muted" href="#">Support</a>-->
                        </li>
                        <li class="list-inline-item">
                           <!--<a class="text-muted" href="#">Help Center</a>-->
                        </li>
                        <li class="list-inline-item">
                           <!--<a class="text-muted" href="#">Privacy</a>-->
                        </li>
                        <li class="list-inline-item">
                           <a class="text-muted" href="#">Terms</a>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
         </footer>
      
      </div>
   </div>
   

   
   
   <script src="js/vendor.js"></script>
   <script src="js/app.js"></script>

   <script>
      $(function() {
         var ctx = document.getElementById('chartjs-dashboard-line').getContext("2d");
         var gradient = ctx.createLinearGradient(0, 0, 0, 225);
         gradient.addColorStop(0, 'rgba(215, 227, 244, 1)');
         gradient.addColorStop(1, 'rgba(215, 227, 244, 0)');
         // Line chart
         new Chart(document.getElementById("chartjs-dashboard-line"), {
            type: 'line',
            data: {
               labels: ["2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019"],
               datasets: [{
                  label: "매매가격지수",
                  fill: true,
                  backgroundColor: gradient,
                  borderColor: window.theme.primary,
                  data: [
                	  93.4,
                	  93,
                	  86.8,
                	  85.7,
                	  87.4,
                	  93.3,
                	  96.3,
                	  100.8,
                	  108.9,
                	  110.1
                  ]
               }]
            },
            options: {
               maintainAspectRatio: false,
               legend: {
                  display: false
               },
               tooltips: {
                  intersect: false
               },
               hover: {
                  intersect: true
               },
               plugins: {
                  filler: {
                     propagate: false
                  }
               },
               scales: {
                  xAxes: [{
                     reverse: true,
                     gridLines: {
                        color: "rgba(0,0,0,0.0)"
                     }
                  }],
                  yAxes: [{
                     ticks: {
                        stepSize: 50
                     },
                     display: true,
                     borderDash: [3, 3],
                     gridLines: {
                        color: "rgba(0,0,0,0.0)"
                     }
                  }]
               }
            }
         });
      });
   </script>
   
      <script>
      $(function() {
         var ctx = document.getElementById('chartjs-dashboard-line2').getContext("2d");
         var gradient = ctx.createLinearGradient(0, 0, 0, 225);
         gradient.addColorStop(0, 'rgba(215, 227, 244, 1)');
         gradient.addColorStop(1, 'rgba(215, 227, 244, 0)');
         // Line chart
         new Chart(document.getElementById("chartjs-dashboard-line2"), {
            type: 'line',
            data: {
               labels: ["2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019"],
               datasets: [{
                  label: "전세가격지수",
                  fill: true,
                  backgroundColor: gradient,
                  borderColor: window.theme.primary,
                  data: [
                	  66.2,
                	  74.8,
                	  74.8,
                	  81.6,
                	  85.9,
                	  95.2,
                	  97.9,
                	  100.2,
                	  100.2,
                	  99.5
                  ]
               }]
            },
            options: {
               maintainAspectRatio: false,
               legend: {
                  display: false
               },
               tooltips: {
                  intersect: false
               },
               hover: {
                  intersect: true
               },
               plugins: {
                  filler: {
                     propagate: false
                  }
               },
               scales: {
                  xAxes: [{
                     reverse: true,
                     gridLines: {
                        color: "rgba(0,0,0,0.0)"
                     }
                  }],
                  yAxes: [{
                     ticks: {
                        stepSize: 50
                     },
                     display: true,
                     borderDash: [3, 3],
                     gridLines: {
                        color: "rgba(0,0,0,0.0)"
                     }
                  }]
               }
            }
         });
      });
   </script>
   
   <script>
      $(function() {
         // Pie chart
         new Chart(document.getElementById("chartjs-dashboard-pie"), {
            type: 'pie',
            data: {
               labels: [
            	   "종로구",
            	   "중구",
            	   "용산구",
            	   "성동구",
            	   "광진구",
            	   "동대문구",
            	   "중랑구",
            	   "성북구",
            	   "강북구",
            	   "도봉구",
            	   "노원구",
            	   "은평구",
            	   "서대문구",
            	   "마포구",
            	   "양천구",
            	   "강서구",
            	   "구로구",
            	   "금천구",
            	   "영등포구",
            	   "동작구",
            	   "관악구",
            	   "서초구",
            	   "강남구",
            	   "송파구",
            	   "강동구"
            	   ],
               datasets: [{
                  data: [
                	  14530,
                	  24417,
                	  35728,
                	  63976,
                	  30425,
                	  60386,
                	  51475,
                	  71754,
                	  33282,
                	  64580,
                	  161273,
                	  52607,
                	  48277,
                	  66582,
                	  85921,
                	  111811,
                	  77194,
                	  30918,
                	  68984,
                	  59188,
                	  53915,
                	  93299,
                	  124418,
                	  119226,
                	  75473,
                	  ],
                  backgroundColor: [
                     window.theme.primary,
                     window.theme.warning,
                     window.theme.danger
                  ],
                  borderWidth: 7
               }]
            },
            options: {
               responsive: !window.MSInputMethodContext,
               maintainAspectRatio: false,
               legend: {
                  display: false
               },
               cutoutPercentage: 75
            }
         });
      });
   </script>
   <script>
      $(function() {
         // Bar chart
         new Chart(document.getElementById("chartjs-dashboard-bar"), {
            type: 'bar',
            data: {
               labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
               datasets: [{
                  label: "This year",
                  backgroundColor: window.theme.primary,
                  borderColor: window.theme.primary,
                  hoverBackgroundColor: window.theme.primary,
                  hoverBorderColor: window.theme.primary,
                  data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
                  barPercentage: .75,
                  categoryPercentage: .5
               }]
            },
            options: {
               maintainAspectRatio: false,
               legend: {
                  display: false
               },
               scales: {
                  yAxes: [{
                     gridLines: {
                        display: false
                     },
                     stacked: false,
                     ticks: {
                        stepSize: 20
                     }
                  }],
                  xAxes: [{
                     stacked: false,
                     gridLines: {
                        color: "transparent"
                     }
                  }]
               }
            }
         });
      });
   </script>
   <script>
      $(function() {
         $("#world_map").vectorMap({
            map: "world_mill",
            normalizeFunction: "polynomial",
            hoverOpacity: .7,
            hoverColor: false,
            regionStyle: {
               initial: {
                  fill: "#e3eaef"
               }
            },
            markerStyle: {
               initial: {
                  "r": 9,
                  "fill": window.theme.primary,
                  "fill-opacity": .95,
                  "stroke": "#fff",
                  "stroke-width": 7,
                  "stroke-opacity": .4
               },
               hover: {
                  "stroke": "#fff",
                  "fill-opacity": 1,
                  "stroke-width": 1.5
               }
            },
            backgroundColor: "transparent",
            zoomOnScroll: false,
            markers: [{
                  latLng: [31.230391, 121.473701],
                  name: "Shanghai"
               },
               {
                  latLng: [28.704060, 77.102493],
                  name: "Delhi"
               },
               {
                  latLng: [6.524379, 3.379206],
                  name: "Lagos"
               },
               {
                  latLng: [35.689487, 139.691711],
                  name: "Tokyo"
               },
               {
                  latLng: [23.129110, 113.264381],
                  name: "Guangzhou"
               },
               {
                  latLng: [40.7127837, -74.0059413],
                  name: "New York"
               },
               {
                  latLng: [34.052235, -118.243683],
                  name: "Los Angeles"
               },
               {
                  latLng: [41.878113, -87.629799],
                  name: "Chicago"
               },
               {
                  latLng: [51.507351, -0.127758],
                  name: "London"
               },
               {
                  latLng: [40.416775, -3.703790],
                  name: "Madrid"
               }
            ]
         });
         setTimeout(function() {
            $(window).trigger('resize');
         }, 250)
      });
   </script>
   <script>
      $(function() {
         $('#datetimepicker-dashboard').datetimepicker({
            inline: true,
            sideBySide: false,
            format: 'L'
         });
      });
   </script>

<!-- 20200811전경환추가-------------------------------------------------S -->
<script>
//-------------------------------------------
//접속자 현재 위치
//-------------------------------------------
   function initLocation() {
      if (navigator.geolocation) {
      //접속자 현재 위치
         navigator.geolocation.getCurrentPosition(function(pos) {
             var clat = pos.coords.latitude;
             var clng = pos.coords.longitude;
             //alert("현재 위치는 : " + clat + ", "+ clng); 
             initMap(clat, clng);
         });
       } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
            var clat = 37.565858;  //시청 위도
          var clng = 126.976859;   //시청 경도
          initMap(clat, clng);
       }
      
   }


   //-------------------------------------------
   // 구글맵
   //-------------------------------------------
   var map;

   function initMap(clat, clng) {
      //초기에 보여질 맵 그리기
      map = new google.maps.Map(
            document.getElementById("mapdiv"),
            {zoom: 15, center: {lat: clat, lng: clng}
      }); 
      //자신의 접속지 반경으로 마커 그리기
      paintMarker(clat, clng,'','');
   }

   //-------------------------------------------
   // 동검색
   //-------------------------------------------
   $("#searchBtn").click(function(){ 
      if($("#searchStr").val() == "") {
         alert("동이름, 도로명주소, 또는 단지명을 검색하세요");
         $("#searchStr").focus();
      } else {
         var searchKey = $("#searchKey option:selected").val();
         var searchStr = $("#searchStr").val();
         //alert(gu + "," + dong);
         paintMarker('','', searchKey, searchStr); 
      }
   });


   
   //-------------------------------------------
   // 자신의 접속지 or 동검색 : DB의 위경도 가져와 마커그리기
   //-------------------------------------------
   function  paintMarker(clat, clng, searchKey, searchStr) {
      //--------- DB의 위경도 가져와 마커그리기
      $.ajax({
           url : "/googlemap.do",
           method : "GET",  //"POST", "GET",  v1.9.0.이전 type countyName
           contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
           data : "clat=${param.clat}&clng=${param.clng}&searchKey=${param.searchKey}&searchStr=${param.searchStr}",  //***********
           dataType : "json",  //서버로부터 오는 응답 xml, json, script, html
           success : function(resultList){ 
              //console.log("ajax데이터: "+resultList); //
              
               //Map Center 변경
              if (resultList.length>0) {
                 resetCenter = new google.maps.LatLng(resultList[0]["lat"], resultList[0]["lng"]);
                 map.setCenter(resetCenter);                 
              }                                      
              
                 var infowindow = new google.maps.InfoWindow();
                 infowindow.open(map);
                 var marker, i;

               //for (i = 0; i < locations.length; i++) {
               $.map(resultList, function(kkk, i) {
                  
                  marker = new google.maps.Marker({
                     position: new google.maps.LatLng(kkk.lat, kkk.lng),
                     map: map,
                     //label: kkk.apt, 
                  });
                  
    
                  google.maps.event.addListener(marker, 'click', (function(marker, i) {
                     return function() {
                        infowindow.setContent("<a href=/aptview.do?aptStr="+kkk.apt+"&areaStr="+kkk.area+"><b>"+kkk.apt+"</b></a><br>"+kkk.gu+" "+kkk.street);
                        infowindow.open(map, marker);
                     }
                  })(marker, i));
               });   //} //e.o.for
                 //--------------마커출력 -------------  
           } //e.o.success()
         }); //e.o.$.ajax()
   } //e.o.paintMarker()

</script> 
<!-- 20200811전경환추가-------------------------------------------------E -->

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
//리니어 차트 -------------------------------------------------
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
          size: {height: 500, width: 600}
      });
} 
</script>

<script>
/* 서울시 자치구별 아파트 비율 차트 */
$.ajax({  
    url : "/aptratiochart.do",
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
// 도넛 차트 -------------------------------------------------
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
          size: {height: 400, width: 650}
      });
}






</script>

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

</body>

</html>