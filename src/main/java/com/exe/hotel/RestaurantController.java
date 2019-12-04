package com.exe.hotel;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exe.dao.RestaurantDAO;
import com.exe.dto.RestaurantBookingDTO;
import com.exe.dto.RestaurantDTO;

@Controller
public class RestaurantController {
	
	@Autowired
	//@Qualifier("RestaurantDAO")
	RestaurantDAO dao;
	
	//----------------------------------------------------------------------------
	
	//������� ����
	@RequestMapping(value = "/restaurantMain.action", method = RequestMethod.GET)
	public String restaurantMain() {

		return "restaurantMain";
	}
	
	//������� ������������ ����
	@RequestMapping(value = "/res-details.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView resDetails(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		String resName = request.getParameter("resName");
			
		RestaurantDTO dto = dao.getReadResDetail(resName);
			
		ModelAndView mav = new ModelAndView();
			
		mav.setViewName("res-details");
			
		mav.addObject("dto",dto);
		mav.addObject("resName",resName);

		return mav;
	}
	
	
	//1.���ο��� �������� �ٷ� ���� ���
	//�������/��¥/�ð�/����/��� ������ ��
	@RequestMapping(value = "/resBookingMain.action", method = RequestMethod.POST)
	public String resBookingMain(HttpServletRequest request, RedirectAttributes redirect ) {
		
		//���ο��� ������ �� ���
		String resName = request.getParameter("resName");
		String checkin = request.getParameter("checkin");
		String time = request.getParameter("time");
		String adult = request.getParameter("adult");
		String children = request.getParameter("children");
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("resName", resName);
		map.put("checkin", checkin);
		map.put("time", time);
		map.put("adult", adult);
		map.put("children", children);
		
		redirect.addFlashAttribute("res", map);
		
		return "redirect:/res-booking.action";
	}
	
	//�׸��� �����Ͽ��� �����ϱ� ������ �ؾ���
	
	
	

	
	//���� ��������!
	//1.���ο��� ���� ���
	//2.�����Ͽ��� ���� ���
	@RequestMapping(value = "/res-booking.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView resBooking (HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("res-booking");

		return mav;
	}
	
	
	//�����������Ϸ��ư ������  - ���೻�� �� ������!
	@RequestMapping(value = "/res-confirm.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String resConfirm(HttpServletRequest request, HttpServletResponse response, RestaurantBookingDTO dto) {
		
		//�����ȣ �������� �����
		int rNum = (int)(Math.random()*999999+1);
		String resBookNo = String.valueOf(rNum);
		dto.setResBookNo(resBookNo);
		
		dao.insertResBooking(dto);
		
		dao.getReadResBooking(resBookNo);

		return "redirect:/res-confirm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
