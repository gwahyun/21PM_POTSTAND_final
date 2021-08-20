package com.kh.potstand;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.potstand.book.model.service.BookService;
import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.event.model.service.EventService;
import com.kh.potstand.event.model.vo.Event;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private EventService service;
	@Autowired
	private BookService bookService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mv) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		List<Event> eventlist = service.selectEventList();
		List<Book> bookList = bookService.selectSortBookList("120", 1, 20);
		//List<Book> bookListSort = bookService.selectSortBookList("120040", 5, 10);
		
		mv.addObject(eventlist.subList(0, 4));
		mv.addObject(bookList);
		//mv.addObject(bookListSort);
		
		mv.setViewName("index");
		//model.addAttribute("serverTime", formattedDate );
		
		return mv;
	}
	
}
