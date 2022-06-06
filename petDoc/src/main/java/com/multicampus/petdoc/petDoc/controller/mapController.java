package com.multicampus.petdoc.petDoc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.multicampus.petdoc.petDoc.service.MapService;
import com.multicampus.petdoc.petDoc.vo.MapVO;

@RestController
public class mapController {
	@Inject
	MapService service;
	
	@GetMapping("/map")
	public ModelAndView mapView(ModelAndView mav) {
		mav.setViewName("map/map");
		return mav;
	}
	
	@PostMapping("/sendMapping")
	public List<MapVO> hosInfo(MapVO mapVO) {
		Map<String, Object> map = new HashMap<String, Object>();
		service.filterHos(mapVO);
		System.out.println(mapVO.getWtmX());
		System.out.println(mapVO.getWtmY());
		return service.filterHos(mapVO);
	}
	
}
