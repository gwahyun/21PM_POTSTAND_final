package com.kh.potstand.book.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.book.model.vo.Sort;
import com.kh.potstand.member.model.vo.Heart;

public interface BookService {

	public List<Book> selectBookList(int cPage, int numPerpage);
	public int selectBookCount();
	public Book selectBookInfo(int no);
	List<Review> selectBookReview(int no);
	List<Review> selectBookReview(int no,int cPage,int numPerpage);

	
	//sort LV1~LV4
	List<Sort> selectSortLv1List();
	List<Sort> selectSortLv2List();
	List<Sort> selectSortLv3List();
	List<Sort> selectSortLv4List();
	
	//카테고리 선택 책리스트
	List<Book> selectSortBookList(String sortNo, int cPage, int numPerpage);
	int selectSortBookCount(String sortNo);
	
	//리뷰 총 개수
	int selectBookReviewCount(int no);
	
	//책 찜등록
	int bookHeartInsert(Map param);
	
	//찜등록 여부 확인
	Heart bookHeartCheckSelect(Map param);

	//책 찜삭제
	int bookHeartDelete(@RequestParam Map param);

	//리뷰등록
	int bookReviewInsert(Map param);
	
	//리뷰를 썻는지 확인
	Review reviewCheckSelect(Map param);
	
	//리뷰수정
	int bookReviewUpdate(Map param);
	
	//리뷰삭제
	int bookReviewDelete(Map param);
	
	//책 검색
	public Map<String, List> searchBookInfo(Map map);
	//검색한 결과 수 보여주는 메소드
	public int searchBookCount(Map map);
	//책 카테고리 검색
	public List<Book> searchMoreInfo(Map map, int cPage, int numPerpage);
}
