<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<!-- head 시작 -->
<head>
<title>MAIN</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Responsive Web UI Kit &amp; Dashboard Template based on Bootstrap">
<meta name="author" content="A +dminKit">
<meta name="keywords" content="adminkit, bootstrap, web ui kit, dashboard template, admin template">

<link href="css/app.css" rel="stylesheet"> 
<!-- map 스타일 -->
<style type="text/css">
      #mapdiv {
        height: 100%;
        width: 100%;
      }
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
</head>
<!-- head 끝 -->

<!-- script 시작 -->
<!-- Load c3.css -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.css" rel="stylesheet">

<!-- Load d3.js and c3.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAw5bpQF-Nyr305E5mnyou25qSQz6KjLo4&callback=initLocation&libraries=&v=weekly" defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="js/vendor.js"></script>
<script src="js/app.js"></script>
	


<!-- 서울시 아파트 매매 가격변화 추이 차트 -->
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

<!-- 서울시 아파트 전세 가격변화 추이 차트 -->
<script>
      $(function() {
         var ctx = document.getElementById('chartjs-dashboard-line2').getContext("2d");
         var gradient = ctx.createLinearGradient(0, 0, 0, 225);
         gradient.addColorStop(0, 'rgba(244, 179, 80, 1)');
         gradient.addColorStop(1, 'rgba(244, 179, 80, 0)');
         // Line chart
         new Chart(document.getElementById("chartjs-dashboard-line2"), {
            type: 'line',
            data: {
               labels: ["2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019"],
               datasets: [{
                  label: "전세가격지수",
                  fill: true,
                  backgroundColor: gradient,
                  borderColor: "rgba(242, 121, 53, 1)",
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
          printRatioChart(dataJson, keyArray);
    }
});

/* 도넛 차트 함수 */
function printRatioChart(dataJson, keyArray) { 
   var chart = c3.generate({
         bindto: "#ratiochart",
          data: {   
                json: [dataJson],
               keys: {value: keyArray},
                type : 'donut'
            },
            donut: {
               title: "자치구별 아파트 비율"
            },
            legend : {position : 'bottom'},
          grid: { x: {show: false}, y: { show: true}},
          size: {height: 400, width: 500}
      });
}
</script>
<!-- 서울시 자치구별 아파트 건축연도 비율 차트 -->
<script>
$.ajax({
    url : "/aptarchchart.do", 
    method : "GET",  
    contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
    dataType : "json",  
    success : function(jsonObjList){
       var dataJson = {};   
       var keyArray = []; 
       
       $.map(jsonObjList, function(vv, i){
          dataJson[vv.gu] = (vv.y1990_1999);
          keyArray.push(vv.gu);          
          })  
          printArchChart(dataJson, keyArray);
    }
});

function printArchChart(dataJson, keyArray) { 
   var chart = c3.generate({
         bindto: "#archchart",
          data: {   
                json: [dataJson],
               keys: {value: keyArray},
                type : 'donut'
            },
            donut: {
               title: "준공 20~30년 아파트 비율"
            },
            legend : {position : 'bottom'},
          grid: { x: {show: false}, y: { show: true}},
          size: {height: 400, width: 500}
      });
}
</script>
<!-- script 끝 -->

<!-- body 시작 -->
<body>
	<div class="wrapper">
		<div class="main">
			<main class="content">
			<div class="container-fluid p-0">
				<div class="row mb-2 mb-xl-3">
					<div class="col-auto d-none d-sm-block">
						<h3>
							<strong>ISLAND 서울시 아파트 실거래 및 가격 지수 정보 시스템 </strong>
						</h3>
					</div>
				</div>
				<div class="row">
					<div id="infodiv" style="float: left">
						찾고싶은 지역구를 선택한 후 검색어를 입력하세요. (검색어: 도로명주소 or 동 or 아파트명)
						<!-- 검색 -->
						<form name="searchform" method="get" action="/aptlist.do">
							<select name="searchKey" id="searchKey">
								<option value="강남구">강남구</option>
								<option value="강동구">강동구</option>
								<option value="강북구">강북구</option>
								<option value="강서구">강서구</option>
								<option value="관악구">관악구</option>
								<option value="광진구">광진구</option>
								<option value="구로구">구로구</option>
								<option value="금천구">금천구</option>
								<option value="노원구">노원구</option>
								<option value="도봉구">도봉구</option>
								<option value="동대문구">동대문구</option>
								<option value="동작구">동작구</option>
								<option value="마포구">마포구</option>
								<option value="서대문구">서대문구</option>
								<option value="서초구">서초구</option>
								<option value="성동구">성동구</option>
								<option value="성북구">성북구</option>
								<option value="송파구">송파구</option>
								<option value="양천구">양천구</option>
								<option value="영등포구">영등포구</option>
								<option value="용산구">용산구</option>
								<option value="은평구">은평구</option>
								<option value="종로구">종로구</option>
								<option value="중구">중구</option>
								<option value="중랑구">중랑구</option>
							</select> 
							<input type="text" name="searchStr" id="searchStr"> 
							<input type="submit" id="searchBtn" value="검색">
						</form>
						<hr><br>
					</div>
				</div>	
				<!-- e.o 검색 -->
				<!-- 차트 그리기 -->
				<div class="row">	
					<div class="col-12 col-xl-6 col-xxl-6 d-flex">
						<div class="w-100">

							<div class="row">	
								<div class="col-sm-12 col-xxl-12">
									<div class="card">
										<div class="card-header">
											<h5 class="card-title mb-0">
												<span style = " font-size:1.5em;  color: black;"> <b>서울시 아파트 매매가격지수 (2017.11=100 기준)</b> </span>
											</h5>
										</div>
										<div class="card-body py-3">
											<div class="chart chart-sm">
												<canvas id="chartjs-dashboard-line"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 아파트 전세 가격지수 차트-->
							<div class="row">
								<div class="col-sm-12 col-xxl-12">
									<div class="card">
										<div class="card-header">
											<h5 class="card-title mb-0">
												<span style = " font-size:1.5em;  color: black;"> <b>서울시 아파트 전세가격지수 (2017.11=100 기준)</b> </span>
												</h5>
										</div>
										<div class="card-body py-3">
											<div class="chart chart-sm">
												<canvas id="chartjs-dashboard-line2"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

						<!-- 자치구별 아파트 비율 차트 -->
						<div class="col-12 col-xl-6 col-xxl-3 d-flex order-2 order-xxl-6">
						
							<div class="card flex-fill w-100">
								<div class="card-header">
									<h5 class="card-title mb-0">
										<span style = " font-size:1.5em;  color: black;"> <b>서울시 자치구별 아파트 비율 (총 1,679,639채)</b> </span>
										</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										<div class="py-3">
											<!-- 차트 -->
											<div class="chart chart-xs">
												<div id="ratiochart"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>	
						<!-- 20~30년 아파트 비율 차트 -->
						<div class="col-12 col-xl-6 col-xxl-3 d-flex order-2 order-xxl-6">
							<div class="card flex-fill w-100">
								<div class="card-header">
									<h5 class="card-title mb-0">
										<span style = " font-size:1.5em;  color: black;"> <b>서울시 자치구별 준공 20~30년 아파트 비율(1990-1999)</b> </span>
										</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										<div class="py-3">
											<!-- 차트 -->
											<div class="chart chart-xs">
												<div id="archchart"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
									
				</div>
				<!-- e.o 차트 그리기 -->
				
				<!-- 오늘의 부동산 뉴스 -->
				<div class="row">
					<div class="col-12 col-md-12 col-xxl-12 d-flex order-3 order-xxl-2">
						<div class="card flex-fill w-100">
							<div class="card-header">
								<i class="fas fa-table mr-1"></i> 
								<span style = " font-size:1.5em;  color: black;"> <b>Today 부동산 시장동향 뉴스</b> </span>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<!-- column -->
										<tr>
											<td>이미지</td>
											<td>기사제목</td>
											<td>내용</td>
											<td>출처</td>
											<td>날짜</td>
										</tr>

										<!-- 뉴스받아온 값 뿌리기 -->
										<c:forEach items="${NEWSLISTKKK}" var="vo">
											<tr>
												<td><img src="${vo.img}" width="245" height="138"></td>
												<td><a href="${vo.url}">${vo.title}</a></td>
												<td>${vo.contents}</td>
												<td>${vo.writing}</td>
												<td>${vo.date}</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- e.o 오늘의 부동산 뉴스 -->
			
			</main>
		</div>
	</div>
</body>
<!-- body 끝 -->
</html>

