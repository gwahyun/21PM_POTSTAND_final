package com.kh.potstand.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.member.model.vo.Member;

public interface MemberDao {

	Member selectMember(SqlSession session,@RequestParam Map param);

	//notice List 호출 (공지사항 페이지)
	List<Notice> noticeSelectList(SqlSession session, int cPage, int numPerPage);
	
	//notice Content 호출
	Notice noticeSelectOne(SqlSession session, int noticeNo);
}
