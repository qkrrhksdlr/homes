<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!-- 
	ffd182830672c5d5845863e11ff0c193
 -->
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>다음 지도 API</title>
</head>
<body>
	<div id="map" style="width:700px;height:600px;"></div>

	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=ffd182830672c5d5845863e11ff0c193"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.565716, 126.977108), // 지도의 중심좌표
		        level: 4, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도 중심 좌표 변화 이벤트를 등록한다
		kakao.maps.event.addListener(map, 'center_changed', function () {
			console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');
		});

	</script>
</body>
</html>