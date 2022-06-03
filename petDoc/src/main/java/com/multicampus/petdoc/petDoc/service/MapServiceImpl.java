package com.multicampus.petdoc.petDoc.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.multicampus.petdoc.petDoc.dao.MapDAO;

@Service
public class MapServiceImpl implements MapService {
	@Inject
	MapDAO dao;
	

}
