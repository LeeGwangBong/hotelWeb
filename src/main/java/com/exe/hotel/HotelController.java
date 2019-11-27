package com.exe.hotel;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.exe.dao.EventDAO;
import com.exe.dao.EventReviewDAO;
import com.exe.dao.GalleryDAO;
import com.exe.dao.HotelBookingDAO;
import com.exe.dao.HotelUserDAO;
import com.exe.dao.ReviewDAO;
import com.exe.dao.RoomDAO;
import com.exe.dto.EventBookingDTO;
import com.exe.dto.EventDTO;
import com.exe.dto.EventReviewDTO;
import com.exe.dto.GalleryDTO;
import com.exe.dto.HotelBookingDTO;
import com.exe.dto.HotelUserDTO;
import com.exe.dto.LoginDTO;
import com.exe.dto.ReviewDTO;
import com.exe.dto.RoomDTO;

@Controller
public class HotelController {
	
	@Autowired
	@Qualifier("hotelUserDAO")
	HotelUserDAO userDao;
	
	@Autowired
	@Qualifier("galleryDAO")
	GalleryDAO galleryDao;
	
	@Autowired
	@Qualifier("reviewDAO")
	ReviewDAO reviewDao;
	
	@Autowired
	@Qualifier("eventDAO")
	EventDAO eventDao;
	
	@Autowired
	@Qualifier("eventReviewDAO")
	EventReviewDAO eventReviewDAO;
	
	
	@Autowired
	RoomDAO rdao;

