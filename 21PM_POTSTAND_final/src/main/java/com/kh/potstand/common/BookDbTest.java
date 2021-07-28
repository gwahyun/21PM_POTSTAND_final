package com.kh.potstand.common;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
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
		parseBookXml();
	}
	
	public static void parseBookXml() throws IOException{
		
		URL url = new URL("https://openapi.naver.com/v1/search/book_adv.xml?&display=100&start=1&d_catg=100010&d_cont=1");
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
			DocumentBuilder builder=null;

			try {
				String result = response;
				InputSource is = new InputSource(new StringReader(result));
				builder = factory.newDocumentBuilder();
				System.out.println(is.toString());
				Document doc = builder.parse(is);
				
				System.out.println(doc);
				XPathFactory xpathFactory = XPathFactory.newInstance();
				XPath xpath = xpathFactory.newXPath();
				XPathExpression expr = xpath.compile("//rss/channel/item");
				
				NodeList nodeList = (NodeList)expr.evaluate(doc, XPathConstants.NODESET);
				System.out.println(nodeList.getLength());
				
				
				for (int i =0; i < nodeList.getLength(); i++) {
		            NodeList child = nodeList.item(i).getChildNodes();
		            System.out.println(i);
		                for (int j = 0; j < child.getLength(); j++) {
		                    Node node = child.item(j);
		                   
		                    System.out.println("현재 노드 이름 : " + node.getNodeName());
		                    System.out.println("현재 노드 값 : " + node.getTextContent());
		                    System.out.println("");
		                }
				}
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			
	}
	
}

