<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<!-- head 시작 -->
<head>
<meta charset="UTF-8">
<title>VIEW</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Responsive Web UI Kit &amp; Dashboard Template based on Bootstrap">
<meta name="author" content="AdminKit">
<meta name="keywords" content="adminkit, bootstrap, web ui kit, dashboard template, admin template">

<link href="css/app.css" rel="stylesheet">
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

<!-- script 시작 -->
<!-- Load c3.css -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.css" rel="stylesheet">

<!-- Load d3.js and c3.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.18/c3.min.js"></script>

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAw5bpQF-Nyr305E5mnyou25qSQz6KjLo4&callback=initLocation&libraries=&v=weekly" defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="js/vendor.js"></script>
<script src="js/app.js"></script>
	
<script>
/* 아파트 매매 가격변화 추이 차트 */
$.ajax({
	url : "/aptdealchart.do",
	method : "GET",
	contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
	data : "aptStr=${param.aptStr}&areaStr=${param.areaStr}",
	dataType : "json",
	success : function(jsonObjList) {
		var aptConym = [];
		var aptPrice = [];

		$.map(jsonObjList, function(vv, i) {
			aptConym.push(vv.conym);
			aptPrice.push(vv.price);
		})
		printDealLinearChart(aptConym, aptPrice);
	}
});

/* 매매차트 함수 */
function printDealLinearChart(aptConym, aptPrice) {
	var chart = c3.generate({

		bindto : "#dealchart",
		data : {
			json : {
				x : aptConym,
				매매 : aptPrice
			},
			x : 'x',
			type : 'area'
		},
		grid : {
			x : {
				show : false
			},
			y : {
				show : true
			}
		},
		size : {
			height : 200,
			width : 800
		}
	});

}

/* 아파트 전세 가격변화 추이 차트 */
$.ajax({
	url : "/aptrentchart.do",
	method : "GET",
	contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
	data : "aptStr=${param.aptStr}&areaStr=${param.areaStr}",
	dataType : "json",
	success : function(jsonObjList) {
		var aptConym = [];
		var aptDeposit = [];
		$.map(jsonObjList, function(vv, i) {
			aptConym.push(vv.conym);
			aptDeposit.push(vv.deposit);

		})
		printRentLinearChart(aptConym, aptDeposit);
	}
});

/* 전세 차트 함수 */
function printRentLinearChart(aptConym, aptDeposit) {
	var chart = c3.generate({
		bindto : "#rentchart",
		data : {
			json : {
				x : aptConym,
				전세 : aptDeposit
			},
			x : 'x',
			type : 'area'
		},
		grid : {
			x : {
				show : false
			},
			y : {
				show : true
			}
		},
		size : {
			height : 200,
			width : 800
		}
	});
}
</script>

<!-- 맵그리기 -->
<script>
	/* 접속자 현재 위치 */
	function initLocation() {
	    if (navigator.geolocation) {
	       navigator.geolocation.getCurrentPosition(function(pos) {
	           var clat = pos.coords.latitude;
	           var clng = pos.coords.longitude;
	           initMap(clat, clng);
	       });
	     } else {
	          alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
	          var clat = 37.565858;  //시청 위도
	        var clng = 126.976859;   //시청 경도
	        initMap(clat, clng);
	     }
	}
	
	/* 초기에 보여질 맵 그리기 */
	var map;
	function initMap(clat, clng) {
	      map = new google.maps.Map(
	            document.getElementById("mapdiv"),
	            {zoom: 15, center: {lat: clat, lng: clng}
	      }); 
	      //자신의 접속지 반경으로 마커 그리기
	      paintMarker(clat, clng,'','');
	   }
	
	/* 동검색 */	  
   $("#aptviewBtn").click(function(){ 
         var aptStr = $("#aptStr").val();
         var areaStr = $("#areaStr").val();
         paintMarker('','', aptStr);   
   });
 
   /* 자신의 접속지 or 동검색 : DB의 위경도 가져와 마커그리기 */
   function  paintMarker(clat, clng, aptStr) {
      $.ajax({
           url : "/clickmap.do",
           method : "GET",  
           contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
           data : "clat=${param.clat}&clng=${param.clng}&aptStr=${param.aptStr}",  
           dataType : "json",  
           success : function(resultList){ 
               //Map Center 변경
              if (resultList.length>0) {
                 resetCenter = new google.maps.LatLng(resultList[0]["lat"], resultList[0]["lng"]);
                 map.setCenter(resetCenter);                 
              }         
               
              var infowindow = new google.maps.InfoWindow();
              infowindow.open(map);
              var marker, i;
              
              $.map(resultList, function(kkk, i) {
            	  //마커출력
            	  marker = new google.maps.Marker({
                      position: new google.maps.LatLng(kkk.lat, kkk.lng),
                      map: map,
                   });
                   google.maps.event.addListener(marker, 'click', (function(marker, i) {
                      return function() {
                         infowindow.setContent("<a href=/aptview.do?aptStr="+kkk.apt+"&areaStr="+kkk.area+"><b>"+kkk.apt+"</b></a><br>"+kkk.gu+" "+kkk.street);
                         infowindow.open(map, marker);
                      }
                   })(marker, i));   
               });   	//e.o map
           } 			//e.o success()
         }); 			//e.o $.ajax()
   } 					//e.o paintMarker()
</script>
<!-- script 끝 -->

<!-- body 시작 -->
<body>
	<div class="wrapper">
		<div class="main">
			<main class="content">
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
				<!-- 맵 그리기 -->
				<div class="row">
					<div class="col-12 col-md-12 col-xxl-12 d-flex order-3 order-xxl-2">
						<div class="card flex-fill w-100">
							<div class="card-header">
								<h5 class="card-title mb-0">
									<b>검색 지역 아파트 위치 정보</b>
								</h5>
							</div>
							<div class="card-body px-4">
								<div id="mapdiv" style="height: 500px"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- e.o 맵 -->
				<!-- 상세정보 -->
				<div class="row">
					<div class="col-12 col-md-12 col-xxl-12 d-flex order-3 order-xxl-2">
						<div class="card flex-fill w-100">
							<div class="card-header">
								<i class="fas fa-table mr-1"></i> <b>아파트 단지 상세정보</b>
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
				</div>
				<!-- e.o 상세정보 -->
				<!-- 아파트 가격변화 추이 차트 -->
				<div class="row">
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area mr-1"></i> 
								<b>아파트 매매 가격 변화 추이</b>
							</div>
							<!-- 매매 차트 그리기 -->
							<table>
								<tr>
									<td id="dealchart"></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar mr-1"></i> 
								<b>아파트 전세 가격 변화 추이 </b>
							</div>
							<!-- 전세 차트 그리기 -->
							<table>
								<tr>
									<td id="rentchart"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!-- e.o 아파트 가격변화 추이 차트 -->
			</main>
		</div>
	</div>
</body>
<!-- body 끝 -->
</html>