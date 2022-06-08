$(function(){
	$('.close').on('click',function(){
		
	})
});


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level: 4 // 지도의 확대 레벨 
	};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var geocoder = new kakao.maps.services.Geocoder()// 좌표계 변환 객체를 생성합니다
console.log('처음', map.getCenter());
let currentLat;
let currentLng;
let locPosition;

function successPos(position) {
	currentLat = position.coords.latitude, // 위도
		currentLng = position.coords.longitude; // 경도
	console.log('currentLat', currentLat);
	console.log('currentLng', currentLng);
	locPosition = new kakao.maps.LatLng(currentLat, currentLng) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		, myTitle = '내 위치'; // 인포윈도우에 표시될 내용입니다
	map.setCenter(locPosition);
	console.log('지금', map.getCenter(locPosition));
	// 마커와 인포윈도우를 표시합니다
	displayMarker(locPosition, myTitle);

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
		
		$.ajax({
			url:url,
			type: 'POST',
			data: data,
			success: function(result) {
				alert('전송 성공했습니다.');
				console.log('result', result);
				console.log('result[0].hos_name', result[0].hos_name);
				console.log("중심점: ", map.getCenter());
				for(let i=0; i<result.length; i++) {
					let coords = new kakao.maps.Coords(result[i].hos_areaX*2.5, result[i].hos_areaY*2.5).toLatLng();
					console.log('coords'+i,coords); 
					console.log('center', map.getCenter());
					console.log('locPosition', locPosition);
					map.setCenter(locPosition);
					circlePos(locPosition, coords, result[i].hos_name);
				}
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

function startPos() {
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(successPos);

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
			message = '<div style="padding:5px;">geolocation을 사용할수 없어요..</div>'; // 인포윈도우에 표시될 내용입니다

		displayMarker(locPosition, message);
	}
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(markerPos, title) {

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map: map,
		position: markerPos
	});

	marker.setMap(map);

	var iwContent = title, // 인포윈도우에 표시할 내용
		iwRemoveable = false;

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		content: iwContent,
		removable: iwRemoveable
	});
	
	let hosAddr = addrSearch(markerPos, "all");
	
	let overlay = displayOverlay(markerPos, title, hosAddr);

	infowindow.open(map, marker);

	overlay.setMap(map);
	overlay.setVisible(false);
	console.log(overlay.getVisible());
	
	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	kakao.maps.event.addListener(marker, 'click', function() {
		if (overlay.getVisible() == true) {
			overlay.setVisible(false);
			infowindow.open(map, marker);
		}
		else if (overlay.getVisible() == false) {
			overlay.setVisible(true);
			infowindow.close();
		} else {
			alert("error");
		}
	});

}

function displayOverlay(markerPos, hosName, hosAddress) {
	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	// 별도의 이벤트 메소드를 제공하지 않습니다 
	var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            hosName + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis"> 안녕 디지몬'+hosAddress+'</div>' + 
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';

	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	let overlay = new kakao.maps.CustomOverlay({
		content: content,
		map: map,
		position: markerPos
	});
	overlay.setMap(null);
	
	return overlay;
}

function circlePos(posCenter, hosPos, hosName, hosAddr) {
	// 원(Circle)의 옵션으로 넣어준 반지름
	var radius = 1000;
	console.log(radius);
	// 마커들이 담긴 배열
		var c1 = posCenter;
		var c2 = hosPos;
		var polyline = new kakao.maps.Polyline({
			path:[c1, c2]
		});
		var dist = polyline.getLength(); // m 단위로 리턴
		if (dist < radius) {
			displayMarker(hosPos, hosName, hosAddr);
		}
}

function addrSearch(coord, addrArea) {
	if(addrArea === "all") {
		return geocoder.coord2Address(coord.getLng(), coord.getLat(), printAddrAll);
	}else if(addrArea === "si_do") {
		return geocoder.coord2Address(coord.getLng(), coord.getLat(), printAddrSido);
	}else if(addrArea === "gu") {
		return geocoder.coord2Address(coord.getLng(), coord.getLat(), printAddrGu);
	}else if(addrArea === "dong") {
		return geocoder.coord2Address(coord.getLng(), coord.getLat(), printAddrDong);
	}
}


function printAddrAll(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		console.log("전체주소: ", result[0].address.address_name);
		return result[0].address.address_name;
	}
};

function printAddrSido(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		console.log("전체주소: ", result[0].address.address_name);
		return result[0].road_address.region_1depth_name;
	}
};

function printAddrGu(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		console.log("전체주소: ", result[0].address.address_name);
		return result[0].road_address.region_2depth_name;
	}
};
function printAddrDong(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		console.log("전체주소: ", result[0].address.address_name);
		return result[0].road_address.region_3depth_name;
	}
};

	
window.onload = startPos();