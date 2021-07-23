package com.kh.potstand.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.potstand.admin.model.vo.Notice;
import com.kh.potstand.admin.model.vo.Qna;
import com.kh.potstand.member.model.dao.MemberDao;
import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSession session;
	
	//로그인 -> 멤버찾기
	@Override
	public Member memberSelect(Map param) {
		// TODO Auto-generated method stub
		return dao.memberSelect(session,param);
	}

	//회원가입
	@Override
	@Transactional
	public int insertMember(Member m) throws Exception{
		// TODO Auto-generated method stub	
		try {
			int result=dao.memberInsert(session,m);
			if(result>0) {
				List<Address> Addresses=m.getAddresses();
				if(Addresses.size()>0) { //나중에 주소 여러개 저장할때를 대비해서 이렇게 로직짬
					for(Address a :Addresses) {
						result=dao.addressInsert(session,a);
					}
				}else return 0;	
			}else return 0;
		}catch(RuntimeException e) {
			throw new Exception("회원가입에 실패하였습니다.");
		}
		return 1;
	}
	

	
	
	//notice List 호출 (공지사항 페이지)
	@Override
	public List<Notice> noticeSelectList(int cPage, int numPerPage) {
		return dao.noticeSelectList(session, cPage, numPerPage);
	}

	//notice Content 호출
	@Override
	public Notice noticeSelectOne(int noticeNo) {
		return dao.noticeSelectOne(session, noticeNo);
	}

	//내 문의 List 호출
	@Override
	public List<Qna> qnaSelectList(String memberId, int cPage, int numPerPage) {
		return dao.qnaSelectList(session, memberId, cPage, numPerPage);
	}

	//qna Content 호출
	@Override
	public Qna qnaSelectOne(int qnaNo) {
		return dao.qnaSelectOne(session, qnaNo);
	}

	//1:1문의 작성
	@Override
	public int qnaInsert(Qna q) {
		return dao.qnaInsert(session, q);
	}
	
	//notice count : totalData용
	@Override
	public int noticeSelectCount() {
		return dao.noticeSelectCount(session);
	}

	//qna count : totalData용
	@Override
	public int qnaSelectCount(String memberId) {
		return dao.qnaSelectCount(session, memberId);
	}
	
	
	

}
