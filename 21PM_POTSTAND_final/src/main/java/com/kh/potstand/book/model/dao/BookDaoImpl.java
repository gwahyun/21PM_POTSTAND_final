package com.kh.potstand.book.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.potstand.book.model.vo.Book;

public class BookDaoImpl implements BookDao {

	@Override
	public List<Book> selectBookList(SqlSession session) {
		
		return session.selectList("book.selectBookList");
	}

}
