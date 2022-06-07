<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- core 태그 임포트  -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- formatting 태그 임포트 -->
<link href="/css/map.css" rel="stylesheet" type="text/css"/>
<div class="map-container">
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9b90b79fe1be3a3a9d53c2e3eabaf8e5&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="/js/map3.js"></script>
<button type="button" class="getMyPosition" onclick="startPos()">내 현위치 추적</button>
</div>

<script>
window.onload=function(){
	document.querySelector('#menu_1').classList.remove('active');
	document.querySelector('#menu_4').classList.add('active');
};
</script>