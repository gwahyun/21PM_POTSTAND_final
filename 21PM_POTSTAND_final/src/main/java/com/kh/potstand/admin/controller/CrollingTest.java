package com.kh.potstand.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class CrollingTest {
	
	
	public static void main(String[] args) {   
				newsCrawling("https://book.naver.com/bookdb/book_detail.nhn?bid=14030677");
	}
	
	   
	public static void newsCrawling(String url) {
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
	    	  System.out.println("목차 : "+index.next().text());
	      }catch(Exception e) {
	      }
	      try {
	    	  //비디오 없는애들 있음
	    	  Iterator<Element> iframe=element.select("iframe").iterator();
	    	  System.out.println("책소개 영상 : "+iframe.next().absUrl("src"));
	      }catch(Exception e) {
	      }
	      try {
	    	  Iterator<Element> chooChunPung=element.select("div>h3.order36+p").iterator();
	    	  System.out.println("추쳔평 : "+chooChunPung.next().text());
	      }catch(Exception e) {
	      }
	      
	         System.out.println("책 소개 : "+introduce.next().text());
	         System.out.println("저자 : "+writerIntroduce.next().text());
	         System.out.println("출판사 서평 : "+pubReviewContent.next().text());
	         System.out.println("책속으로 : "+bookIn.next().text());
	}
}
