package com.kh.potstand.common;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Scanner;

import org.springframework.core.io.support.EncodedResource;

class BookDbTest {
	public static void main(String[] args) throws IOException {
		URL url = new URL("https://openapi.naver.com/v1/search/book.json?display=100&start=1&query= ");
		
		HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
		httpConn.setRequestMethod("GET");

		httpConn.setRequestProperty("X-Naver-Client-Id", "qXiAJkWqOslcYfvlzaPf");
		httpConn.setRequestProperty("X-Naver-Client-Secret", "iMyCEe178O");

		InputStream responseStream = httpConn.getResponseCode() / 100 == 2
				? httpConn.getInputStream()
				: httpConn.getErrorStream();
		Scanner s = new Scanner(responseStream).useDelimiter("\\A");
		
		String response = s.hasNext() ? s.next() : "";
		System.out.println(response);
		//bookInfo();
	}
	
	public static void bookInfo() throws IOException{
		
		URL url = new URL("https://openapi.naver.com/v1/search/book_adv.xml?&display=10&start=1&d_catg=100&d_auth=*");
		HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
		httpConn.setRequestMethod("GET");

				httpConn.setRequestProperty("X-Naver-Client-Id", "qXiAJkWqOslcYfvlzaPf");
				httpConn.setRequestProperty("X-Naver-Client-Secret", "iMyCEe178O");

				InputStream responseStream = httpConn.getResponseCode() / 100 == 2
						? httpConn.getInputStream()
						: httpConn.getErrorStream();
				Scanner s = new Scanner(responseStream).useDelimiter("\\A");
				String response = s.hasNext() ? s.next() : "";
				System.out.println(response);
	}

}

