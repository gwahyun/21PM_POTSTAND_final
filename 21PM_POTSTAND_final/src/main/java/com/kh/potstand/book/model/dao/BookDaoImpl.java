package com.kh.potstand.book.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.potstand.book.model.vo.Book;

@Repository
public class BookDaoImpl implements BookDao {

	@Override
	public List<Book> selectBookList(SqlSession session, int cPage, int numPerpage) {
		
		return session.selectList("book.selectBookList",null,new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int selectBookCount(SqlSession session) {
		
		return session.selectOne("book.selectBookCount");
	}

	@Override
	public Book selectBookInfo(SqlSession session, int no) {
		
		return session.selectOne("book.selectBookInfo", no);
	}

}
