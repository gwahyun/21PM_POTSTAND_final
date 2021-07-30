package com.kh.potstand.db.settings;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.potstand.book.model.vo.Book;

public class BookLinkCrowling {

	@Autowired
	static SqlSessionTemplate session;
	
	public static void CrowlingLink(String link) {
		Book b = new Book();
	      Document doc=null;
	      
	      try {
	         doc=Jsoup.connect(link).get();
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
	     // System.out.println(b);
	      try {
	    	  //System.out.println(b.toString());
	    	  /*
	    	  session.insert("admin.BI", b);
	    	  session.insert("admin.WI", b);
	    	  session.insert("admin.bookIndex", b);
	    	  session.insert("admin.PUBREVIEW", b);
	    	  session.insert("admin.BOOKEXTRACT", b);
	    	  session.insert("admin.RECOMMAND", b);
	    	  session.insert("admin.INTROMV", b);
	    	  */
	    	  int bookCode = session.selectOne("admin.bookCodeSelectOne");
	    	  b.setBookCode(bookCode);
	    	  result = session.update("admin.bookInsertRinkCrowling", b);
	      }catch(Exception e) {
	    	  e.printStackTrace();
	    	  	result = 0;
	      }
    	  System.out.println(result);
		
	}
}
