package com.exe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.RestaurantBookingDTO;
import com.exe.dto.RestaurantDTO;

public class RestaurantDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	
	//������� ������ ����
	public RestaurantDTO getReadResDetail(String resName) {
		
		RestaurantDTO dto = sessionTemplate.selectOne("resmapper.getReadResDetail",resName);
		
		return dto;
	}
	
	//�����μ�Ʈ
	public void insertResBooking(RestaurantBookingDTO dto) {
		
		sessionTemplate.insert("resmapper.insertResBooking",dto);
	}
	
	//���༿��
	public RestaurantBookingDTO getReadResBooking(String resBookNo){
		
		RestaurantBookingDTO dto = 
				sessionTemplate.selectOne("resmapper.getReadResBooking",resBookNo);
		
		return dto;
	}
	
	
	

}
