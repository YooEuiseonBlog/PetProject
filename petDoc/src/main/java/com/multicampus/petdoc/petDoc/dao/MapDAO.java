package com.multicampus.petdoc.petDoc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.multicampus.petdoc.petDoc.vo.MapVO;

@Mapper
@Repository
public interface MapDAO {
	List<MapVO>filterHos(MapVO mapVO);
}
