package com.multicampus.petdoc.petDoc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.multicampus.petdoc.petDoc.dao.MapDAO;
import com.multicampus.petdoc.petDoc.vo.MapVO;

@Service
public class MapServiceImpl implements MapService {
	@Inject
	MapDAO dao;

	@Override
	public List<MapVO> filterHos(MapVO mapVO) {
		return dao.filterHos(mapVO);
	}
}
