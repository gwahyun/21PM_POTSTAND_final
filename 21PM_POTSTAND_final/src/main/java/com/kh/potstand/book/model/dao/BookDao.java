package com.kh.potstand.book.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.book.model.vo.Sort;
import com.kh.potstand.member.model.vo.Heart;

public interface BookDao {

	public List<Book> selectBookList(SqlSession session, int cPage, int numPerpage);
	public int selectBookCount(SqlSession session);
	public Book selectBookInfo(SqlSession session, int no);
	List<Review> selectBookReview(SqlSession session, int no);
	List<Review> selectBookReview(SqlSession session, int no,int cPage,int numPerpage);
	
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
	
	//찜등록 여부 확인
	Heart bookHeartCheckSelect(SqlSession session, Map param);
	
	//책 찜삭제
	int bookHeartDelete(SqlSession session, Map param);
	
	//리뷰등록
	int bookReviewInsert(SqlSession session, Map param);
		
	//리뷰를 썻는지 확인
	Review reviewCheckSelect(SqlSession session, Map param);
		
	//리뷰수정
	int bookReviewUpdate(SqlSession session,Map param);
			
	//리뷰삭제
	int bookReviewDelete(SqlSession session,Map param);
		
	
	//책 검색
	public Map<String, List> searchBookInfo(SqlSession session, Map map);
	public List<Book> searchBookInfoMore(SqlSession session, Map map, int cPage, int numPerpage);
	public int searchBookCount(SqlSession session, Map map);
}
