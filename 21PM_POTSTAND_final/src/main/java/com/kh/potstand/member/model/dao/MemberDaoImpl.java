package com.kh.potstand.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.potstand.member.model.vo.Address;
import com.kh.potstand.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	//로그인 -> 멤버찾기
	@Override
	public Member memberSelect(SqlSession session, Map param) {
		// TODO Auto-generated method stub	
		return session.selectOne("member.memberSelect", param);
	}

	//회원가입
	@Override
	public int memberInsert(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.memberInsert", m);
	}
	@Override
	public int addressInsert(SqlSession session, Address a) {
		// TODO Auto-generated method stub
		return session.insert("member.addressInsert", a);
	}
	
	
}
