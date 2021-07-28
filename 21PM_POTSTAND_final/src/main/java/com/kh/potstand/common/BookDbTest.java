package com.kh.potstand.common;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;


class BookDbTest {
	public static void main(String[] args) throws IOException {
//		URL url = new URL("https://openapi.naver.com/v1/search/book.json?display=100&start=1&query= ");
//		
//		HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
//		httpConn.setRequestMethod("GET");
//
//		httpConn.setRequestProperty("X-Naver-Client-Id", "qXiAJkWqOslcYfvlzaPf");
//		httpConn.setRequestProperty("X-Naver-Client-Secret", "iMyCEe178O");
//
//		InputStream responseStream = httpConn.getResponseCode() / 100 == 2
//				? httpConn.getInputStream()
//				: httpConn.getErrorStream();
//		Scanner s = new Scanner(responseStream).useDelimiter("\\A");
//		
//		String response = s.hasNext() ? s.next() : "";
//		System.out.println(response);
		//bookInfo();
	}
	
	public static void parseBookXml() throws IOException{
		
		URL url = new URL("https://openapi.naver.com/v1/search/book_adv.xml?&display=10&start=1&d_catg=100&d_titl=a");
		HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
		httpConn.setRequestMethod("GET");

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
			DocumentBuilder builder;
			Document doc = null;
			try {
			String result = response;
			InputSource is = new InputSource(new StringReader(result));
			builder = factory.newDocumentBuilder();
			doc = (Document) builder.parse(is);
			
			XPathFactory xpathFactory = XPathFactory.newInstance();
			XPath xpath = xpathFactory.newXPath();
			XPathExpression expr = xpath.compile("//item");
			NodeList nodeList = (NodeList)expr.evaluate(doc, XPathConstants.NODESET);
		
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			
	}
	
}

