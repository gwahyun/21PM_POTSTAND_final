package com.kh.potstand.book.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.potstand.book.model.dao.BookDaoImpl;
import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.book.model.vo.Sort;

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

}
