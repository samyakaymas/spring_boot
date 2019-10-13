package com.mobile.mobile.service;

import java.util.List;
import java.util.Map;

import com.mobile.mobile.dao.CanvasjsChartDao;
 
public interface CanvasjsChartService {
 
	List<List<Map<Object, Object>>> getCanvasjsChartData();
	void setCanvasjsChartDao(CanvasjsChartDao canvasjsChartDao);
 
}
 
 