package com.multicampus.petdoc.petDoc.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.multicampus.petdoc.petDoc.service.MapService;

@RestController
public class mapController {
	@Inject
	MapService service;
	
	@GetMapping("/map")
	public ModelAndView mapView(ModelAndView mav) {
		mav.setViewName("map/map");
		return mav;
	}
	
}
