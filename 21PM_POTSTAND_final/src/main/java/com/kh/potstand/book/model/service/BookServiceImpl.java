package com.kh.potstand.book.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.potstand.book.model.dao.BookDaoImpl;
import com.kh.potstand.book.model.vo.Book;

public class BookServiceImpl implements BookService {

	@Autowired
	SqlSession session;
	
	@Autowired
	BookDaoImpl dao;
	
	@Override
	public List<Book> selectBookList() {
		
		return dao.selectBookList(session);
	}

}
