<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- API key=AIzaSyAP3ZcS764xg-pjnhT7-KdsdndQv8N9KOI -->
<!-- 서울 시청: 37.566518, 126.978168 -->
    
    <!DOCTYPE html>
<html> 
<head>
<title>Lat/Lng Object Literal</title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAP3ZcS764xg-pjnhT7-KdsdndQv8N9KOI&callback=initLocation&libraries=&v=weekly" defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #mapdiv {
        height: 100%;
        width: 60%
      }

      /* Optional: Makes the sample page fill the window. */
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>

</head>
<body>
<div id="mapdiv" style="float:left"></div>
<div id="infodiv"  style="float:left">
<form>
<select name="searchKey" id="searchKey">
	<option value ="강남구">강남구</option>
	<option value ="강동구">강동구</option>
	<option value ="강북구">강북구</option>
	<option value ="강서구">강서구</option>
	<option value ="관악구">관악구</option>
	<option value ="광진구">광진구</option>
	<option value ="구로구">구로구</option>
	<option value ="금천구">금천구</option>
	<option value ="노원구">노원구</option>
	<option value ="도봉구">도봉구</option>
	<option value ="동대문구">동대문구</option>
	<option value ="동작구">동작구</option>
	<option value ="마포구">마포구</option>
	<option value ="서대문구">서대문구</option>
	<option value ="서초구">서초구</option>
	<option value ="성동구">성동구</option>
	<option value ="성북구">성북구</option>
	<option value ="송파구">송파구</option>
	<option value ="양천구">양천구</option>
	<option value ="영등포구">영등포구</option>
	<option value ="용산구">용산구</option>
	<option value ="은평구">은평구</option>
	<option value ="종로구">종로구</option>
	<option value ="중구">중구</option>
	<option value ="중랑구">중랑구</option>
</select>
	<input type ="text" name="searchStr" id="searchStr">
	<input type ="submit" id="searchBtn" value="검색">
</form>
<br>
아파트 정보

</div>

<script>
//-------------------------------------------
//접속자 현재 위치
//-------------------------------------------
function initLocation() {
    if(navigator.geolocation) {
    	navigator.geolocation.getCurrentPosition(function(pos) {
        	var clat = pos.coords.latitude;
        	var clng = pos.coords.longitude;
//        	alert("현재 위치는  " +clat + ", "+ clng);
        	initMap(clat, clng);
    	});
    } else {
        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
         var clat = 37.517421;  	//강남구청 위도
		 var clng = 127.047427;	 	//강남구청 경도	

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
			{
				zoom: 15,
				center: {lat: clat,lng: clng}
			});
	//자신의 접속지 반경으로 마커 그리기
	paintMarker(clat, clng,'','');
}

//-------------------------------------------
// 동검색
//-------------------------------------------

$("#searchBtn").click(function(){ 
	if($("#searchStr").val() == "") {
		alert("검색어를 입력하세요");
		$("#searchStr").focus();
	} else {
		//var cityCode = $("#cityCode").val();
		var searchKey = $("#searchKey").val();
		var searchBtn= $("#searchBtn").val();
		
		paintMarker('','', searchKey, searchBtn); 
	}
});



//-------------------------------------------
// 자신의 접속지 or 동검색 : DB의 위경도 가져와 마커그리기
//-------------------------------------------


function  paintMarker(clat, clng, searchKey, searchBtn) {
//----------------------DB의 위경도 가져와 마커 그리기: 비동기 통신 필요-------------------	
	$.ajax({
		  url : "/aptlist",
		  method : "get", 
		  contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
		  data : "&apt="+apt+"clat="+clat+"&clng="+clng, 
		  dataType : "json",  
		  success : function(resultList){ 
			  console.log(resultList);					//여기 까지 DB 가져오는 역할
			  
		  },
		  error : function(request, status, error) {
			  console.log("error");
		  
 			  //----------마커 출력 ------------
			  var locations = [				//약국명, 위도, 경도, ___
			      ['삼성현대힐스테이트1단지아파트', 37.516656, 127.048388, 4],
			      ['삼성 롯데캐슬 프리미어 아파트', 37.515107, 127.044847, 5],
			      ['한솔아파트', 37.517269, 127.045662, 3],
			      ['청담대림E편한세상아파트', 37.520793, 127.045086, 2],
			      ['청담래미안아파트', 37.517864, 127.042701, 1]
			    ];

			  	var infowindow = new google.maps.InfoWindow();			//infowindow : 마커 클릭했을 때 뜨는 표시
			  	infowindow.open(map);
			  	var marker, i;

				for (i = 0; i < locations.length; i++) {  
					marker = new google.maps.Marker({
						position: new google.maps.LatLng(locations[i][1], locations[i][2]),			//어디에 보여줄 것인가?
						map: map,
						label: locations[i][0],
					});

					google.maps.event.addListener(marker, 'click', (function(marker, i) {			//제대로 되는지 감시
						return function() {
							infowindow.setContent(locations[i][0]);
							infowindow.open(map, marker);
						}
					})(marker, i));
				} //e.o.for
			  //--------------마커 출력 --------------
		  }  //e.o.success()
	}); //e.o.$.ajax()
} //e.o.paintMarker()	

</script>

</body>
</html>