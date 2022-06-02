package com.multicampus.petdoc.petDoc.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.multicampus.petdoc.petDoc.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	BoardDAO dao;
}
