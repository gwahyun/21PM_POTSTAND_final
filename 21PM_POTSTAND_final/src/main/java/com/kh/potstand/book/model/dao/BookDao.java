package com.kh.potstand.book.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.book.model.vo.Sort;

public interface BookDao {

	public List<Book> selectBookList(SqlSession session, int cPage, int numPerpage);
	public int selectBookCount(SqlSession session);
	public Book selectBookInfo(SqlSession session, int no);
	public List<Review> selectBookReview(SqlSession session, int no);
	
	//sort LV1~LV4
	List<Sort> selectSortLv1List(SqlSession session);
	List<Sort> selectSortLv2List(SqlSession session);
	List<Sort> selectSortLv3List(SqlSession session);
	List<Sort> selectSortLv4List(SqlSession session);
	
	//카테고리 선택 책리스트
	List<Book> selectSortBookList(SqlSession session, String sortNo, int cPage, int numPerpage);
	int selectSortBookCount(SqlSession session, String sortNo);
	
	//리뷰 총 개수
	int selectBookReviewCount(SqlSession session, int no);
	
	//책 찜등록
	int bookHeartInsert(SqlSession session, Map param);
	
}
