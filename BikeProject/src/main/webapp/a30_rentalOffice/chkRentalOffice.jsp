<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>대여소 조회</title>
	<script>
		const kakaoMapMarker = obj => {
		  // 지도 표시 영역
		  let mapContainer = document.querySelector('#map') 

		  // 지도 옵션
		  let mapOption = {
		    // 지도 중심좌표
		    center: new kakao.maps.LatLng(37.51037979, 126.8667984),

		    // 지도 확대 레벨
		    level: 3,
		  }

		  // 지도를 표시할 div와 지도 옵션으로 지도를 생성
		  let map = new kakao.maps.Map(mapContainer, mapOption)

		  // 위치 정보 저장
		  let positions = obj.map(item => ({
		    title: item.RENT_NM,
		    latlng: new kakao.maps.LatLng(item.STA_LAT, item.STA_LONG),
		  }))

		  // 이미지 마커 경로
		  let imageSrc = `https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png`

		  // 이미지 마커 표시
		  positions.forEach(position => {
		    let imageSize = new kakao.maps.Size(24, 35)

		    let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize)

		    // 마커 생성
		    let marker = new kakao.maps.Marker({
		      map: map,
		      position: position.latlng,
		      title: position.title,
		      image: markerImage,
		    })
		    })
		}

		// 따릉이 대여소 데이터 받기
		const getData = async () => {
		  let res = await fetch(`http://openapi.seoul.go.kr:8088/79585644486d697238307058597265/json/tbCycleStationInfo/1/1000/`)
		  let data = await res.json()
		  console.log(data)
		  let rows = data.stationInfo.row

		  kakaoMapMarker(rows) // 대여소 위치데이터를 카카오 마커를 보여주는 함수에 전달
		}

		getData()
	</script>
</head>

<body>
	
	<div id="map" style="width:100%;height:700px;"></div>

	<!-- kakao Map Api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91e22fb67ec6ac7eabb75fa26b7d3d4d"></script>
	<script src="bikeAndMap.js"></script>
	
</body>

</html>





