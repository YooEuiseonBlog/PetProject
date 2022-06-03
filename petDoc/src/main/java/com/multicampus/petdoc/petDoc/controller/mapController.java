package com.multicampus.petdoc.petDoc.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.multicampus.petdoc.petDoc.service.MapService;

@Controller
public class mapController {
	@Inject
	MapService service;
	
	@GetMapping("/map")
	public String moveToMap() {
		return "map/map";
	}
	@GetMapping("/map2")
	public String moveToMap2() {
		return "map/map2";
		
	}
}
