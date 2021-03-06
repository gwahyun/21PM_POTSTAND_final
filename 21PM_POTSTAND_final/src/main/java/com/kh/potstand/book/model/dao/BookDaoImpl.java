package com.kh.potstand.book.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.potstand.book.model.vo.Book;
import com.kh.potstand.book.model.vo.Review;
import com.kh.potstand.book.model.vo.Sort;
import com.kh.potstand.member.model.vo.Heart;

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
	//전체리뷰
	@Override
	public List<Review> selectBookReview(SqlSession session, int no) {
		return session.selectList("book.selectBookReview", no);
	}
	//리뷰 페이지바
	@Override
	public List<Review> selectBookReview(SqlSession session, int no, int cPage, int numPerpage) {
		return session.selectList("book.selectBookReview", no, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}
	//리뷰 총 개수
	@Override
	public int selectBookReviewCount(SqlSession session, int no) {
		return session.selectOne("book.selectBookReviewCount", no);
	}

	//내 찜등록
	@Override
	public int bookHeartInsert(SqlSession session, Map param) {
		return session.insert("book.bookHeartInsert", param);
	}

	//찜등록 여부 확인
	@Override
	public Heart bookHeartCheckSelect(SqlSession session, Map param) {
		return session.selectOne("book.bookHeartCheckSelect", param);
	}

	//책 찜삭제
	@Override
	public int bookHeartDelete(SqlSession session, Map param) {
		return session.delete("book.bookHeartDelete",param);
	}
	
	//리뷰등록
	@Override
	public int bookReviewInsert(SqlSession session, Map param) {
		return session.insert("book.bookReviewInsert",param);
	}

	//리뷰를 썻는지 확인
	@Override
	public Review reviewCheckSelect(SqlSession session, Map param) {
		return session.selectOne("book.reviewCheckSelect",param);
	}

	//리뷰수정
	@Override
	public int bookReviewUpdate(SqlSession session, Map param) {
		return session.update("book.bookReviewUpdate", param);
	}

	//리뷰삭제
	@Override
	public int bookReviewDelete(SqlSession session, Map param) {
		return session.delete("book.bookReviewDelete", param);
	}
	
	@Override
	public Map<String, List> searchBookInfo(SqlSession session, Map map) {

		Map answer = new HashMap();
		//	검색결과 책리스트
		answer.put("title", session.selectList("book.searchTitle", map));
		answer.put("writer", session.selectList("book.searchWriter", map));
		answer.put("pub", session.selectList("book.searchPub", map));
		
		//	검색결과 갯수
		List list = new ArrayList(); 
		list.add(session.selectOne("book.searchTitleCount", map));
		list.add(session.selectOne("book.searchWriterCount", map));
		list.add(session.selectOne("book.searchPubCount", map));
		answer.put("twp", list);
		
		return answer;
	}

	@Override
	public List<Book> searchBookInfoMore(SqlSession session, Map map, int cPage, int numPerpage) {
		return session.selectList("book.searchMoreInfo",map,new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int searchBookCount(SqlSession session, Map map) {
		return session.selectOne("book.searchBookCount", map);
	}


	
	
	
	
}