	@Autowired
	HotelBookingDAO hdao;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpServletRequest request) {

		List<GalleryDTO> lists= galleryDao.getList();
		
		request.setAttribute("lists",lists );
		
		return "index";
	}
	
	@RequestMapping(value = "/indexImage", method = RequestMethod.GET)
	public String indexImage(HttpServletRequest request) {

		return "indexImage";
	}
	
	
	//ȸ������
	@RequestMapping(value = "/signup.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView signUp() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("signup");
		
		return mav;
	}
	
	// ������ �μ�Ʈ�ϰ� �Ϸ�Ǿ��ٴ� �������� ���°�
	@RequestMapping(value = "/signup_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String signup_ok(HotelUserDTO dto, HttpServletRequest req, HttpServletResponse res) {

		userDao.insertUser(dto);

		return "redirect:/signupOk.action";
	}

	// ���� �Ϸ�Ǿ��ٰ� �����ִ� �޼���- �α��ι�ư ����
	@RequestMapping(value = "/signupOk.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String signupOk(HttpSession session) {

		return "signupOk";
	}

	//�α���
	@RequestMapping(value = "/login.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(HttpSession session,HttpServletRequest request) {
		
		String referer = request.getHeader("Referer");	//���� ���
		
		request.getSession().setAttribute("redirectURI", referer);
		
		return "login";
	}
	
	@RequestMapping(value = "/login_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login_ok(HotelUserDTO dto,HttpServletRequest request,HttpSession session) {
		
		String userId = dto.getUserId();
		String userPwd = dto.getUserPwd();
		
		ModelAndView mav = new ModelAndView();
		
		HotelUserDTO dto2 = userDao.getReadUserData(userId);
		
		String redirectURI = (String)session.getAttribute("redirectURI");
		//System.out.println(redirectURI);
		
		if(dto2==null || !dto2.getUserPwd().equals(userPwd)) {
			
			mav.setViewName("login");
			mav.addObject("message", "���̵� Ȥ�� ��й�ȣ�� ��Ȯ�� �Է��ϼ���");
			
			return mav;
		}
		
		LoginDTO login = new LoginDTO();
		
		login.setUserId(dto2.getUserId());
		login.setUserName(dto2.getUserName());
		login.setUserEmail(dto2.getEmail());
		login.setTel(dto2.getTel());
		login.setBirth(dto2.getBirth());
		login.setAddr(dto2.getAddr());
		
		session.setAttribute("login", login);
		
		mav.setView(new RedirectView(redirectURI,true));
		
		return mav;
	}
	
	//�α׾ƿ�
	@RequestMapping(value = "/logout.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpServletRequest request, HttpSession session) {
		
		String referer = request.getHeader("Referer");	//���� ���
		
		session.removeAttribute("login");
		
		return "redirect:" + referer;
	}

	//��й�ȣ ã��
	@RequestMapping(value = "/searchPwd.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String searchPwd() {
		
		return "searchPwd";
	}
	
	@RequestMapping(value = "/searchPwd_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView searchPwd_ok(HotelUserDTO dto) {
		
		ModelAndView mav = new ModelAndView();
		
		String userId = dto.getUserId();
		String userTel = dto.getTel();
		
		HotelUserDTO dto2 = userDao.getReadUserData(userId);
		
		mav.setViewName("login");
		
		if (dto==null || !dto2.getTel().equals(userTel)) {
			
			mav.addObject("message", "��ġ�ϴ� ������ �����ϴ�.");
			
			return mav;
		}
		
		mav.addObject("message", "��й�ȣ�� ["+dto2.getUserPwd() + "] �Դϴ�.");
		
		return mav;
	}

	//About Us
	@RequestMapping(value = "/about.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String about() {
		
		return "about";
	}
	
	//Services
	@RequestMapping(value = "/service.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String service() {
		
		return "service";
	}
	
	//Gallery(�̹��� �Խ���)
	@RequestMapping(value = "/gallery.action", method = RequestMethod.GET)
	public ModelAndView gallery() {
		
		ModelAndView mav = new ModelAndView();
		
		List<GalleryDTO> lists = galleryDao.getList();
		
		mav.setViewName("gallery-3");
		mav.addObject("lists", lists);
		
		return mav;
	}

	//�̹��� ���
	@RequestMapping(value = "/galleryUpload.action", method = RequestMethod.GET)
	public String galleryUpload() {
		
		return "galleryUpload";
	}
	
	@RequestMapping(value = "/galleryUpload_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String galleryUpload_ok(
			MultipartHttpServletRequest request, 
			HttpServletRequest req,
			String str) {
		
		MultipartFile file = request.getFile("upload");
		
		String galleryName = req.getParameter("galleryName");
		String content = req.getParameter("content");
		String imageName = file.getOriginalFilename();
		
		GalleryDTO dto = new GalleryDTO();	//db�� ����ְ�
		
		int maxNum = galleryDao.getMaxNum();
		
		dto.setGalleryIndex(maxNum + 1);
		dto.setGalleryName(galleryName);
		dto.setContent(content);
		dto.setImageName(imageName);
		
		galleryDao.insertGallery(dto);
		
		//�������: D:\sts-bundle\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\HotelWebService\gallery
		
		/*
		 * String path = request.getSession() .getServletContext()
		 * .getRealPath("/gallery");
		 */
		
		Path path = Paths.get("D:\\sts-bundle\\work\\HotelWebService\\src\\main\\webapp\\resources\\images\\gallery");
		
		if(file!=null&&file.getSize()>0) { //������ ������

			try {

				FileOutputStream fos =
						new FileOutputStream(path +
								"/" + file.getOriginalFilename());
				InputStream is = file.getInputStream();

				byte[] buffer = new byte[512];

				while(true) {
					
					int data = is.read(buffer,0,buffer.length);

					if(data==-1) { 
						break; 
					}
					fos.write(buffer,0,data);  
				}
				is.close();
				fos.close();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		return "redirect:/gallery.action";
	}

	//���� ����
	@RequestMapping(value = "/pricing.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String pricing() {
		
		return "pricing";
	}

	//���� ���� ����Ʈ
	@RequestMapping(value = "/room-grid.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String roomgrid() {
		
		return "room-grid";
	}
	
	//���� ������
	@RequestMapping(value = "/room-details.action ", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView roomDetails(HttpSession session,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("room-details");
		
		LoginDTO login = (LoginDTO)session.getAttribute("login");
		if(login!=null) {
			HotelUserDTO dto = userDao.getReadUserData(login.getUserId());
			mav.addObject("userDTO", dto);
		}
		
		if(request.getParameter("roomIndex")==null) {
			
			mav.setViewName("404");
			return mav;
		}
		
		int roomIndex = Integer.parseInt(request.getParameter("roomIndex"));
		int countReview = reviewDao.countReview(roomIndex);
		
		RoomDTO dto = rdao.getReadRoomData(roomIndex);
		
		// *****************************************************************************
		// review ���̺� �����Ͽ� review ���� ������ ���� ( ��ĥ �� ����� �� �κп� �־�� ��)
		// ******************************************************************************


		mav.setViewName("room-details");
		mav.addObject("dto",dto); // �ش� �� ��ü �ѱ�

		//����ڰ� �Է��� ���� ���
		mav.addObject("checkin", request.getParameter("checkin"));
		mav.addObject("checkout", request.getParameter("checkout"));
		mav.addObject("adult", request.getParameter("adult"));
		mav.addObject("children", request.getParameter("children"));
		
		List<ReviewDTO> lists = reviewDao.getReviewList(roomIndex);
		
		mav.addObject("lists",lists);
		mav.addObject("roomIndex",roomIndex);
		mav.addObject("countReview", countReview);
		
		return mav;
	}
	
	@RequestMapping(value = "/room-details_ok.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView roomDetails_ok(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="arrList[]") List<Integer> deleteList,
			@RequestParam(value="pricePerNight") int pricePerNight )

	{
		HttpSession session = request.getSession();

		ModelAndView mav = new ModelAndView();		
		int total=0;


		ArrayList<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0;i<deleteList.size();i++){
			deleteArray.add(deleteList.get(i));
		}    

		for(int data:deleteArray) {
			total +=data;
		}		

		mav.setViewName("room-details_ok");		

		mav.addObject("arr", total+pricePerNight);

		session.setAttribute("total",total+pricePerNight); 

		return mav;
	}
	
	//Room-details�� review
	@RequestMapping(value = "/review.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String review(ReviewDTO dto,HttpServletRequest request) {
		
		String referer = request.getHeader("Referer");
		
		int roomIndex = Integer.parseInt(request.getParameter("roomIndex"));
		
		dto.setReviewNum(reviewDao.reviewMaxNum()+1);
		dto.setRoomNum(roomIndex);
		
		reviewDao.insertReviewData(dto);
		
		return "redirect:"+referer;
	}
	
	//Room-details�� review ����
	@RequestMapping(value = "/review-delete.action ", method = {RequestMethod.GET,RequestMethod.POST})
	public String reviewDelete(HttpSession session,HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		
		reviewDao.deleteReviewData(reviewNum);
		
		int roomIndex = Integer.parseInt(request.getParameter("roomIndex"));
		
		return "redirect:"+referer;
	}
	
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public String error() {
		
		return "404";
	}
	
	//�̺�Ʈ ����Ʈ
	@RequestMapping(value = "/event-grid.action", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventgrid() throws Exception {

		ModelAndView mav = new ModelAndView();
		
		List<EventDTO> lists = eventDao.getEventList();
		
		mav.setViewName("event-grid");
		mav.addObject("lists", lists);

		return mav;
	}

	//�̺�Ʈ ������
	@RequestMapping(value = "/event-single.action", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventsingle(
			HttpServletRequest request) throws Exception{
			
		//�ε��� ��ȣ �޳���, 1���� ������ �̾Ƴ��� >> event-single�� �Ѱ��ֱ� 
		ModelAndView mav = new ModelAndView();
		
		int eventIndex = Integer.parseInt(request.getParameter("eventIndex"));
		
		EventDTO dto = eventDao.getReadEventData(eventIndex);//eventIndex�� �ش��ϴ� �ϳ��� ������ �̾Ƴ���
		
		mav.setViewName("event-single");
		mav.addObject("dto",dto);
		
		//�̺�Ʈ ���� ���� ó��
		int countReview = eventReviewDAO.countReview(eventIndex);
		
		List<EventReviewDTO> lists = eventReviewDAO.getReviewList(eventIndex);
		
		mav.addObject("lists",lists);
		mav.addObject("eventIndex",eventIndex);
		mav.addObject("countReview", countReview);
			
		return mav;		
	}

	//�̺�Ʈ ���
	@RequestMapping(value = "/event-upload.action", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView eventupload() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("event-upload"); //event-upload.jsp â������ְ�

		return mav;
	}
		
	@RequestMapping(value = "/event-upload_ok.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String eventupload_ok(EventDTO dto, //dto�� �̺�Ʈ ���ε� ���� �����Ͱ� �Ѿ�´�.
			MultipartHttpServletRequest request, 
			HttpServletResponse response, String str) {

		MultipartFile file = request.getFile("eventUpload");
		
		//�Ѿ���� ��¥ ���� �����ֱ�
		String day = dto.getDay();
		String a[] = day.split("-");
			
		if (a[1].charAt(0)=='0') {
			a[1] = a[1].substring(1);
		}
			
		if (a[2].charAt(0)=='0') {
			a[2] = a[2].substring(1);
		}
		
		day = a[1] + "-" + a[2];	
			
		dto.setEventIndex(eventDao.getMaxNum() +1);
		dto.setDay(day);
		dto.setSavefileName( file.getOriginalFilename());

		eventDao.insertEvent(dto);

		Path path = Paths.get("D:\\sts-bundle\\work\\HotelWebService\\src\\main\\webapp\\resources\\images\\event");

		if(file!=null&&file.getSize()>0) { 

			try {
				
				FileOutputStream fos =
						new FileOutputStream(path+ 
								"/" + file.getOriginalFilename());

				InputStream is = file.getInputStream();

				byte[] buffer = new byte[512];

				while(true) {

					int data = is.read(buffer,0,buffer.length);

					if(data==-1) {
						break;
					}
					
					fos.write(buffer,0,data);
				}
				
				is.close();
				fos.close();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		return "redirect:/event-grid.action";
	}

	//�̺�Ʈ ����
	@RequestMapping(value = "/eventReview.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String eventReview(EventReviewDTO dto,HttpServletRequest request) {
			
		dto.setEventReviewNum(eventReviewDAO.reviewMaxNum()+1); //EventReviewNum ������� ������Ű��
		
		eventReviewDAO.insertReviewData(dto);
		
		return "redirect:event-single.action?eventIndex="+dto.getEventIndex();
	}
	
	//�̺�Ʈ ���� ����
	@RequestMapping(value = "/eventReview-delete.action ", method = {RequestMethod.GET,RequestMethod.POST})
	public String eventReviewDelete(HttpSession session,HttpServletRequest request) {
			
		int eventReviewNum = Integer.parseInt(request.getParameter("eventReviewNum"));
		
		eventReviewDAO.deleteReviewData(eventReviewNum);
		
		int eventIndex = Integer.parseInt(request.getParameter("eventIndex"));
		
		return "redirect:event-single.action?eventIndex=" + eventIndex;
	}

	//�����ϱ�
	@RequestMapping(value = "/contact.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String contact() {
		
		return "contact";
	}
	
	
	
	@RequestMapping(value = "/booking-step1.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView bookingStep1(HttpServletRequest req,
			HttpServletResponse response,Model model) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("booking-step1");	

		mav.addObject("checkin", req.getParameter("checkin"));
		mav.addObject("checkout", req.getParameter("checkout"));
		mav.addObject("adult", req.getParameter("adult"));
		mav.addObject("children", req.getParameter("children"));

		return mav;
	}
	
	@RequestMapping(value = "/booking-step2.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView bookingStep2(HttpServletRequest request,
			HttpServletResponse response) {

		int total =0;
		HttpSession session = request.getSession();

		if(session.getAttribute("total")!=null) {			
			total = (Integer)session.getAttribute("total");
		}

		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");	     

		// ��¥��ȯ
		String dates[] = checkin.split("/"); 
		checkin = dates[2]+"/"+dates[0]+"/"+dates[1]; 

		String dates2[] = checkout.split("/");
		checkout = dates2[2]+"/"+dates2[0]+"/"+dates2[1];

		int interval = hdao.getInterval2(checkin,checkout);	     

		int optionTotal = interval *  total;	

		String [] optionList = request.getParameterValues("optionList2");
		ModelAndView mav = new ModelAndView();

		mav.setViewName("booking-step2");

		//�� ����
		int roomIndex = Integer.parseInt(request.getParameter("roomIndex"));
		RoomDTO dto = rdao.getReadRoomData(roomIndex);

		//����ڰ� �Է��� ���� �״�� ���
		mav.addObject("checkin", request.getParameter("checkin"));
		mav.addObject("checkout", request.getParameter("checkout"));
		mav.addObject("adult", request.getParameter("adult"));
		mav.addObject("children", request.getParameter("children"));
		mav.addObject("total", optionTotal);
		mav.addObject("optionList", optionList[0]);	
		mav.addObject("interval", interval);
		request.setAttribute("total", optionTotal);		

		// ����ڰ� ���� ������ roomIndex
		mav.addObject("roomIndex", roomIndex);	
		mav.addObject("roomType", request.getParameter("roomType"));	

		//������
		mav.addObject("dto", dto);

		return mav;
	}
	
	@RequestMapping(value = "/booking-step2_ok.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView bookingStep2ok(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("booking-step2_ok");		
		return mav;	

	}
	
	/*
	 * @RequestMapping(value = "/booking-step3.action", method =
	 * {RequestMethod.GET,RequestMethod.POST}) public String bookingstep3() {
	 * 
	 * return "booking-step3"; }
	 */
	
	// ���� �Ϸ� ������
	@RequestMapping(value = "/confirmation.action", 		
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView confirmation(HttpServletRequest request,
			HttpServletResponse response,HotelBookingDTO dto) {

		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();

		if(session.getAttribute("login")==null) {

			String referer = request.getHeader("Referer");	//���� ���
			request.getSession().setAttribute("redirectURI", referer);

			mav.setViewName("login");
			return mav;
		}		

		mav.setViewName("confirmation");

		// hotelbooking ���̺� insert
		int bookingNum = hdao.getMaxNum();	    

		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");

		// ��¥��ȯ
		String dates[] = dto.getCheckin().split("/");       
		checkin = dates[2]+"/"+dates[0]+"/"+dates[1]; 

		String dates2[] = dto.getCheckout().split("/");
		checkout = dates2[2]+"/"+dates2[0]+"/"+dates2[1];

		dto.setBookingMessage(request.getParameter("bookingMessage"));
		dto.setCheckin(checkin);
		dto.setCheckout(checkout);
		dto.setBookingId(bookingNum+1); // ������ 
		hdao.insertData(dto);

		// �������� (hotelBookingDTO)
		mav.addObject("dto", dto);
		mav.addObject("total", request.getParameter("total"));

		return mav;	
	}
	
	@RequestMapping(value="/room-list.action", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView roomList(HttpServletRequest request,
			HttpServletResponse response, Model model) {

		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		ModelAndView mav = new ModelAndView();

		// 1. hotelBooking ���̺� ����
		List<HotelBookingDTO> lists =	
				hdao.getRoomLists(checkin, checkout);

		// 2. lists ���� roomIndex ��������
		int[] roomIndex = new int[6]; 
		if(!lists.isEmpty()) {

			Iterator<HotelBookingDTO> it = lists.iterator();
			int i=0;
			while(it.hasNext()) {
				HotelBookingDTO dto = it.next();
				roomIndex[i] = dto.getRoomIndex(); 
				i++;
			}
		}   

		// 3.  ���� �ȵ� roomIndex�� ������ room���̺� ����, select							
		List<RoomDTO> lists2 = rdao.getRoomLists(roomIndex);

		mav.setViewName("room-list");
		mav.addObject("lists", lists2);
		//����ڰ� �Է��� ���� ���
		mav.addObject("checkin", checkin);
		mav.addObject("checkout", checkout);
		mav.addObject("adult", request.getParameter("adult"));
		mav.addObject("children", request.getParameter("children"));

		return mav;
	}
	
	
	//index���� �˻������� form�� ��Ƽ� booking-step1����
	@RequestMapping(value = "/hotelSearch.action", method = RequestMethod.POST)
	public String hotelSearch(HttpServletRequest req) {

		String checkin = req.getParameter("checkin");
		String checkout = req.getParameter("checkout");
		String adult =  req.getParameter("adult");
		String children =  req.getParameter("children");

		return "redirect:/booking-step1.action?checkin="+checkin
				+"&checkout="+checkout+"&adult="+adult+"&children="+children;

	}
	
	//���� ���� ������
	@RequestMapping(value = "/mailSending.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String mailSending(HttpServletRequest req) throws Exception {

        SimpleEmail email = new SimpleEmail();
        
		String userEmail = req.getParameter("userEmail");	//������ ��� �̸���
		String userSubject = req.getParameter("userSubject"); //����
		String userMessage = req.getParameter("userMessage"); //����

        email.setCharset("UTF-8");      //�ѱ�ó��
        email.setHostName("localhost"); //SMTP (������ ���ϼ���) ����
        email.setSmtpPort(25);   //���� 25���� SMTP ��Ʈ

        email.setFrom(userEmail);
        email.addTo("xh2967@naver.com");	//�޴� ��� �̸���
        email.setSubject(userSubject);
        email.setMsg(userMessage);
        
        email.send();
        
        return "index";
    }
	
	@RequestMapping(value = "/restaurantMain.action", method = RequestMethod.GET)
	public String restaurantMain() {

		return "restaurantMain";
	}
	
	
	@RequestMapping(value = "/restaurantConfirm.action", method = RequestMethod.GET)
	public String restaurantConfirm() {

		return "restaurantConfirm";
	}
	
	@RequestMapping(value = "/myeong-details.action", method = RequestMethod.GET)
	public String myeongDetails() {

		return "myeong-details";
	}
	
	

	//event-request.action
		@RequestMapping(value = "/event-request.action", 		
				method= {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView eventRequest(HttpServletRequest request,
				HttpServletResponse response, Model model) {
			
			ModelAndView mav = new ModelAndView();
		
			//1. �̺�Ʈ ��û �� �޾Ƴ��� 
			String userId = request.getParameter("eventUserId");
			String userName = request.getParameter("eventUserName");
			String userRequest  = request.getParameter("eventUserRequest");
			int eventIndex =Integer.parseInt(request.getParameter("eventIndex"));	
			
			//1.���̵�+�̺�Ʈ�ε����� ����� ������ �ִ��� ��ȸ
			EventBookingDTO dto = eventDao.getReadEventBookingData(userId, eventIndex);
			
			if(dto!=null&&!dto.equals(" ")) {
				
				mav.setViewName("event-request-confirmed");
				mav.addObject("dto",dto);
				mav.addObject("message","�̺�Ʈ ������� �̹� �̹������մϴ�");
			
				return mav;	
				
			}
			
			//2ó�� ������ �� ���
			EventBookingDTO ebdto = new EventBookingDTO();
			
			ebdto.setEventBookingNum(eventDao.getBookingMaxNum()+1);
			ebdto.setUserId(userId);
			ebdto.setUserName(userName);
			ebdto.setUserRequest(userRequest);
			ebdto.setEventIndex(eventIndex);
			eventDao.insertEventBooking(ebdto);
			
			EventBookingDTO dto2 = eventDao.getReadEventBookingData(userId, eventIndex);
			
			//4.�ش� ���� ���� ��� jsp�� �Ѱ��ֱ�
			mav.setViewName("event-request-confirmed");
			mav.addObject("dto",dto2);
		
			return mav;			

		}

		//event-booking-delete.action
		@RequestMapping(value = "/event-booking-delete.action", 		
				method= {RequestMethod.GET, RequestMethod.POST})
		public String eventBookingDelete(HttpServletRequest request) {
			
			System.out.println("����");
			
			String referer = request.getHeader("Referer");	//���� ���
			
			int eventBookingNum= Integer.parseInt(request.getParameter("eventBookingNum"));
			System.out.println("eventBookingNum:"+eventBookingNum);
			eventDao.deleteEventBookingData(eventBookingNum);
			
			return "redirect:" + referer;
			
		}
		
		@RequestMapping(value = "/myPage.action", method = {RequestMethod.GET,RequestMethod.POST})
		public String myPage() {
			
			return "myPage";
		}
	
		
		//�̺�Ʈ üũ
		//eventCheck.action
		
		@RequestMapping(value = "/eventCheck.action", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView eventCheck(
				HttpServletRequest request,
				HttpSession session) {
			
			ModelAndView mav  = new ModelAndView();
			
			// ������ �����´�. (������ ������ ���ٸ� �����Ѵ�.)
			
			 
			// "USER"�� ���ε��� ��ü�� �����ش�. ("USER"�� ���ε��� ��ü�� ���ٸ� null)
			LoginDTO login = (LoginDTO)session.getAttribute("login");
		
			String userId = login.getUserId();
			
			
			
			System.out.println("userId: " +userId);
			
			if(login!= null) {
			 
			    // ����� ������ ������ �� �ִ�.
				login.getUserId(); // hong
				login.getUserName(); // ȫ�浿
				
				 userId = login.getUserId();
				System.out.println("userId: " +userId);
			}
			
		
			//1.�̺�Ʈ �������̸� : username
			//2.�̺�Ʈ ��¥: event - day
			//3.�̺�Ʋ �̸�: event = eventTtle 
			
			//����Ʈ �̺�Ʈ ��Ƽ�� 
			
			List<EventDTO> lists = eventDao.getEventListsByUserId(userId);
			
			mav.addObject("elists",lists);
			mav.setViewName("eventCheck");
			
			
			return mav;
		}
		
	
	



}
