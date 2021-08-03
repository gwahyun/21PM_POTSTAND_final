package com.kh.potstand.book.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.book.model.vo.Sort;

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
	
	//sort LV1~LV4
	@Override
	public List<Sort> selectSortLv1List(SqlSession session) {
		return session.selectList("book.selectSortLv1List");
	}

	@Override
	public List<Sort> selectSortLv2List(SqlSession session) {
		return session.selectList("book.selectSortLv2List");
	}

	@Override
	public List<Sort> selectSortLv3List(SqlSession session) {
		return session.selectList("book.selectSortLv3List");
	}

	@Override
	public List<Sort> selectSortLv4List(SqlSession session) {
		return session.selectList("book.selectSortLv4List");
	}
	
	//카테고리 선택 책리스트
	@Override
	public List<Book> selectSortBookList(SqlSession session, String sortNo, int cPage, int numPerpage) {
		return session.selectList("book.selectSortBookList", sortNo, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int selectSortBookCount(SqlSession session, String sortNo) {
		return session.selectOne("book.selectSortBookCount", sortNo);
	}

	@Override
	public Book selectBookInfo(SqlSession session, int no) {
		return session.selectOne("book.selectBookInfo", no);
	}

	@Override
	public List<Review> selectBookReview(SqlSession session, int no) {
		return session.selectList("book.selectBookReview", no);
	}
	
	
}
