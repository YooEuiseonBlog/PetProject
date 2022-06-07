var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨 
	};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var geocoder = new kakao.maps.services.Geocoder()// 좌표계 변환 객체를 생성합니다
console.log('처음', map.getCenter());
let currentLat;
let currentLng;

function successPos(position) {
	currentLat = position.coords.latitude, // 위도
			currentLng = position.coords.longitude; // 경도
		console.log('currentLat', currentLat);
		console.log('currentLng', currentLng);
		let locPosition = new kakao.maps.LatLng(currentLat, currentLng) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			//,message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
		
		map.setCenter(locPosition);
		console.log('지금',map.getCenter(locPosition));
		
		// 마커와 인포윈도우를 표시합니다
		//displayMarker(locPosition, message);
		
		transAddr1(map.getCenter());
}

// WGS84좌표를 WTM으로 변환합니다.
function transAddr1(centerPos) {	
	let lng = centerPos.getLng();
	let lat = centerPos.getLat();
	
	geocoder.transCoord(lng, lat, sendPos, {
		input_coord: kakao.maps.services.Coords.WGS84, // 변환을 위해 입력한 좌표계 입니다
		output_coord: kakao.maps.services.Coords.WTM // 변환 결과로 받을 좌표계 입니다
	});
}

function sendPos(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		console.log('wtmX',result[0].x); // 203395.50000000093
		console.log('wtmY',result[0].y); // 460178.99999999907
		
		let wtmY = result[0].y;
		let wtmX = result[0].x;
		let url = "/sendMapping";
		let data = {wtmX:wtmX, wtmY:wtmY};
		let message = '<div style="padding:5px"> wtmX: '+wtmX+'wtmY: '+wtmY+'</div>';
		
		//WCongnamul(wcong) = = wtm * 2.5 
		let wtmPos = new kakao.maps.Coords(wtmX*2.5, wtmY*2.5);
		displayMarker(wtmPos, message);
		
		$.ajax({
			url:url,
			type: 'POST',
			data: data,
			success: function(result) {
				alert('전송 성공했습니다.');
				console.log('result[0]', result[0]);
				console.log('result[0].hos_name', result[0].hos_name);
				console.log('result[0].')
				console.log("중심정: ", map.getCenter());
			}, 
			error: function(error) {
				alert('전송 실패하였습니다');
			}
			
		});
	}
	else {
		alert('sendPos에 reuslt값을 받는 데에서 오류가 발생했습니다.');
	}
};

// 좌표 변환 결과를 받아서 처리할 콜백함수 입니다.
function transCoordCB(result, status) {

    // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {
		displayMarker(position, message);
       
    }
}


function startPos() {
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(successPos);

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
			message = '<div style="padding:5px;">geolocation을 사용할수 없어요..</div>'; // 인포윈도우에 표시될 내용입니다

		displayMarker(locPosition, message);
	}
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map: map,
		position: locPosition
	});
	
	
	marker.setMap(null);
	marker.setMap(map);
	
	var iwContent = message, // 인포윈도우에 표시할 내용
		iwRemoveable = true;

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		content: iwContent,
		removable: iwRemoveable
	});
	
	infowindow.open(map, marker);
	
}

function circlePos(posCenter, hosPos) {
	// 원(Circle)의 옵션으로 넣어준 반지름
	var radius = 500;

	// 마커들이 담긴 배열
	markers.forEach(function(m) {
		var c1 = map.getCenter();
		var c2 = m.getPosition();
		var poly = new Polyline({
			// map: map, 을 하지 않아도 거리는 구할 수 있다.
			path: [c1, c2]
		});
		var dist = poly.getLength(); // m 단위로 리턴

		if (dist < radius) {
			m.setMap(map);
		} else {
			m.setMap(null);
		}
	});
}


window.onload = startPos();