package com.kh.potstand.book.model.service;

import java.util.List;

import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.book.model.vo.Sort;

public interface BookService {

	public List<Book> selectBookList(int cPage, int numPerpage);
	public int selectBookCount();
	
	//sort LV1~LV4
	List<Sort> selectSortLv1List();
	List<Sort> selectSortLv2List();
	List<Sort> selectSortLv3List();
	List<Sort> selectSortLv4List();
	
	//카테고리 선택 책리스트
	List<Book> selectSortBookList(String sortNo, int cPage, int numPerpage);
	int selectSortBookCount(String sortNo);
}
