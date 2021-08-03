package com.kh.potstand.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.admin.model.service.AdminService;
import com.kh.potstand.admin.model.vo.Answer;
import com.kh.potstand.admin.model.vo.Credit;
import com.kh.potstand.admin.model.vo.Faq;
import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.admin.model.vo.Request;
import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.common.AES256Util;
import com.kh.potstand.common.PageFactory;
import com.kh.potstand.event.model.vo.Event;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;
import com.kh.potstand.order.model.vo.Cart;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	
	//단방향암호화
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//양방향암호화
	@Autowired
	private AES256Util aes;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private AdminService service;

	@RequestMapping("/admin/adminMain")
	
	public ModelAndView adminMain(
			@RequestParam(value="startDate",defaultValue="") String startDate,
			ModelAndView mv) {
		//차트
		List<String> dateList = service.dateList(startDate);
		//날짜
		String c = "";
		//매출
		String d = "";
		//수량
		String e = "";
		for(String str : dateList) {
			
			c += "'"+str+"',";
			d += service.priceDateList(str)+",";
			e += service.amountDateList(str)+",";
		}
		//System.out.println(dateList);
		mv.addObject("c",c);
		mv.addObject("d", d);
		mv.addObject("e", e);
		//신규 주문,주문확인 등등
		Map<String,String> map = service.dateOne();
		mv.addObject("startDate", map.get("일주일"));
		mv.addObject("endDate", map.get("오늘"));
		
		//최신 리뷰,문의 등등
		mv.addObject("answerNo", service.answerNo());
		mv.addObject("newReview", service.newReview());
		mv.setViewName("admin/adminMain");
		
		/* count들 갖고 올것
		 * Map<String,Object> count = service.orderCountMap();
		 * mv.addObject("count1",count.get("count1"));
		 * mv.addObject("count2",count.get("count2"));
		 * mv.addObject("count3",count.get("count3"));
		 * mv.addObject("count4",count.get("count1"));
		 */
		return mv;
	}
	
	@RequestMapping("/admin/calSelect")
	public ModelAndView calSelect(
			@RequestParam(value="startDate",defaultValue="") String startDate,
			ModelAndView mv) {
		//차트
		List<String> dateList = service.dateList(startDate);
		//날짜
		String c = "";
		//매출
		String d = "";
		//수량
		String e = "";
		for(String str : dateList) {
			
			c += "'"+str+"',";
			d += service.priceDateList(str)+",";
			e += service.amountDateList(str)+",";
		}
		//System.out.println(dateList);
		mv.addObject("c",c);
		mv.addObject("d", d);
		mv.addObject("e", e);
		mv.addObject("sumPrice",service.sumPrice(startDate));
		mv.addObject("list", service.creditDateList(startDate));
		mv.setViewName("admin/calSelect");
		return mv;
	}
	
	@RequestMapping("/admin/productInsert")
	public ModelAndView productInsert(ModelAndView mv) {
		
		mv.setViewName("admin/productInsert");
		return mv;
	}
	
	@RequestMapping("/admin/productInsertEnd")
	public ModelAndView productInsertEnd(
			@RequestParam(value="bookGenre",defaultValue="") String bookGenre,
			Book b,ModelAndView mv) {
		b.setSort(service.bookGenreSelectOne(bookGenre));
		int result = service.productInsertEnd(b);
		mv.addObject("loc", "/admin/productInsert");
		mv.addObject("msg",result>0?"책 등록에 성공하였습니다!":"등록 실패!");
		
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/productSelectList")
	public ModelAndView productSelectList(ModelAndView mv,@RequestParam Map param
			,	@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="300") int numPerpage,
			@RequestParam(value="bookNo",defaultValue="") String bookNo,
			@RequestParam(value="bookTitle",defaultValue="") String bookTitle,
			@RequestParam(value="bookAuthor",defaultValue="") String bookAuthor,
			@RequestParam(value="bookPublisher",defaultValue="") String bookPublisher,
			@RequestParam(value="bookGenre",defaultValue="") String bookGenre) {
		int count = service.productSelectListCount(param);
		mv.addObject("count", count);
		List<Book> list = service.productSelectList(param,cPage,numPerpage);
		mv.addObject("pageBar", PageFactory.getPageBar(count, cPage, numPerpage,5,"productSelectList",
				"bookNo="+bookNo+"&bookTitle="+bookTitle+"&bookAuthor="+bookAuthor+"&bookPublisher="+bookPublisher+"&bookGenre="+bookGenre));
		mv.addObject("list", list);
		mv.setViewName("admin/productSelect");
		return mv;
	}
	
	@RequestMapping("/admin/qnaManager")
	public ModelAndView qnaManager(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.qnaManagerCount();
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"qnaManager"));
		List<Qna> list = service.qnaSelectList(cPage,numPerpage);
		mv.addObject("list", list);
		mv.setViewName("admin/qnaManager");
		return mv;
	}
	
	@RequestMapping("/admin/qnaManagerNo")
	public ModelAndView qnaManagerNo(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.qnaManagerNoCount();
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"qnaManagerNo"));
		List<Qna> list = service.qnaSelectListNo(cPage,numPerpage);
		mv.addObject("list", list);
		mv.setViewName("admin/qnaManager");
		return mv;
	}
	
	@RequestMapping("/admin/qnaReply")
	public ModelAndView qnaReply(ModelAndView mv,int no) {
		Qna q = service.qnaSelectOne(no);
		mv.addObject("q", q);
		mv.setViewName("admin/qnaReply");
		return mv;
	}
	
	@RequestMapping("/admin/qnaReplyUpdate")
	public ModelAndView qnaReplyUpdate(ModelAndView mv,int no) {
		Qna q = service.qnaSelectOne(no);
		Answer a = service.answerSelectOne(no);
		mv.addObject("q", q);
		mv.addObject("a", a);
		mv.setViewName("admin/qnaReplyUpdate");
		return mv;
	}
	
	@RequestMapping("/admin/qnaReplyUpdateEnd")
	public String qnaReplyUpdate(ModelAndView mv,@RequestParam Map param) {
		int result = service.qnaReplyUpdateEnd(param);
		return result>0?"true":"false";
	}
	
	@RequestMapping("/admin/qnaAnswer")
	public String qnaAnswer(@RequestParam Map param,HttpSession session) {
		param.put("memberId", ((Member)session.getAttribute("loginMember")).getMemberId());
		int result = service.qnaAnswer(param);
		return result>0?"true":"false";
	}
	
	
	
	@RequestMapping("/admin/qnaInsert")
	public ModelAndView qnaInsert(ModelAndView mv,@RequestParam Map param,HttpSession session) {
		param.put("memberId", ((Member)session.getAttribute("loginMember")).getMemberId());
		int result = service.qnaInsert(param);
		mv.addObject("msg", result>0?"등록 성공":"등록 실패");
		mv.addObject("loc", "/admin/qnaManager");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/qnaDelete")
	public ModelAndView qnaDelete(ModelAndView mv,int no) {
		int result = service.qnaDelete(no);
		mv.addObject("msg", result>0?"삭제 되었습니다!":"삭제 실패하였습니다!");
		mv.addObject("loc","/admin/qnaManager");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/reviewManager")
	public ModelAndView reviewManager(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.reviewManagerCount();
		List<Review> list = service.reviewManager(cPage,numPerpage);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"reviewManager"));
		mv.addObject("list", list);
		mv.setViewName("admin/reviewManager");
		return mv;
	}
	
	@RequestMapping("/admin/reviewDelete")
	public ModelAndView reviewDelete(ModelAndView mv,int no) {
		int result = service.reviewDelete(no);
		mv.addObject("msg", result>0?"삭제 되었습니다!":"삭제 실패하였습니다!");
		mv.addObject("loc","/admin/reviewManager");
		mv.setViewName("common/msg");
		return mv;
	}


	@RequestMapping("/admin/noticeInsert")
	public ModelAndView noticeInsert(ModelAndView mv) {
		
		mv.setViewName("admin/noticeInsert");
		return mv;
	}
	
	@RequestMapping("/admin/noticeInsertEnd")
	public ModelAndView noticeInsertEnd(ModelAndView mv,@RequestParam Map param,HttpSession session) {
		param.put("memberId", ((Member)session.getAttribute("loginMember")).getMemberId());
		int result = service.noticeInsert(param);
		mv.addObject("msg", result>0?"등록 되었습니다!":"등록 실패하였습니다!");
		mv.addObject("loc","/admin/noticeSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/noticeUpdate")
	public ModelAndView noticeUpdate(ModelAndView mv,int no) {
		Notice n = service.noticeUpdate(no);
		mv.addObject("n", n);
		mv.setViewName("admin/noticeUpdate");
		return mv;
	}
	
	@RequestMapping("/admin/noticeUpdateEnd")
	public ModelAndView noticeUpdateEnd(ModelAndView mv,@RequestParam Map param,HttpSession session) {
		param.put("memberId", ((Member)session.getAttribute("loginMember")).getMemberId());
		int result = service.noticeUpdateEnd(param);
		mv.addObject("msg", result>0?"수정 되었습니다!":"수정 실패하였습니다!");
		mv.addObject("loc","/admin/noticeSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/noticeSelect")
	public ModelAndView noticeSelect(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.noticeSelectCount();
		List<Notice> list = service.noticeSelect(cPage,numPerpage);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"noticeSelect"));
		mv.addObject("list", list);
		mv.setViewName("admin/noticeSelect");
		return mv;
	}
	
	@RequestMapping("/admin/noticeDelete")
	public ModelAndView noticeDelete(ModelAndView mv,int no) {
		int result = service.noticeDelete(no);
		mv.addObject("msg", result>0?"삭제 되었습니다!":"삭제 실패하였습니다!");
		mv.addObject("loc","/admin/noticeSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping("/admin/faqInsert")
	public ModelAndView faqInsert(ModelAndView mv) {
		
		mv.setViewName("admin/faqInsert");
		return mv;
	}
	
	@RequestMapping("/admin/faqInsertEnd")
	public ModelAndView faqInsertEnd(ModelAndView mv,@RequestParam Map param) {
		int result = service.faqInsert(param);
		mv.addObject("msg", result>0?"등록 되었습니다!":"등록 실패하였습니다!");
		mv.addObject("loc","/admin/faqSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/faqSelect")
	public ModelAndView faqSelect(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.faqSelectCount();
		List<Faq> list = service.faqSelect(cPage,numPerpage);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"faqSelect"));
		mv.addObject("list", list);
		mv.setViewName("admin/faqSelect");
		return mv;
	}
	
	@RequestMapping("/admin/faqUpdate")
	public ModelAndView faqUpdate(ModelAndView mv,int no) {
		Faq f = service.faqUpdate(no);
		mv.addObject("f", f);
		mv.setViewName("admin/faqUpdate");
		return mv;
	}
	
	@RequestMapping("/admin/faqUpdateEnd")
	public ModelAndView faqUpdateEnd(ModelAndView mv,@RequestParam Map param) {
		int result = service.faqUpdateEnd(param);
		mv.addObject("msg", result>0?"수정 되었습니다!":"수정 실패하였습니다!");
		mv.addObject("loc","/admin/faqSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/faqDelete")
	public ModelAndView faqDelete(ModelAndView mv,int no) {
		int result = service.faqDelete(no);
		mv.addObject("msg", result>0?"삭제 되었습니다!":"삭제 실패하였습니다!");
		mv.addObject("loc","/admin/faqSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/eventInsert")
	public ModelAndView eventInsert(ModelAndView mv) {
		
		mv.setViewName("admin/eventInsert");
		return mv;
	}
	
	@RequestMapping("/admin/eventInsertEnd")
	public ModelAndView eventInsertEnd(ModelAndView mv,Event e,MultipartFile upFile
			,HttpServletRequest req
			,@RequestParam(value="parentValue") String parentValue) {
		
		String path = req.getServletContext().getRealPath("/resources/upload/event/");
		File dir = new File(path); // 폴더
		if(!dir.exists()) dir.mkdirs(); //폴더가 존재하지 않으면 폴더 생성
		
			if(!upFile.isEmpty()) { //-> 파일이 있니 ? 있으면 실행
				String oriFilename = upFile.getOriginalFilename();
				String ext = oriFilename.substring(oriFilename.lastIndexOf("."));
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndNum = (int)(Math.random()*10000);
				String reName = sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
				
				try {
					upFile.transferTo(new File(path+reName));
					e.setEventThum(reName);
				}catch(IOException e2) {
					e2.printStackTrace();
				}
				
			}
		String msg="등록성공";
		try {
			service.eventInsertEnd(e);
		}catch(Exception e2) {
			msg="등록실패";
			//msg=e.getMessage();
		}
		try {
			String[] strArr = parentValue.split(",");
			for(int i=0; i<strArr.length; i++) {
				service.eventBookInsert(strArr[i]);
			}
		}catch(Exception e2) {
			if(msg.equals("등록성공"))
			msg ="등록에 성공했고 이벤트에 해당하는 책은 없습니다!";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc", "/admin/eventSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	

	@RequestMapping("/admin/eventUpdate")
	public ModelAndView eventUpdate(ModelAndView mv,int no) {
		Event e = service.eventSelectOne(no);
		String str ="";
		List<String> list = service.eventBookList(no);
		str = String.join(",", list);
		mv.addObject("str", str);
		mv.addObject("e", e);
		mv.setViewName("admin/eventUpdate");
		return mv;
	}
	@RequestMapping("/admin/eventSelect")
	public ModelAndView eventSelect(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv) {
		int totalData = service.eventSelectCount();
		int result = service.eventEndUpdate();
		List<Event> list = service.eventSelect(cPage,numPerpage);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"eventSelect"));
		mv.addObject("list", list);
		mv.setViewName("admin/eventSelect");
		return mv;
	}
	
	
	@RequestMapping("/admin/eventSelectBook")
	public ModelAndView eventSelectBook(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="300") int numPerpage,
			@RequestParam Map param,
			ModelAndView mv,
			@RequestParam(value="searchKeyword",defaultValue="") String searchKeyword,
			@RequestParam(value="searchType",defaultValue="") String searchType) {
		int totalData = service.eventSelectCount(param);
		List<Book> list = service.eventBookSelectList(param,cPage,numPerpage);
		mv.addObject("list", list);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"eventSelectBook","searchType="+searchType+"&searchKeyword="+searchKeyword));
		mv.addObject("count", totalData);
		mv.setViewName("admin/eventSelectBook");
		return mv;
	}
	/*
	 * @RequestMapping("/admin/eventEnd")
	 * 
	 * @ResponseBody public int eventEnd(int no) { int result =
	 * service.eventEnd(no); return result; }
	 */
	
	@RequestMapping("/admin/eventUpdateEnd")
	public ModelAndView eventUpdateEnd(Event e,HttpServletRequest req,MultipartFile upFile,String oldFile
			,ModelAndView mv
			,@RequestParam(value="parentValue") String parentValue) {
		String path = req.getServletContext().getRealPath("/resources/upload/event/");
		File dir = new File(path); // 폴더
		if(!dir.exists()) dir.mkdirs(); //폴더가 존재하지 않으면 폴더 생성
		
			if(!upFile.isEmpty()) { //-> 파일이 있니 ? 있으면 실행
				File del1 = new File(path+oldFile);
				del1.delete();
				String oriFilename = upFile.getOriginalFilename();
				String ext = oriFilename.substring(oriFilename.lastIndexOf("."));
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndNum = (int)(Math.random()*10000);
				String reName = sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
				
				try {
					upFile.transferTo(new File(path+reName));
					e.setEventThum(reName);
				}catch(IOException e1) {
					e1.printStackTrace();
				}
				
			}
		String msg="수정성공";
		Map<String,Object> param = new HashMap();
		param.put("eventNo", e.getEventNo());
		session.delete("admin.eventNoBookDelete", param);
		
		try {
			service.eventUpdateEnd(e);
			
		}catch(Exception e1) {
			e1.printStackTrace();
			msg="수정실패";
			//msg=e.getMessage();
		}
		try {
			if(parentValue!=null) {
				String[] strArr = parentValue.split(",");
				for(int i=0; i<strArr.length; i++) {
					param.put("string", strArr[i]);
					service.eventBookUpdate(param);
				}
			}else {
				msg="아무것도 없네용";
			}
		}catch(Exception e1) {
			if(msg.equals("수정성공"))
			msg="수정엔 성공했고 이벤트에 해당하는 책은 없습니다!";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", "/admin/eventSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/eventDelete")
	public ModelAndView eventDelete(ModelAndView mv,int no,HttpServletRequest req) {
		String path = req.getServletContext().getRealPath("/resources/upload/");
		File dir = new File(path); // 폴더
		if(!dir.exists()) dir.mkdirs(); //폴더가 존재하지 않으면 폴더 생성
		Event e = service.eventSelectOne(no);
		File del1 = new File(path+e.getEventThum());
		del1.delete();
		int result = service.eventDelete(no);
		mv.addObject("msg", result>0?"삭제성공":"삭제실패");
		mv.addObject("loc", "/admin/eventSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	
	@RequestMapping("/admin/memberSelect")
	public ModelAndView memberSelect(
			@RequestParam Map param,
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="30") int numPerpage,
			ModelAndView mv) {
		int totalData = service.memberSelectCount(param);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"memberSelect"));
		List<Member> list = service.memberSelect(cPage,numPerpage,param);
		
		for(Member m : list) {
			try {
	               List<Address> ad=new ArrayList<Address>();
		               for(Address a : m.getAddresses()) {
		                  a.setPostNo(aes.decrypt(a.getPostNo()));
		                  a.setRoadAddr(aes.decrypt(a.getRoadAddr()));
		                  a.setOldAddr(aes.decrypt(a.getOldAddr()));
		                  a.setDetailAddr(aes.decrypt(a.getDetailAddr()));
		                  ad.add(a);
		               }
		               m.setAddresses(ad);
				m.setMemberEmail(aes.decrypt(m.getMemberEmail()));
				m.setMemberPhone(aes.decrypt(m.getMemberPhone()));
			}catch(Exception e) {
			}
		}
		mv.addObject("count",totalData); 
		mv.addObject("list", list);
		mv.setViewName("admin/memberSelect");
		return mv;
	}
	
	@RequestMapping("/admin/memberDelete")
	public ModelAndView memberDelete(ModelAndView mv,String memberId) {
		int result = service.memberDelete(memberId);
		mv.addObject("msg", result>0?"삭제 되었습니다!":"삭제 실패하였습니다!");
		mv.addObject("loc","/admin/memberSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping("/admin/stockManager")
	public ModelAndView stockManager(
			@RequestParam Map param,
			@RequestParam(value="searchType",defaultValue="") String searchType,
			@RequestParam(value ="searchKeyword",defaultValue="") String searchKeyword,
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="100") int numPerpage,
			ModelAndView mv
			) {
		int totalData = service.stockManagerCount(param);
		mv.addObject("count", totalData);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"stockManager","searchType="+searchType+"&searchKeyword="+searchKeyword));
		List<Book> list = service.stockManagerList(cPage,numPerpage,param);
		mv.addObject("list", list);
		mv.setViewName("admin/stockManager");
		return mv;
	}
	
	@RequestMapping("/admin/stockUpdate")
	public ModelAndView stockUpdate(ModelAndView mv,@RequestParam Map param) {
		
		int result = service.stockUpdate(param);
		mv.addObject("msg", result>0?"재고충전 완료!":"재고충전 실패!");
		mv.addObject("loc", "/admin/stockManager");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/admin/requestSelect")
	public ModelAndView requestSelect(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="100") int numPerpage,
			ModelAndView mv,
			@RequestParam Map param,
			@RequestParam(value="searchKeyword",defaultValue="") String searchKeyword,
			@RequestParam(value="searchType",defaultValue="") String searchType) {
		int totalData = service.requestSelectCount(param);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"requestSelect","searchType="+searchType+"&searchKeyword="+searchKeyword));
		List<Request> list = service.requestSelect(cPage,numPerpage,param);
		mv.addObject("count", totalData);
		mv.addObject("list", list);
		mv.setViewName("admin/requestSelect");
		return mv;
	}
	
	@RequestMapping("/admin/requestSelectNo")
	public ModelAndView requestSelectNo(
			@RequestParam(value ="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="100") int numPerpage,
			ModelAndView mv,
			@RequestParam Map param,
			@RequestParam(value="searchKeyword",defaultValue="") String searchKeyword,
			@RequestParam(value="searchType",defaultValue="") String searchType) {
		int totalData = service.requestSelectNoCount(param);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerpage,5,"requestSelectNo","searchType="+searchType+"&searchKeyword="+searchKeyword));
		List<Request> list = service.requestSelectNo(cPage,numPerpage,param);
		mv.addObject("count", totalData);
		mv.addObject("list", list);
		mv.setViewName("admin/requestSelect");
		return mv;
	}
	
	
	
	@RequestMapping("/admin/requestUpdate")
	public ModelAndView requestUpdate(ModelAndView mv,@RequestParam Map param) {
		
		int result = service.requestUpdate(param);
		mv.addObject("msg", result>0?"요청 완료!":"요청 실패!");
		mv.addObject("loc", "/admin/requestSelect");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/admin/crol")
	public ModelAndView crol(ModelAndView mv,
			@RequestParam(value="url1",defaultValue="") String url1) {
		System.out.println(url1);
		int bookNo = 2;
		//newsCrawling("https://book.naver.com/bookdb/book_detail.nhn?bid=17764815",bookNo);
		
		String url = url1;
		Book b = new Book();
		  b.setBookCode(bookNo);
	      Document doc=null;
	      
	      try {
	         doc=Jsoup.connect(url).get();
	      }catch(IOException e) {
	      }
	      
	      Elements element=doc.select("div#content");	    
	      
	      //책소개
	      Iterator<Element> introduce=element.select("div#bookIntroContent>p").iterator();
	      //저자소개
	      Iterator<Element> writerIntroduce=element.select("div#authorIntroContent").iterator();
	      //출판사 서평
	      Iterator<Element> pubReviewContent=element.select("div#pubReviewContent").iterator();
	      //책 속으로
	      Iterator<Element> bookIn=element.select("div>h3.order35+p ").iterator();
	  
	      try {
	    	  //목차 없는애들 있음
	    	  Iterator<Element> index=element.select("div#contentContent").iterator();
	    	 // System.out.println("목차 : "+index.next().text());
	    	  b.setBookIndex(index.next().text().substring(0, 350));
	      }catch(Exception e) {
	    	  b.setBookIndex("null");
	      }
	      try {
	    	  //비디오 없는애들 있음
	    	  Iterator<Element> iframe=element.select("iframe").iterator();
	    	 // System.out.println("책소개 영상 : "+iframe.next().absUrl("src"));
	    	  b.setIntroMv(iframe.next().absUrl("src"));
	      }catch(Exception e) {
	    	  b.setIntroMv("null");
	      }
	      try {
	    	  Iterator<Element> chooChunPung=element.select("div>h3.order36+p").iterator();
	    	  //System.out.println("추쳔평 : "+chooChunPung.next().text());
	    	  b.setRecommand(chooChunPung.next().text().substring(0, 350));
	      }catch(Exception e) {
	    	  b.setRecommand("null");
	      }
	      	
	      //System.out.println("책 소개 : "+introduce.next().text());
	     try {
	    	b.setBookIntro(introduce.next().text().substring(0, 200));
	     }catch(Exception e) {
	    	 b.setBookIntro("null");
	     }
	      try {
	    	  
	    	  //System.out.println("저자 : "+writerIntroduce.next().text());
	    	  b.setWriterIntro(writerIntroduce.next().text().substring(0, 350));
	      }catch(Exception e) {
	      }
	      //System.out.println("출판사 서평 : "+pubReviewContent.next().text());
	      try {
	    	  b.setPubReview(pubReviewContent.next().text().substring(0, 300));
	      }catch(Exception e) {
	    	  b.setPubReview("null");
	      }
	      //System.out.println("책속으로 : "+bookIn.next().text());
	      try {
	    	  b.setBookExtract(bookIn.next().text().substring(0, 300));
	      }catch(Exception e) {
	    	  b.setBookExtract("null");
	      }
	      int result =0;
	      System.out.println(b);
	      try {
	    	  System.out.println(b.toString());
	    	  /*
	    	  session.insert("admin.BI", b);
	    	  session.insert("admin.WI", b);
	    	  session.insert("admin.bookIndex", b);
	    	  session.insert("admin.PUBREVIEW", b);
	    	  session.insert("admin.BOOKEXTRACT", b);
	    	  session.insert("admin.RECOMMAND", b);
	    	  session.insert("admin.INTROMV", b);
	    	  */
	    	  result = session.update("admin.bookInsertRinkCrowling", b);
	      }catch(Exception e) {
	    	  e.printStackTrace();
	    	  	result = 0;
	      }
      	  System.out.println(result);
		
      	mv.setViewName("admin/adminMain");
		return mv;
	}
	
	@RequestMapping("/admin/orderSelectList")
	public ModelAndView orderSelectList(ModelAndView mv,@RequestParam Map param) {
		
		List<Credit> list = session.selectList("admin.orderSelectList", param);
		int count = session.selectOne("admin.orderSelectListCount", param);
		mv.addObject("list", list);
		mv.addObject("count", count);
		mv.setViewName("admin/orderCheck");
		return mv;
	}
	
	//카트 부분인데 충돌날까봐 일단 여기다 둠
	@RequestMapping("/cartInsert.do")
	@ResponseBody
	public boolean cartInsert(
			@RequestParam Map param,
			HttpSession session,
			String bookCode
			) {
		int result = 0;
		param.put("memberId", ((Member)session.getAttribute("loginMember")).getMemberId());
		Cart c = service.cartSelectDistinct(param);
		
		if(c==null) {
			result = service.cartInsert(param);
		}else {
			result = service.cartSelectOnePlus(param);
		}
		return result>0?true:false;
	}
	
	
	
	
	
}
