package com.kh.potstand.book.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.potstand.book.model.vo.Book;

public interface BookService {

	public List<Book> selectBookList(int cPage, int numPerpage);
	public int selectBookCount();
	public Book selectBookInfo(int no);
}
