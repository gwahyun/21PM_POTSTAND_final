package com.kh.potstand.book.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.potstand.book.model.dao.BookDaoImpl;
import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.book.model.vo.Sort;
import com.kh.potstand.member.model.vo.Heart;

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
	
	//sort LV1~LV4
	@Override
	public List<Sort> selectSortLv1List() {
		return dao.selectSortLv1List(session);
	}

	@Override
	public List<Sort> selectSortLv2List() {
		return dao.selectSortLv2List(session);
	}

	@Override
	public List<Sort> selectSortLv3List() {
		return dao.selectSortLv3List(session);
	}

	@Override
	public List<Sort> selectSortLv4List() {
		return dao.selectSortLv4List(session);
	}

	
	//카테고리 선택 책리스트
	@Override
	public List<Book> selectSortBookList(String sortNo, int cPage, int numPerpage) {
		return dao.selectSortBookList(session,sortNo,cPage,numPerpage);
	}

	@Override
	public int selectSortBookCount(String sortNo) {
		return dao.selectSortBookCount(session,sortNo);
	}
	//리뷰전체
	@Override
	public List<Review> selectBookReview(int no) {
		return dao.selectBookReview(session, no);
	}
	//리뷰 페이지바
	@Override
	public List<Review> selectBookReview(int no, int cPage, int numPerpage) {
		return dao.selectBookReview(session,no,cPage,numPerpage);
	}
	//리뷰 총 개수
	@Override
	public int selectBookReviewCount(int no) {
		return dao.selectBookReviewCount(session, no);
	}

	//책 찜등록
	@Override
	public int bookHeartInsert(Map param) {
		return dao.bookHeartInsert(session,param);
	}

	//찜등록 여부 확인
	@Override
	public Heart bookHeartCheckSelect(Map param) {
		return dao.bookHeartCheckSelect(session,param);
	}
	
	//책 찜삭제
	@Override
	public int bookHeartDelete(Map param) {
		return dao.bookHeartDelete(session,param);
	}


	//리뷰등록
	@Override
	public int bookReviewInsert(Map param) {
		return dao.bookReviewInsert(session,param);
	}

	//리뷰를 썻는지 확인
	@Override
	public Review reviewCheckSelect(Map param) {
		return dao.reviewCheckSelect(session,param);
	}

	//리뷰수정
	@Override
	public int bookReviewUpdate(Map param) {
		return dao.bookReviewUpdate(session,param);
	}

	//리뷰삭제
	@Override
	public int bookReviewDelete(Map param) {
		return dao.bookReviewDelete(session,param);
	}
	
	
	//헤더메뉴 책정보 검색
	@Override
	public Map<String, List> searchBookInfo(Map map) {
		return dao.searchBookInfo(session, map);
	}

	//책 더보기 검색
	@Override
	public List<Book> searchMoreInfo (Map map, int cPage, int numPerpage) {
		return dao.searchBookInfoMore(session, map, cPage, numPerpage);
	}
	//검색한 책의 갯수 반환
	@Override
	public int searchBookCount(Map map) {
		return dao.searchBookCount(session, map);
	}

	

}
