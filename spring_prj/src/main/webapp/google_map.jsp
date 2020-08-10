<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!-- 
AIzaSyAw5bpQF-Nyr305E5mnyou25qSQz6KjLo4
 -->
<!DOCTYPE html>
<html>
<head>
<h1>서울시 아파트 실거래 정보 찾기</h1>
<title>서울시 구 선택 > 도로명주소 or 동 or 아파트명 입력 > 검색</title>

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAw5bpQF-Nyr305E5mnyou25qSQz6KjLo4&callback=initLocation&libraries=&v=weekly" defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #mapdiv {
        height: 90%;
        width: 50%;
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

<div id="infodiv"  style="float:left">
찾고싶은 지역구를 선택한 후 검색어를 입력하세요.
(검색어: 도로명주소 or 동 or 아파트명)

<form name="searchform" method="get" action="/aptlist.do">
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
dfdkfd
dfdfd



<table border="1" width="900" cellpadding="0" cellspacing="0">

	<tr>
		<td><b>단지명 - 전용면적(㎡)</b></td>
		<td><b>도로명 주소</b></td>
		<td><b>법정동</b></td>
	</tr>



<!-- MYLISTKKKKK에서 리스트 가져와서 vo에 담아줘 -->
<c:forEach items="${APTLISTKKK}" var="vo">
	<tr>
	  	<td><a href="/aptview.do?aptStr=${vo.apt}&areaStr=${vo.area}">${vo.apt} - ${vo.area}㎡</a></td>
		<td>${vo.gu} ${vo.street}</td>
		<td>${vo.dong}</td>
	</tr>
</c:forEach>

</table>
<br><br><br>
</div>


<div id="mapdiv" style="float:right"></div>

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
//			    alert("현재 위치는 : " + clat + ", "+ clng); 
			    initMap(clat, clng);
			});
		 } else {
	         alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
	         var clat = 37.565858;  //시청 위도
			 var clng = 126.976859;	//시청 경도
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
			alert("동이름을 검색하세요");
			$("#searchStr").focus();
		} else {
			//var cityCode = $("#cityCode").val();
			var gu = $("#searchKey option:selected").val();
			var dong = $("#searchStr").val();
			alert(gu + "," + dong);
			paintMarker('','', gu, dong); 
		}
	});

	//-------------------------------------------
	// 자신의 접속지 or 동검색 : DB의 위경도 가져와 마커그리기
	//-------------------------------------------
	function  paintMarker(clat, clng, searchKey, searchStr) {
		//--------- DB의 위경도 가져와 마커그리기
		$.ajax({
			  url : "/aptlist.do",
			  method : "get",  //"POST", "GET",  v1.9.0.이전 type countyName
			  contentType : 'application/x-www-form-urlencoded; charset=UTF-8',  
			  data : "clat="+clat+"&clng="+clng+"&searchKey="+gu+"&searchStr="+dong,  //***********
			  dataType : "json",  //서버로부터 오는 응답 xml, json, script, html
			  success : function(resultList){ 
				  console.log(resultList); //
				  
				  //--------------마커출력 -------------
				  //var locations = [
				  //    ['Bondi Beach', -33.890542, 151.274856, 4],
				  //    ['Coogee Beach', -33.923036, 151.259052, 5],
				  //    ['Cronulla Beach', -34.028249, 151.157507, 3],
				  //    ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
				  //    ['Maroubra Beach', -33.950198, 151.259302, 1]
				  //  ];
	
				  
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
							position: new google.maps.LatLng(kkk.lat, kkk.lng), 	//(locations[i][1], locations[i][2]),
							map: map,
							label: kkk.apt,	//locations[i][0],
						});
	
						google.maps.event.addListener(marker, 'click', (function(marker, i) {
							return function() {
								infowindow.setContent(kkk.apt+"<br>"+kkk.dong);			//(locations[i][0]);
								infowindow.open(map, marker);
							}
						})(marker, i));
					});	//} //e.o.for
				  	//--------------마커출력 -------------  
			  } //e.o.success()
			}); //e.o.$.ajax()
	} //e.o.paintMarker()


</script>


</body>
</html>