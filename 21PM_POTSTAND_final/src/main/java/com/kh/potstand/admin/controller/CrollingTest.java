package com.kh.potstand.admin.controller;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.potstand.book.model.vo.Book;

public class CrollingTest {
	
	
	@Autowired
	private static SqlSessionTemplate session;
	
	public static void main(String[] args) {   
				
				int bookNo = 100;
				String str ="이 작품은 고교 총기 난사 사건에서 유일하게 살아남은 생존자인 주인공 소년이 참사 1주기 추도식 다음 날, 학교를 벗어나 하루 동안 배회하는 이야기이다. 참사 이후 학교에서건 집에서건 모든 것에서 예외 취급을 받는 ‘나’는 삶 자체가 번외가 된 기분이다. 주인공이 무작정 길을 나서 만나는 사람들은 하나같이 낯선 이들이지만 이들은 내가 입은 교복을 알아보고 참사에 대해, 추도식에 대해 말한다. 나는 이들이 보내는 관심이 버겁기도 하고, 혼자 살아남은 것에 대한 죄책감과 함께 총기 난사 사건의 가해자 K와 공범 의식을 느끼기도 한다. 삶과 죽음의 욕망이 교차하는 소년의 불안하고 혼란스러운 심리는 무의식과 의식의 경계가 불분명한 속에 과거와 현재를 오가며 총기 난사 사건과 K에 대한 기억을 환기한다. 삶이란 무엇인지 끊임없이 묻는 소년의 독백을 통해 우리는 인간 존재의 모순을 발견한다. 동시에 불가해한 인간 존재에 대한 탁월한 서사를 끌어낸 박지리 작가의 천재성에 또 한번 놀라게 된다.";
				System.out.println(str.length());
				
				//newsCrawling("https://book.naver.com/bookdb/book_detail.nhn?bid=17764815",bookNo);
				
	}
	
	   
	public static void newsCrawling(String url,int bookNo) {
		//newsCrawling("https://book.naver.com/bookdb/book_detail.nhn?bid=17764815",bookNo);
		
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
	    	  b.setBookIndex(index.next().text());
	      }catch(Exception e) {
	      }
	      try {
	    	  //비디오 없는애들 있음
	    	  Iterator<Element> iframe=element.select("iframe").iterator();
	    	 // System.out.println("책소개 영상 : "+iframe.next().absUrl("src"));
	    	  b.setIntroMv(iframe.next().absUrl("src"));
	      }catch(Exception e) {
	      }
	      try {
	    	  Iterator<Element> chooChunPung=element.select("div>h3.order36+p").iterator();
	    	  //System.out.println("추쳔평 : "+chooChunPung.next().text());
	    	  b.setRecommand(chooChunPung.next().text());
	      }catch(Exception e) {
	      }
	      	
	      //System.out.println("책 소개 : "+introduce.next().text());
	      b.setBookIntro(introduce.next().text());
	      try {
	    	  
	    	  //System.out.println("저자 : "+writerIntroduce.next().text());
	    	  b.setWriterIntro(writerIntroduce.next().text());
	      }catch(Exception e) {
	      }
	      //System.out.println("출판사 서평 : "+pubReviewContent.next().text());
	      b.setPubReview(pubReviewContent.next().text());
	      //System.out.println("책속으로 : "+bookIn.next().text());
	      b.setBookExtract(bookIn.next().text());
	      int result =0;
	      System.out.println(b);
	      try {
	    	  
	    	  result = session.update("admin.bookInsertRinkCrowling", b);
	      }catch(Exception e) {
	    	  e.printStackTrace();
	    	  	result = 0;
	      }
      	  System.out.println(result);
	}
}
