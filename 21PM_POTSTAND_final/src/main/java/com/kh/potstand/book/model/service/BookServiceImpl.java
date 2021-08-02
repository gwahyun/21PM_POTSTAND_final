package com.kh.potstand.book.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.potstand.book.model.dao.BookDaoImpl;
import com.kh.potstand.book.model.vo.Book;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	SqlSession session;
	
	@Autowired
	BookDaoImpl dao;
	
	@Override
	public List<Book> selectBookList(int cPage, int numPerpage) {
		return dao.selectBookList(session, cPage, numPerpage);
	}

	@Override
	public int selectBookCount() {
		return dao.selectBookCount(session);
	}

	@Override
	public Book selectBookInfo(int no) {
		return dao.selectBookInfo(session, no);
	}

}
