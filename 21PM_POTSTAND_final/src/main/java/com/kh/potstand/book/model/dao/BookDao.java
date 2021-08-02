package com.kh.potstand.book.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.potstand.book.model.vo.Book;

public interface BookDao {

	public List<Book> selectBookList(SqlSession session);
}
