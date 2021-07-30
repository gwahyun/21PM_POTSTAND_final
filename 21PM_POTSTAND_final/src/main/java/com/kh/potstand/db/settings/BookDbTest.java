package com.kh.potstand.db.settings;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.book.model.vo.Sort;

@Controller
public class BookDbTest {
	
	@Autowired
	SqlSession session;
	
	@RequestMapping("/db/bookSetting.do")
	public ModelAndView bookSetting(ModelAndView mv, HttpServletRequest request) throws Exception{
		
		List<Sort> cateList = getCategoryList();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		
		//카테고리 리스트의 길이만큼 반복합니다
		for(int i=0; i<cateList.size();i++) {
			
			//카테고리 리스트의 장르 번호로 100개씩 조회, 필수조건은 목차=1로 고정
			URL url = new URL("https://openapi.naver.com/v1/search/book_adv.xml?&display=100&start=1&d_catg="+cateList.get(i).getSortNo()+"&d_cont=1");
			HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
			httpConn.setRequestMethod("GET");
			//api 키값 설정
			httpConn.setRequestProperty("X-Naver-Client-Id", "qXiAJkWqOslcYfvlzaPf");
			httpConn.setRequestProperty("X-Naver-Client-Secret", "iMyCEe178O");

					InputStream responseStream = httpConn.getResponseCode() / 100 == 2
							? httpConn.getInputStream()
							: httpConn.getErrorStream();
					Scanner s = new Scanner(responseStream).useDelimiter("\\A");
					String response = s.hasNext() ? s.next() : "";

				//documentBuilderFactory 생성 
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				factory.setNamespaceAware(true);
				DocumentBuilder builder=null;
				
				response.replace("<b>", "").replace("</b>", "");
				System.out.println(response);

				try {
					//api의 response를 String result로 가져옵니다
					String result = response.replace("<hr>", "").replace("<b>", "").replace("</b>", "");
					InputSource is = new InputSource(new StringReader(result));

					//xml형식을 읽을 수 있게 문서를 빌드합니다
					builder = factory.newDocumentBuilder();
					Document doc = builder.parse(is);
					XPathFactory xpathFactory = XPathFactory.newInstance();
					XPath xpath = xpathFactory.newXPath();
					//xml안에서 item 엘리먼츠를 모두 가져옵니다
					XPathExpression expr = xpath.compile("//rss/channel/item");
					//가져온 item 엘리먼츠는 노드리스트 형태로 담깁니다.
					NodeList nodeList = (NodeList)expr.evaluate(doc, XPathConstants.NODESET);

					//item이 갖고있는 노드리스트만큼 반복합니다
					for (int j =0; j < nodeList.getLength(); j++) {
						Book b = new Book();
						//item이 갖고있는 child 노드리스트를 가져옵니다
			            NodeList child = nodeList.item(j).getChildNodes();
			            
			            for (int k = 0; k < child.getLength(); k++) {
			                Node node = child.item(k);
			                    
			                switch(node.getNodeName()) {
			                case "title": b.setBookTitle(node.getTextContent());break;
				               case "link": b.setBookLink(node.getTextContent());break;
				               case "image": b.setBookCover(node.getTextContent());break;
				               case "author": b.setBookWriter(node.getTextContent());break;
				               case "price" : b.setBookCost(Integer.parseInt(node.getTextContent()));break;
				               case "publisher" : b.setBookPub(node.getTextContent());break;
				               case "pubdate" : b.setBookDate(new java.sql.Date(format.parse(node.getTextContent()).getTime()));break;
			                 }
			            }
			        String sortNo = cateList.get(i).getSortNo();
			        b.setSort(session.selectOne("function.selectSortByPK",sortNo));
					session.insert("function.insertBook",b);
					CrowlingLink(b.getBookLink());
					
					
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
		}
		mv.addObject("msg","성공.");
		mv.addObject("loc","/dbpage");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	public List getCategoryList(){
		List<Sort> cateList = session.selectList("function.selectSortAll");
		return cateList;
	}
	
	public  void CrowlingLink(String link) {
		Book b = new Book();
	      org.jsoup.nodes.Document doc=null;
	      
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
	    	//  b.setBookIndex("(null)");
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
	    	  b.setRecommand(chooChunPung.next().text().substring(0, 350));
	      }catch(Exception e) {
	      }
	      	
	      //System.out.println("책 소개 : "+introduce.next().text());
	     try {
	    	b.setBookIntro(introduce.next().text().substring(0, 300));
	     }catch(Exception e) {
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
	      }
	      //System.out.println("책속으로 : "+bookIn.next().text());
	      try {
	    	  b.setBookExtract(bookIn.next().text().substring(0, 300));
	      }catch(Exception e) {
	      }
	      int result =0;
	      System.out.println(b);
	      try {
	    	  System.out.println(b.toString());
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

