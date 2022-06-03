// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
var mapContainer = document.getElementById('map') // 지도를 표시할 div


function locationLoadSuccess(pos) {
	// 현재 위치 받아오기
	var currentPos = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
	
	
	var mapOption = {
		center: currentPos, // 지도의 중심좌표
		level: 3, // 지도의 확대 레벨
		mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
	};
	// 지도를 생성한다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
	map.panTo(currentPos);

	// 마커 생성
	var marker = new kakao.maps.Marker({
		position: currentPos
	});
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();
	
		
	// 기존에 마커가 있다면 제거
	marker.setMap(null);
	marker.setMap(map);

	// 지도에 표시할 원을 생성합니다
	var circle = new kakao.maps.Circle({
		center: currentPos,  // 원의 중심좌표 입니다 
		radius: 250, // 미터 단위의 원의 반지름입니다 
		strokeWeight: 5, // 선의 두께입니다 
		strokeColor: '#75B8FA', // 선의 색깔입니다
		strokeOpacity: 0.5, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		strokeStyle: 'solid', // 선의 스타일 입니다
		fillColor: '#CFE7FF', // 채우기 색깔입니다
		fillOpacity: 0.7  // 채우기 불투명도 입니다   
	});
	
	// 지도에 원을 표시합니다 
	circle.setMap(map);
	
	
	ps.keywordSearch('병원', placesSearchCB, {
	    radius : 250,
	    location: currentPos
}); 
};

function locationLoadError(pos) {
	alert('위치 정보를 가져오는데 실패했습니다.');
};

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}



// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}


// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}

// 위치 자동으로 가져오기
window.onload = function() {
	navigator.geolocation.getCurrentPosition(locationLoadSuccess, locationLoadError);
} 